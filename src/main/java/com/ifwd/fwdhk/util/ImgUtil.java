package com.ifwd.fwdhk.util;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.security.AccessController;
import java.security.PrivilegedAction;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;

public class ImgUtil {

	private static final Logger logger = LoggerFactory.getLogger(ImgUtil.class);
	
	public static void changeImageToJPG(File fromFile,File toFile,HttpServletRequest request)throws ECOMMAPIException,Exception{
		
			BufferedImage bufferedImage = ImageIO.read(fromFile);
			String imgMaxWidth = UserRestURIConstants.getConfigs("imgMaxWidth");
			String imgMaxHeight = UserRestURIConstants.getConfigs("imgMaxHeight");
			String imgMaxRatio = UserRestURIConstants.getConfigs("imgMaxRatio");
			int width = bufferedImage.getWidth();   
		    int height = bufferedImage.getHeight(); 
		    double ratio = width*1.0/height;
		    if(ratio > Integer.valueOf(imgMaxRatio) || ratio < 1.0/Integer.valueOf(imgMaxRatio)){
		    	throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.length.width",request));
		    }
		    if(width > Integer.valueOf(imgMaxWidth)){
		    	throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.size.limit.error",request));
		    }
		    if(height > Integer.valueOf(imgMaxHeight)){
		    	throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.size.limit.error",request));
		    }
			      // create a blank, RGB, same width and height, and a white background
			BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
			            bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
			newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
			      // write to jpeg file
			ImageIO.write(newBufferedImage, "jpg", toFile);
	
//			fromFile.delete();
	}
	
	public static File ImageToPdfToJPG(String imageUr,String mOutputPdfFileName,File toFile,HttpServletRequest request)throws ECOMMAPIException,Exception { 
		BufferedImage bufferedImage = ImageIO.read(new File(imageUr));
		String imgMaxWidth = UserRestURIConstants.getConfigs("imgMaxWidth");
		String imgMaxHeight = UserRestURIConstants.getConfigs("imgMaxHeight");
		String imgMaxRatio = UserRestURIConstants.getConfigs("imgMaxRatio");
		int width = bufferedImage.getWidth();   
	    int height = bufferedImage.getHeight(); 
	    double ratio = width*1.0/height;
	    if(ratio > Integer.valueOf(imgMaxRatio) || ratio < 1.0/Integer.valueOf(imgMaxRatio)){
	    	throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.length.width",request));
	    }
	    if(width > Integer.valueOf(imgMaxWidth)){
	    	throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.size.limit.error",request));
	    }
	    if(height > Integer.valueOf(imgMaxHeight)){
	    	throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.size.limit.error",request));
	    }
	    bufferedImage.flush();
	    
        Document doc = new Document(PageSize.A4, 20, 20, 20, 20); 
        File mOutputPdfFile = null;
        FileOutputStream fo = new FileOutputStream(mOutputPdfFileName);
        try { 
            PdfWriter.getInstance(doc, fo); 
            doc.open(); 
            doc.newPage(); 
            doc.add(new Paragraph("")); 
            Image png1 = Image.getInstance(imageUr); 
            float heigth1 = png1.getHeight(); 
            float width1 = png1.getWidth(); 
            int percent = getPercent2(heigth1, width1); 
            png1.setAlignment(Image.MIDDLE); 
            png1.scalePercent(percent+3);// 表示是原来图像的比例; 
            doc.add(png1); 
            doc.close(); 
            fo.close();
        mOutputPdfFile = new File(mOutputPdfFileName); 
        if (!mOutputPdfFile.exists()) { 
            mOutputPdfFile.deleteOnExit(); 
            return null; 
        } 
        mOutputPdfFile.createNewFile();
        pdfToJpg(mOutputPdfFile,toFile,request);
        } catch (ECOMMAPIException e) {
			throw new ECOMMAPIException(e.getMessage());
		} catch (FileNotFoundException e) { 
            e.printStackTrace(); 
        } catch (DocumentException e) { 
            e.printStackTrace(); 
        } catch (IOException e) { 
            e.printStackTrace(); 
        } 
        return mOutputPdfFile; 
    } 
	
	private static void pdfToJpg(File file,File toFile,HttpServletRequest request) throws Exception {
		 // load a pdf from a byte buffer  
        RandomAccessFile raf = new RandomAccessFile(file, "r");  
        FileChannel channel = raf.getChannel();  
        ByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel  
                .size());  
        PDFFile pdffile = new PDFFile(buf);  
       
        for (int i = 1; i <= pdffile.getNumPages(); i++) {  
            // draw the first page to an image  
            PDFPage page = pdffile.getPage(i);  
 
            // get the width and height for the doc at the default zoom  
            Rectangle rect = new Rectangle(0, 0, (int) page.getBBox()  
                    .getWidth(), (int) page.getBBox().getHeight());  
 
            // generate the image  
            java.awt.Image img = page.getImage(rect.width, rect.height,rect,null,true,true);  
 
            BufferedImage tag = new BufferedImage(rect.width, rect.height,  
                    BufferedImage.TYPE_INT_RGB);  
            tag.getGraphics().drawImage(img, 0, 0, rect.width, rect.height,  
                    null); 

    		ImageIO.write(tag, "jpg", toFile);
          
        }
        unmap(buf);
        channel.close();
        raf.close();
        file.delete();
	
	  }
	
	
	public static <T> void unmap(final Object buffer) {
	    AccessController.doPrivileged(new PrivilegedAction<T>(){
	        @SuppressWarnings("restriction")
			@Override
	    public T run() {                
	        try {
	        Method getCleanerMethod = buffer.getClass().getMethod("cleaner", new Class[0]);
	        getCleanerMethod.setAccessible(true);
	        sun.misc.Cleaner cleaner = (sun.misc.Cleaner) getCleanerMethod.invoke(buffer, new Object[0]);
	        cleaner.clean();
	        } catch(Exception e) {
	            e.printStackTrace();
	        }               
	        return null;
	    }           
	    });
	}
	
	/**
     * 第一种解决方案 在不改变图片形状的同时，判断，如果h>w，则按h压缩，否则在w>h或w=h的情况下，按宽度压缩
     *
     * @param h
     * @param w
     * @return
     */ 
   
    public static int getPercent(float h, float w) { 
        int p = 0; 
        float p2 = 0.0f; 
        if (h > w) { 
            p2 = 297 / h * 100; 
        } else { 
            p2 = 210 / w * 100; 
        } 
        p = Math.round(p2); 
        return p; 
    } 
   
    /**
     * 第二种解决方案，统一按照宽度压缩 这样来的效果是，所有图片的宽度是相等的，自我认为给客户的效果是最好的
     *
     * @param args
     */ 
    public static int getPercent2(float h, float w) { 
        int p = 0; 
        float p2 = 0.0f; 
        p2 = 530 / w * 100; 
        p = Math.round(p2); 
        return p; 
    } 
    
    /**
     * 把图片印刷到图片上
     * 
     * @param pressImg --
     *            水印文件
     * @param targetImg --
     *            目标文件
     * @param x
     *            --x坐标
     * @param y
     *            --y坐标
     */
    public final static void pressImage(File pressImg, File targetImg,
            int x, int y) {
        try {
            //目标文件
            java.awt.Image src = ImageIO.read(targetImg);
            int wideth = src.getWidth(null);
            int height = src.getHeight(null);
            BufferedImage image = new BufferedImage(wideth, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics g = image.createGraphics();
            g.drawImage(src, 0, 0, wideth, height, null);
 
            //水印文件
            java.awt.Image src_biao = ImageIO.read(pressImg);
            int wideth_biao = src_biao.getWidth(null)/2;
            int height_biao = src_biao.getHeight(null)/2;
            g.drawImage(src_biao, (wideth - wideth_biao) / 2,0, wideth_biao, height_biao, null);
            //水印文件结束
            g.dispose();
            FileOutputStream out = new FileOutputStream(targetImg);
            com.sun.image.codec.jpeg.JPEGImageEncoder encoder = com.sun.image.codec.jpeg.JPEGCodec.createJPEGEncoder(out);
            encoder.encode(image);
            out.close();
        } catch (Exception e) {
        	logger.error(ExceptionUtils.getStackTrace(e));
        	throw new RuntimeException(e);
        }
    }



}

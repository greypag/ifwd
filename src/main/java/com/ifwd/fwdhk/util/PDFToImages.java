package com.ifwd.fwdhk.util;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.qoppa.pdfImages.PDFImages;

public class PDFToImages {
	
	public static void  saveAsJpg(String path,String pdf,String outImage)throws Exception{
	    PDFImages pdfDoc = new PDFImages (path+pdf, null);
	    PDFImages.setKey(UserRestURIConstants.getConfigs("pdfImagesKey"));
		File[] files = new File[pdfDoc.getPageCount()];
	    for (int count = 0; count < pdfDoc.getPageCount(); ++count){
	    	String name = path + count + ".jpg";
	        pdfDoc.savePageAsJPEG(count,name , 150, 0.8f);
	        files[count] = new File(name);
	    }
	    makeUpOneImg(path,files,outImage);
	}
	 public static void makeUpOneImg(String path,File[] files, String newFileName) throws Exception {
	        BufferedImage[] imgs = new BufferedImage[files.length];
	        for (int i = 0; i < files.length; i++) {
	            imgs[i] = ImageIO.read(files[i]);
	        }
	        int width = imgs[0].getWidth();
	        int height = imgs[0].getHeight();
	        int[] imgArray = new int[width * height];
	        BufferedImage imgNew = new BufferedImage(width, height * files.length, BufferedImage.TYPE_INT_RGB);
	        for (int i = 0; i < imgs.length; i++) {
	            imgs[i].getRGB(0, 0, width, height, imgArray, 0, width);
	            imgNew.setRGB(0, height * i, width, height, imgArray, 0, width);
	        }
	        File outFile = new File(path + newFileName);
	        ImageIO.write(imgNew, "jpg", outFile);// 写图片
	}
}

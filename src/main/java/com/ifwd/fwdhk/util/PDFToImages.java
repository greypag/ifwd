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
	    	String name = path + pdf + count + ".jpg";
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
	        
	        int tWidth = imgs[0].getWidth();
	        int tHeight = 0;
	        
	        for (int i = 0; i < imgs.length; i++) {
	        	tHeight += imgs[i].getHeight();
	        }
	        
	        BufferedImage imgNew = new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_INT_RGB);
	        
	        int mHeight = 0;
	        for (int i = 0; i < imgs.length; i++) {
	        	int width = imgs[i].getWidth();
		        int height = imgs[i].getHeight();
		        if(i>0){
		        	mHeight += imgs[i-1].getHeight();
		        }
	        	int[] imgArray = new int[width * height];
	            imgs[i].getRGB(0, 0, width, height, imgArray, 0, width);
	            imgNew.setRGB(0, mHeight, width, height, imgArray, 0, width);
	        }
	        File outFile = new File(path + newFileName);
	        ImageIO.write(imgNew, "jpg", outFile);// 写图片
	}
}

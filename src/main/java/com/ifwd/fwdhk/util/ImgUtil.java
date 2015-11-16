package com.ifwd.fwdhk.util;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.exception.ECOMMAPIException;

public class ImgUtil {

	public static void changeImageToJPG(File fromFile,File toFile,HttpServletRequest request)throws ECOMMAPIException,Exception{
		
			BufferedImage bufferedImage = ImageIO.read(fromFile);
			String imgMaxWidth = UserRestURIConstants.getProperties("imgMaxWidth");
			String imgMaxHeight = UserRestURIConstants.getProperties("imgMaxHeight");
			String imgMaxRatio = UserRestURIConstants.getProperties("imgMaxRatio");
			int width = bufferedImage.getWidth();   
		    int height = bufferedImage.getHeight(); 
		    double ratio = width*1.0/height;
		    if(ratio > Integer.valueOf(imgMaxRatio) || ratio < 1.0/Integer.valueOf(imgMaxRatio)){
		    	throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.length.width",request));
		    }
		    if(width > Integer.valueOf(imgMaxWidth)){
		    	throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.not.wider.than",request)+" "+imgMaxWidth);
		    }
		    if(height > Integer.valueOf(imgMaxHeight)){
		    	throw new ECOMMAPIException(ErrorMessageUtils.getMessage("picture.not.higher.than",request)+" "+imgMaxHeight);
		    }
			      // create a blank, RGB, same width and height, and a white background
			BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
			            bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
			newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
			      // write to jpeg file
			ImageIO.write(newBufferedImage, "jpg", toFile);
	
//			fromFile.delete();
	}
}

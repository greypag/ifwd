package com.ifwd.fwdhk.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {

	@RequestMapping(value = { "/{lang}/upload/uploadPage" })
	public ModelAndView uploadPage(HttpServletRequest request) {
		
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "upload/uploadPage");
	}
	
	@RequestMapping(value = { "/{lang}/upload/saveFile" }, method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(@RequestParam("mFile") MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			ServletContext sc = request.getSession().getServletContext();
			String dir = sc.getRealPath("/upload");
			System.out.println(dir);
			saveFile(dir, file);
		}
		return new ModelAndView(UserRestURIConstants.getSitePath(request) + "upload/uploadPage");
	}
	
	private String saveFile(String dir, MultipartFile file) {
		try {
			FileUtils.writeByteArrayToFile(new File(dir, file.getOriginalFilename()), file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
}

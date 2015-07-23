<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<script src="<%=request.getContextPath()%>/resources/js/savie/pdfjs/shared/util.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/pdfjs/display/api.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/pdfjs/display/metadata.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/pdfjs/display/canvas.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/pdfjs/display/webgl.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/pdfjs/display/pattern_helper.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/pdfjs/display/font_loader.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/pdfjs/display/annotation_helper.js"></script>
</head>
<script>
    PDFJS.workerSrc = '<%=request.getContextPath()%>/resources/js/savie/pdfjs/worker_loader.js';
    
    'use strict';
    PDFJS.getDocument('<%=request.getContextPath()%>/resources/pdf/${pdfName }').then(function(pdf) {
        // Using promise to fetch the page
        pdf.getPage(1).then(function(page) {
        var scale = 1.5;
        var viewport = page.getViewport(scale);
        //
        // Prepare canvas using PDF page dimensions
        //
        var canvas = document.getElementById('the-canvas');
        var context = canvas.getContext('2d');
        canvas.height = viewport.height;
        canvas.width = viewport.width;
        //
        // Render PDF page into canvas context
        //
        var renderContext = {
                canvasContext: context,
                viewport: viewport
        };
        page.render(renderContext);
      });
    });
</script>
<body>
<div align="center">
<input type="button" value="${pdfName }"/><br/>
<canvas id="the-canvas" style="border:1px solid black;"/>
</div>
</body>
</html>
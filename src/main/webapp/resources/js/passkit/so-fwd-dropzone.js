var dropZone = document.getElementById('drop-zone');
var uploadForm = document.getElementById('js-upload-form');
var passportUploadForm = document.getElementById('passport-upload-form');
var passportDropZone = document.getElementById('passport-drop-zone');
var hkidUploadForm = document.getElementById('hkid-upload-form');
var hkidDropZone = document.getElementById('hkid-drop-zone');
var xhr = new XMLHttpRequest();
var completeUplaodId ='';
var progressBarUIId='';
var progressPercentText = '';

//Drag and Drop Upload for HKID
var startUploadHkid = function(files) {
	fileSelected('hkid-copy-progress','hkidFileToUpload','hkid-docu-filename','hkid-docu-fileSize','finish-upload-hkid','hkid-upload-percent-text','hkid-upload-progress-bar',files[0], '#so-hkid-file-message');
};

hkidUploadForm.addEventListener('submit', function(e) {
	var addressfile = document.getElementById('fileToUpload-hkid-dragAndDrop').files[0];
	e.preventDefault();
	startUploadHkid(addressfile);
});

hkidDropZone.ondrop = function(e) {
	e.preventDefault();
	$('#updoc-complete-btn').removeAttr('disabled');
	if(getWidth()>=992) {
		this.className = 'select-file-hkid';
		$('#fileToUpload-hkid-dragAndDrop').get(0).files=e.dataTransfer.files;
		startUploadHkid(e.dataTransfer.files);
	}
};

hkidDropZone.ondragover = function() {
	$('#updoc-complete-btn').removeAttr('disabled');
	if(getWidth()>=992) {
		this.className = 'select-file-hkid drop';
		return false;		
	}
};

hkidDropZone.ondragleave = function() {
	$('#updoc-complete-btn').removeAttr('disabled');
	if(getWidth()>=992) {
		this.className = 'select-file-hkid';
		return false;		
	}
};

//Display Progress Bar
function displayProgressBar(progressBarId){
	if($('#'+progressBarId.toString()).hasClass('hidden')){
		$('#'+progressBarId.toString()).removeClass('hidden');
	}
}

//On Select Button Upload
function fileSelected(progressDivBarID, inputId, docuFileNameID, docuFileSizeId, uploadCompleteId, progressTextId, progressBarId, dragAndDropFiles, errorMsgCon) {
	var file;
	var forDragAndDrop;
    var $fileObj = $('#'+inputId.toString());
    progressBarUIId = progressBarId.toString();
	progressPercentText = progressTextId.toString();
	completeUplaodId = uploadCompleteId.toString();
	
	if(dragAndDropFiles!='') {
		file = dragAndDropFiles;
		forDragAndDrop = dragAndDropFiles;
	} else {
		file = document.getElementById(inputId.toString()).files[0];
		forDragAndDrop = '';
	}
	
	if (file) {
		var fileSize = 0;
		if (file.size > 1024 * 1024) {
			fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
		} else {
			fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
        }
        
        document.getElementById(docuFileNameID.toString()).innerHTML = file.name+" ";
        document.getElementById(docuFileSizeId.toString()).innerHTML = "\("+fileSize+"\)";
	}
    
    if (!$fileObj.attr('accept') || ($fileObj.attr('accept') && isFileValid(file, $fileObj, errorMsgCon))) {
        if (errorMsgCon) {
            //removeFormFieldError(errorMsgCon, '', true);
			  console.log(errorMsgCon);
        }
        
        $('#so-upload-doc-submit-btn').removeAttr('disabled');
        displayProgressBar(progressDivBarID);
        uploadFile(inputId,forDragAndDrop,uploadCompleteId,progressBarId,progressTextId);
    }
}

function isFileValid(file, $fileObj, errorMsgCon) {
    var isValid = true;
    
    // Check file size
    // File size limit: 2MB
    if ((file.size > (1024 * 1024 * 2)) && errorMsgCon) {
        if ($fileObj.closest('form').find(':reset').length) {
            $fileObj.closest('form')
                    .find(':reset')
                    .trigger('click');
        }
            
        addFormFieldError(errorMsgCon, 'File must not be greater than 2MB.');
        isValid = false;
    }
    // Check file extension and type validity
    // Accepted file format: application/pdf, image/jpg, image/jpeg, image/gif and image/png
    if ($.inArray(file.type, $fileObj.attr('accept').split(',')) < 0) {
        addFormFieldError(errorMsgCon, 'File format must be a pdf, jpg, gif or png.');
        isValid = false;
    }
    return isValid;
}

//Cancel Button Upload
function cancelUpload(progressBarID,doneID,progressBarReset,progressTextId){
	xhr.abort();
    var $prog = $('#'+progressBarID.toString());
    
    if ($prog.siblings('form').length) {
        $prog.siblings('form')
            .find(':reset')
            .trigger('click');
    }
    
	$prog.addClass('hidden');
	$('#'+doneID.toString()).addClass('hidden');
	$('#'+progressBarReset.toString()).css("width", '0%');
	$('#'+progressTextId.toString()).html('0%');

}

var errorMsgCons ;
function uploadFile(inputID,forDragAndDrop,uploadCompleteId,progressBarId,progressTextId) {
   // Remove this snippet
   // and update the rest of the function to enable AJAX file upload
	setTimeout(function(){
		if( $('#'+progressTextId.toString()).html() != '100%' ){
			$('#'+progressBarId.toString()).css("width", '30%');
			$('#'+progressTextId.toString()).html('30%');
		}
	}, 1000);
   
   //return;
   // End of snippet
   
   var fd = new FormData();	
	if(forDragAndDrop!=''){
		fd.append("img",forDragAndDrop );
	}else{
		fd.append("img", document.getElementById(inputID.toString()).files[0]);
	}
	fd.append("name",inputID.toString());
	xhr.upload.addEventListener("progress", uploadProgress, false);
	//xhr.addEventListener("load", uploadComplete, false);
	xhr.addEventListener("error", uploadFailed, false);
	xhr.addEventListener("abort", uploadCanceled, false);
	xhr.onreadystatechange = function(){
		xhrReturn(uploadCompleteId,progressBarId,progressTextId);
	}
	xhr.open("POST", "/ajax/savings-insurance/getEliteTermImage");
	xhr.send(fd);

}

//回调函数    
function xhrReturn(uploadCompleteId,progressBarId,progressTextId){    
    if(xhr.readyState == 4 && xhr.status == 200){    
        var b = xhr.responseText;
        if(b != "true"){ 
        	addFormFieldError(errorMsgCons, b);
        	cancelUpload(deleteProgressDivBarID,deleteUploadCompleteId,deleteProgressBarId);
        } else {
        	uploadComplete(uploadCompleteId,progressBarId,progressTextId);
        }        
    }    
}  

function uploadProgress(evt) {
	//if (evt.lengthComputable) {
	//	var percentComplete = Math.round(evt.loaded * 100 / evt.total);
	//	document.getElementById(progressPercentText.toString()).innerHTML = percentComplete.toString() + '%';
	//	var percentProgressBar = percentComplete.toString()+'%';
	//	$('#'+progressBarUIId.toString()).css("width",percentProgressBar);
	//} else {
	//	document.getElementById('progressNumber').innerHTML = 'unable to compute';
	//}
	
}

function uploadComplete(uploadCompleteId,progressBarId,progressTextId) {
	if($('#'+uploadCompleteId.toString()).hasClass('hidden')){
		$('#'+uploadCompleteId.toString()).removeClass('hidden');
	}
	$('#'+progressBarId.toString()).css("width", '100%');
	document.getElementById(progressTextId.toString()).innerHTML = '100%';
	
}

function uploadFailed(evt) {
	console.log("There was an error attempting to upload the file.");
	console.log(evt);
}

function uploadCanceled(evt) {
	//alert("The upload has been canceled by the user or the browser dropped the connection.");
}

function getWidth() {
	if (self.innerWidth) {
		return self.innerWidth;
	} else if (document.documentElement && document.documentElement.clientHeight) {
		return document.documentElement.clientWidth;
	} else if (document.body) {
		return document.body.clientWidth;
	}
	return 0;
}
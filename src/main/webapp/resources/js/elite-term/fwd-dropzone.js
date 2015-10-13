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
	fileSelected('hkid-copy-progress','fileToUpload-hkid-dragAndDrop','hkid-docu-filename','hkid-docu-fileSize','finish-upload-hkid','hkid-upload-percent-text','hkid-upload-progress-bar',files[0]);
};

hkidUploadForm.addEventListener('submit', function(e) {
	var addressfile = document.getElementById('fileToUpload-hkid-dragAndDrop').files[0];
	e.preventDefault();
	startUploadHkid(addressfile);
});

hkidDropZone.ondrop = function(e) {
	e.preventDefault();
	if(getWidth()>=992){
		this.className = 'select-file-hkid';
		startUploadHkid(e.dataTransfer.files);		
	}

};

hkidDropZone.ondragover = function() {
	if(getWidth()>=992){
		this.className = 'select-file-hkid drop';
		return false;		
	}

};

hkidDropZone.ondragleave = function() {
	if(getWidth()>=992){
		this.className = 'select-file-hkid';
		return false;		
	}

};

//Drag and Drop Upload for Passport
var startUploadPassport = function(files) {
	fileSelected('passport-copy-progress','fileToUpload-passport-dragAndDrop','passport-docu-filename','passport-docu-fileSize','finish-upload-passport','passport-upload-percent-text','passport-upload-progress-bar',files[0]);
};

passportUploadForm.addEventListener('submit', function(e) {
	var addressfile = document.getElementById('fileToUpload-passport-dragAndDrop').files[0];
	e.preventDefault();
	startUploadPassport(addressfile);
});

passportDropZone.ondrop = function(e) {
	e.preventDefault();
	if(getWidth()>=992){
		this.className = 'select-file-passport';
		startUploadPassport(e.dataTransfer.files);		
	}

};

passportDropZone.ondragover = function() {
	if(getWidth()>=992){
		this.className = 'select-file-passport drop';
		return false;		
	}

};

passportDropZone.ondragleave = function() {
	if(getWidth()>=992){
		this.className = 'select-file-passport';
		return false;		
	}

};

//Drag and Drop Upload for Address
var startUploadAddress = function(files) {
	fileSelected('proof-of-address-progress','fileToUpload-addr-dragAndDrop','address-docu-filename','address-docu-fileSize','finish-upload-addr','docu-upload-percent-text','document-upload-progress-bar',files[0]);
	
};

uploadForm.addEventListener('submit', function(e) {
	var addressfile = document.getElementById('fileToUpload-addr-dragAndDrop').files[0];
	e.preventDefault();
	if(getWidth()>=992){
		startUploadAddress(addressfile);
	}
	
});

dropZone.ondrop = function(e) {
	e.preventDefault();
	if(getWidth()>=992){
		this.className = 'select-file';
		startUploadAddress(e.dataTransfer.files);
	}
};

dropZone.ondragover = function() {
	if(getWidth()>=992){
		this.className = 'select-file drop';
		return false;
	}
	
};

dropZone.ondragleave = function() {
	if(getWidth()>=992){
		this.className = 'select-file';
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
function fileSelected(progressDivBarID,inputId,docuFileNameID,docuFileSizeId,uploadCompleteId,progressTextId,progressBarId,dragAndDropFiles) {
	var file;
	var forDragAndDrop;
	progressBarUIId = progressBarId.toString();
	progressPercentText = progressTextId.toString();
	completeUplaodId = uploadCompleteId.toString();
	displayProgressBar(progressDivBarID);
	
	if(dragAndDropFiles!=''){	
		file = dragAndDropFiles;
		forDragAndDrop = dragAndDropFiles;
		
	}else{
		file = document.getElementById(inputId.toString()).files[0];
		forDragAndDrop = '';
	}
	
	if (file) {
		var fileSize = 0;
		if (file.size > 1024 * 1024)
			fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
		else
			fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
	
		document.getElementById(docuFileNameID.toString()).innerHTML = file.name+" ";
		document.getElementById(docuFileSizeId.toString()).innerHTML = "\("+fileSize+"\)";
		
	}
		uploadFile(inputId,forDragAndDrop);
}


//Cancel Button Upload
function cancelUpload(progressBarID,doneID,progressBarReset){
	xhr.abort();
	$('#'+progressBarID.toString()).addClass('hidden');
	$('#'+doneID.toString()).addClass('hidden');
	$('#'+progressBarReset.toString()).css("width",'0%');
}

function uploadFile(inputID,forDragAndDrop) {
	var fd = new FormData();	
	if(forDragAndDrop!=''){
		fd.append(inputID.toString(),forDragAndDrop );
	}else{
		fd.append(inputID.toString(), document.getElementById(inputID.toString()).files[0]);
	}
	
	xhr.upload.addEventListener("progress", uploadProgress, false);
	xhr.addEventListener("load", uploadComplete, false);
	xhr.addEventListener("error", uploadFailed, false);
	xhr.addEventListener("abort", uploadCanceled, false);
	xhr.open("POST", "http://murielle.php-staging.smartdrop.com.hk/pms/product/uploadfile");
	xhr.send(fd);
}

function uploadProgress(evt) {
	if (evt.lengthComputable) {
		var percentComplete = Math.round(evt.loaded * 100 / evt.total);
		document.getElementById(progressPercentText.toString()).innerHTML = percentComplete.toString() + '%';
		var percentProgressBar = percentComplete.toString()+'%';
		$('#'+progressBarUIId.toString()).css("width",percentProgressBar);
	}
	else {
		document.getElementById('progressNumber').innerHTML = 'unable to compute';
	}
}

function uploadComplete(evt) {
	if($('#'+completeUplaodId.toString()).hasClass('hidden')){
		$('#'+completeUplaodId.toString()).removeClass('hidden');
	}
	console.log('Upload Complete');
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
	}
	else if (document.documentElement && document.documentElement.clientHeight){
		return document.documentElement.clientWidth;
	}
	else if (document.body) {
		return document.body.clientWidth;
	}
	return 0;
}
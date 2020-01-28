// 파일 확장명을 추출함.
function getExt(fname) {
	var len = fname.length;
	var divider = fname.lastIndexOf('.');
	var ext = fname.substring(divider, len).toLowerCase();
	
	return ext;
}

// 이미지 검사
function isImage(fname) {
	var ext = fname.substring(fname.lastIndexOf('.') + 1).toLowerCase();
	var bol = ext == 'gif' || ext == 'jpg' || ext == 'png';
	
	return bol;
}
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

//version 1.4

// 전송 가능한 파일 확장자 검사
function file_name_check(filename) {
  // var filename = file1.value;  // 파일명 추출
  filename = filename.toLowerCase(); // 소문자로 변경

  if (filename.endsWith('.zip') || filename.endsWith('.jpg') ||
      filename.endsWith('.gif') || filename.endsWith('.png')) {
    return true;
  } else {
    return false;
  } 
}

// 전송 가능한 파일 사이즈 검사
function file_size_check(filesize) {
  // console.log('--> file_size_check 호출됨');
  var maxsize = 1024 * 1024 * 1; // 1MB
  // var filesize = file1.files[0].size;  // 파일크기 추출

  // console.log('filesize <= maxsize: ' + filesize <= maxsize);
  if (filesize <= maxsize) {
    return true;
  } else {
    return false;
  } 
}

// 전송 가능한 파일 사이즈 검사, mb: 전송 가능한 MB 단위
function file_size_check2(filesize, mb) {
  var maxsize = 1024 * 1024 * mb; // 1MB
  // var filesize = file1.files[0].size;  // 파일크기 추출
  
  if (filesize <= maxsize) {
    return true;
  } else {
    return false;
  } 
}

/*
 * 태그를 검색합니다.
 */
function find(id) {
  return document.getElementById(id);
}

/*
 * 태그를 출력합니다.
 */
function show(id) {
  document.getElementById(id).style.display = '';
}

/*
 * 태그를 숨깁니다.
 */
function hide(id) {
  document.getElementById(id).style.display = 'none';
}

/* 데이터 길이 산출 */
function length(id) {
  return document.getElementById(id).value.trim().length;
}

/* 데이터 산출 */
function val(id) {
  return document.getElementById(id).value.trim();  
}

/*
 * 파일 크기의 단위를 계산합니다.
 */
function unit(length){
  var str = "";

  if (length < 1024){  // Byte: 0 ~ 1023
    str = parseInt(length) + " Byte";   
  }else if (length < (1024 * 1024)){ // Byte: 1024 ~ 1048575
    str = parseInt(length / 1024) + " KB";
  }else if(length < (1024 * 1024 * 1024)){ // Byte: 1048576 ~ 1073741823
    str = parseInt(length / 1024 / 1024) + " MB";
  }else if(length < (1024 * 1024 * 1024 * 1024)){ // Byte: 1073741824 ~
    str = parseInt(length / 1024 / 1024 / 1024) + " GB";
  }else if(length < (1024 * 1024 * 1024 * 1024 * 1024)){ // Byte: 1073741824 ~
    str = parseInt(length / 1024 / 1024 / 1024 / 1024) + " TB";
  }

  return str;
}

function wl(str) {
  document.writeln(str + '<br>'); // BODY 태그로 출력됨.
}

// 정규 표현식
function comma(su) {
  return su.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
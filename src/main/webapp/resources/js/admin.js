/**
 * 
 */



$(document).ready(function() {

	// ----- 에디터 가져오기 ----
	$('.summernote').summernote({
		         height : 500, // 기본 높이값
		         minHeight : null, // 최소 높이값(null은 제한 없음)
		         maxHeight : null, // 최대 높이값(null은 제한 없음)
		         focus : true, // 페이지가 열릴때 포커스를 지정함
		         lang : 'ko-KR', // 한국어 지정(기본값은 en-US)
	});
	
	
	$('.summernote').summernote({
  	toolbar: [
	    // [groupName, [list of button]]
	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    ['fontsize', ['fontsize']],
	    ['color', ['color']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']]
	  ]
	 });
	//-------------------------------

	var path = window.location.href;
	
	if(path.indexOf("admin/item") != -1) {
		$("#item_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#record_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/category") != -1) {
		$("#item_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#record_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/employee") != -1) {
		$("#member_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#item_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#record_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/board") != -1) {
		$("#board_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#item_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#record_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/exam") != -1) {
		$("#exam_li").addClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#item_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#record_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/record") != -1) {
		$("#record_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#item_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
	}

});



function allChk(obj, type) {  //라디오버튼 전체선택 
	var chkObj 
	if(type == 'dept') {chkObj = document.getElementsByName("emp_dept");}
	if(type == 'grade'){chkObj = document.getElementsByName("emp_grade");}
	if(type == 'category' || type == 'item'){chkObj = document.getElementsByName("del_check");}
	
	var rowCnt = chkObj.length - 1;
	var check = obj.checked;
	if (check) {
		for (var i = 0; i <= rowCnt; i++) {
			if (chkObj[i].type == "checkbox")
				chkObj[i].checked = true;
		}
	} else {
		for (var i = 0; i <= rowCnt; i++) {
			if (chkObj[i].type == "checkbox") {
				chkObj[i].checked = false;
			}
		}
	}
}


function onlyNumber(event){  // 숫자만 입력받기
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        return false;
}
 


function removeChar(event) { // 문자입력한경우 지우기
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

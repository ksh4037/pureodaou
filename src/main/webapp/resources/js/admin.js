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
		         lang : 'ko-KR' // 한국어 지정(기본값은 en-US)
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
	
	if(path.indexOf("admin/question") != -1) {
		$("#question_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/category") != -1) {
		$("#question_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/employee") != -1) {
		$("#member_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#question_li").removeClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/board") != -1) {
		$("#board_li").addClass("active_1"); 
		$("#exam_li").removeClass("active_1"); 
		$("#question_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}
	if(path.indexOf("admin/exam") != -1) {
		$("#exam_li").addClass("active_1"); 
		$("#board_li").removeClass("active_1"); 
		$("#question_li").removeClass("active_1"); 
		$("#member_li").removeClass("active_1"); 
		$("#write_li").removeClass("active_1"); 
	}

});
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '내용을 입력하세요.',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
	


$(function(){
	$("#listBtn").on("click",function(){
		location.href="/bod/boardList";
	})
})
</script>
</head>
<body>
<!-- header -->
 <jsp:include page="../layout/header.jsp"/>
<div class="container" id="">
<h2 style="text-align: center;">글 작성</h2><br><br><br>

	<form method="post" action="/bod/writeProc">
		<input type="text" name="title" style="width: 40%;" placeholder="제목" required />
		<br><br>
		<textarea id="summernote" name="content" required></textarea>
		<div class="row p-2">
		<input type="hidden" class="col-12">
		<input id="subBtn" type="submit" value="글 작성" class="col-1 btn btn-info" onclick="goWrite(this.form)"/>
		<input id="listBtn" type="button" value="글 목록" class="col-1 btn btn-secondary"/>
		</div>
	</form>
</div>
	<!-- footer -->
<jsp:include page="../layout/footer.jsp"/>
</body>
<script>
$('.summernote').summernote({
	  // 에디터 높이
	  height: 150,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	  focus : true,
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        //콜백 함수
        callbacks : { 
        	onImageUpload : function(files) {
      			let editor = this;
      			
      			let file = file[0];
    			var data = new FormData(form);
    			data.append("file", file);
    			
    			$.ajax({
    				data : data,
    				type : "POST",
    				url : "/bod/uploadSummernoteImageFile",
    				contentType : false,
    				enctype : 'multipart/form-data',
    				processData : false,
    				success : function(data) {
    					$(editor).summernote('insertImage', data);
    				}
        }
		
	});

</script>
</html>
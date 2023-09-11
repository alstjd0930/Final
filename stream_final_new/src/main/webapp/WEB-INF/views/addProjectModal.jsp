<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 모달 -->
<!-- The Modal -->
<div id="myModal" class="modal right fade" aria-labelledby="myModalLabel">
<div class="modal-dialog">
  <!-- Modal content -->
  <div class="modal-content">
  	<div class="modal-header">
  		<span class="close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
  	</div>
 	<div class="modal-body">
 		<form action="${pageContext.request.contextPath}/projectInsert" method="post">
	    	<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">프로젝트명 및 설명을 입력해주세요.</h5>
				</div>
				<div class="card-body">
					<input type="hidden" name="pno" value="9">
					<input type="hidden" name="userId" value="kh0002@kh.com"> <!-- 로그인 세션 받아서 등록 -->
					<input type="hidden" name="paccess" value="ddd">
					<input type="text" class="form-control title" name="pname" placeholder="프로젝트명을 입력해주세요.">
					<br> 
					<textarea class="form-control content" rows="5" name="pcoment" placeholder="프로젝트에 관한 설명을 입력해주세요.(옵션)"></textarea>
						<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script> <!-- 위즈윅 -->
						<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
						<script>
					      ClassicEditor.create(document.querySelector(".form-control.content"), {
					    	  language: "ko"
					      });
					    </script>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">프로젝트 진행시기</h5>
				</div>
				<div class="card-body">
					<input type="date" class="form-date" name="pstartDate"> ~ <input type="date" class="form-date" name="pendDate">
				</div>
			</div>
			<div align="center">
				<button class="btn btn-primary" type="submit">추가</button>
				<button class="btn btn-warning" type="reset">취소</button>
			</div>
			<div>
			
			</div>
		</form>
	</div>
  </div>
    <div class="modal-footer">
  	</div>
  </div>
</div>

<script>
	<link href="${pageContext.request.contextPath}/css/makeProjectModal.css" rel="stylesheet">
</script>
<!-- 모달 -->
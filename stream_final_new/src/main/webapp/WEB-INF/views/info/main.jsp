<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/info.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/streamapp.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<meta charset="UTF-8">
<title>Stream - 업무도 흐름이다!</title>
</head>

<body >
		<div class="wrapper">
			<%@ include file="/WEB-INF/views/sidebar.jsp"%>
			<div class="main">
				<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
				<main class="content">

						<div class="col-lg-12">
							<h1 class="h3 mb-3">공지사항</h1>
						</div>
						<input type="hidden" name="ino" value="${info.userId}">
						
			
					<!-- <div style="margin: 20px 0;">
						<div class="select_outer"
							style="display: flex; justify-content: center;">

							<select id="select_search" name="select_search"
								class="form-select mb-3" style="width: 100px;">
								<option value="ititle">제목</option>
								<option value="iwriter">작성자</option>
							</select> <input type="text" class="form-control" name="search_bar"
								id="search_bar"
								style="width: 270px; height: 38px; margin: 0 6px;">
							<button class="btn btn-sm btn-primary" name="btnSearch"
								id="y_btn_search" style="height: 38px;">검색</button>
						</div>
					</div> -->
					<div id="outter">
					
					<form id="deleteForm" action="/stream/info/delete" method="post">
					<div class="container y_outer_div" style="display: flex; justify-content: center;">
						<table class="table table-striped table-hover" style="text-align: center;">
							<tr class="head">
								<td><input type="checkbox" id="allCheck" name="allCheck"></td>
								<td width="50%"><b>제목</b></td>
								<td><b>작성자</b></td>
								<td><b>등록일</b></td>
							</tr>
							
		
							<c:forEach items="${viewAll}" var="i">
								<tr class="over">
									<td><input type="checkbox" id="rowCheck" name="rowCheck"
											value="${i.ino }"><label for="rowCheck"></label></td>
									<td class="y_td_no" style="display: none;">${i.ino }</td>
										<td id="y_td_hover"><a class="infolist" style="color:black ;"
											href="<c:url value='/info/select'><c:param name='ino' value='${i.ino }'/></c:url>">${i.ititle }</a></td>
										<td>${i.iwriter }</td>
										<td>${i.idate }</td>
								</tr>
							</c:forEach>
						</table>
						</div>
						</form>
						<div style="margin: 0 230px; display: flex; justify-content: flex-start;">
						<form action="/stream/info/insert" method="get">
							<button type="submit" class="btn btn-primary" id="y_btn_insert"
								style="margin: 5px">글쓰기</button>
						</form>
						<button type="submit" class="btn btn-secondary" id="y_btn_delete"
							style="margin: 5px">삭제</button>
						</div>

						<div style="display: block; text-align: center;">
							<c:if test="${paging.startPage != 1 }">
								<a
									href="${pageContext.request.contextPath }/info?nowPage=${paging.startPage - 1 }">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a
											href="${pageContext.request.contextPath }/info?nowPage=${p }">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a
									href="${pageContext.request.contextPath }/info?nowPage=${paging.endPage+1 }">&gt;</a>
							</c:if>
						</div>
						</div>
						</main>
					</div>
				</div>
				<%@include file="/WEB-INF/views/footer.jsp"%>
			</div>
		
		<script src="${pageContext.request.contextPath}/js/app.js"></script>
		<script>
	function selChange() {
		var sel = $('#cntPerPage').val();
		location.href=contextPath+"/info?nowPage${paging.nowPage}&cntPerPage="+sel;
	}
</script>
		<script>
		document.getElementById('y_btn_insert').addEventListener('click', function (event) {
	       
			 if ( '${principal.authorities}'.indexOf('ROLE_C') === -1  && '${principal.authorities}'.indexOf('ROLE_A') === -1) {
			        
			        alert('권한이 없습니다.'); 
			        event.preventDefault();
			    }
	    });
	$(document).ready(function () {
    var allCheck = document.getElementById('allCheck');
    allCheck.addEventListener('click', function () {
        var rowCheckboxes = document.querySelectorAll('input[name="rowCheck"]');
        for (var i = 0; i < rowCheckboxes.length; i++) {
            rowCheckboxes[i].checked = allCheck.checked;
        }
    });

    /* // 검색 버튼 클릭 이벤트 처리
    $("#y_btn_search").click(function () {
        var valueSelect = $("#select_search option:selected").val();
        var valueInput = $("#search_bar").val();
        if (valueInput === "") {
            alert("검색어를 입력하세요.");
        } else {
            $.ajax({
                url: "${pageContext.request.contextPath}/member/info",
                type: "get",
                data: { "select_search": valueSelect, "search_bar": valueInput },
                success: function (result) {
                    console.log(result);
                    $(".wrapper").html(result);
                },
                error: function () {
                    alert("검색 중 오류가 발생했습니다.");
                }
            });
        }
    }); */

    $("#y_btn_delete").click(function () {
        submitDeleteForm();
    });
});
	function submitDeleteForm() {
	    var selectedInoArray = [];
	    var checkboxes = document.querySelectorAll('input[name="rowCheck"]:checked');
	    var currentUserId = '${principal.username}';
	    var userAuthorities = '${principal.authorities}';

	    if (userAuthorities.indexOf('ROLE_C') !== -1  && '${principal.authorities}'.indexOf('ROLE_A') === -1) {
	        for (var i = 0; i < checkboxes.length; i++) {
	            selectedInoArray.push(checkboxes[i].value);
	        }

	        if (selectedInoArray.length === 0) {
	            alert("삭제할 항목을 선택하세요.");
	            return;
	        }

	        var deleteForm = document.getElementById('deleteForm');
	        selectedInoArray.forEach(function (ino) {
	            var input = document.createElement('input');
	            input.type = 'hidden';
	            input.name = 'ino';
	            input.value = ino;
	            deleteForm.appendChild(input);
	        });

	        deleteForm.submit();
	    } else {
	        alert("권한이 없습니다. 삭제할 수 없습니다.");
	    }
	}

</script>
</body>
</html>
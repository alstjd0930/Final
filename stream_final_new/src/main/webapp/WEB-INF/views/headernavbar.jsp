<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<nav class="navbar navbar-expand navbar-light navbar-bg">
	<a class="sidebar-toggle js-sidebar-toggle"> <i
		class="hamburger align-self-center"></i>
	</a>
	<div class="navbar-collapse collapse">
		<ul class="navbar-nav navbar-align">

			<li class="nav-item dropdown"><a
				class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#"
				data-bs-toggle="dropdown"> <i class="align-middle"
					data-feather="settings"></i></a> <a
				class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#"
				data-bs-toggle="dropdown"> <img
					src="${pageContext.request.contextPath}/img/avatars/user1.jpg"
					class="avatar img-fluid rounded me-1" alt="Charles Hall"
					border-radius: 50% !important /> <span class="text-dark"></span>
			</a>

				<div class="dropdown-menu dropdown-menu-end">
					<a class="dropdown-item" href="#" id="mypage-open"><i
						class="align-middle me-1" data-feather="user"></i> 내 프로필</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="index.html"> <i
						class="align-middle me-1" data-feather="settings"></i> 환경 설정
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/logout"> <i
						class="align-middle me-2" data-feather="log-out"></i> Log out
					</a>
				</div></li>
		</ul>
	</div>
</nav>

<!-- 모달박스 -->
<div id="mypage-modal">
	<div class="mpmodalbox">
		<div class="mpmodal-header"></div>

		<table class="mp-table">
			<tr>
				<td class="mp-item"><i class="align-middle me-2"
					data-feather="briefcase"></i><span>회사명</span></td>
				<td class="mp-content" data-field="cname"></td>
			</tr>
			<tr>
				<td class="mp-item"><i class="align-middle me-2"
					data-feather="monitor"></i><span>부서명</span></td>
				<td class="mp-content" data-field="deptname"></td>
			</tr>
			<tr>
				<td class="mp-item"><i class="align-middle me-2"
					data-feather="award"></i><span>직급명</span></td>
				<td class="mp-content" data-field="mrank"></td>
			</tr>
			<tr>
				<td class="mp-item"><i class="align-middle me-2"
					data-feather="user"></i><span>이름</span></td>
				<td class="mp-content" data-field="mname"></td>
			</tr>
			<tr>
				<td class="mp-item"><i class="align-middle me-2"
					data-feather="phone"></i> <span>전화번호</span></td>
				<td class="mp-content" data-field="mphone"></td>
			</tr>
			<c:if test="${principal.authorities eq '[ROLE_M]'}">
				<tr>
					<td colspan="2" class="mp-button"><button
							class="btn mpbtn btn-primary btn-sm mp-button" id="editmypage">정보수정
						</button></td>
				</tr>
			</c:if>
		</table>
	</div>
	<a class="mpmodal_close_btn">X</a>
</div>



<script>
	function modal(id) {
		var zIndex = 9999;
		var modal = document.getElementById(id);
		var bg = document.createElement('div');
		bg.setStyle({
			position : 'fixed',
			zIndex : zIndex,
			left : '0px',
			top : '0px',
			width : '100%',
			height : '100%',
			overflow : 'auto',
			backgroundColor : 'rgba(0,0,0,0.4)'
		});
		document.body.append(bg);

		// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
		modal.querySelector('.mpmodal_close_btn').addEventListener('click',
				function() {
					bg.remove();
					modal.style.display = 'none';
				});

		modal
				.setStyle({
					position : 'fixed',
					display : 'block flex',
					boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

					// 시꺼먼 레이어 보다 한칸 위에 보이기
					zIndex : zIndex + 1,

					// div center 정렬
					top : '50%',
					left : '50%',
					transform : 'translate(-50%, -50%)',
					msTransform : 'translate(-50%, -50%)',
					webkitTransform : 'translate(-50%, -50%)'

				});
	}

	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
		for ( var k in styles)
			this.style[k] = styles[k];
		return this;
	};

	document.getElementById('mypage-open').addEventListener('click',
			function() {
				$.ajax({
					url : '${pageContext.request.contextPath}/showmypage',
					method : 'GET',
					data : {
						userid : '${principal.username}'
					},
					dataType : 'json',
					success : function(data) {
						console.log(data);
						var mname = data.mname;
						var cname = data.cname;
						var mrank = data.mrank;
						var mphone = data.mphone;
						var deptname = data.deptname;

						if (mrank === null) {
							mrank = "  ";
						}
						if (mphone === null){
							mphone = "  ";
						}

						$('.mp-content[data-field="mname"]').text(mname);
						$('.mp-content[data-field="cname"]').text(cname);
						$('.mp-content[data-field="mrank"]').text(mrank);
						$('.mp-content[data-field="mphone"]').text(mphone);
						$('.mp-content[data-field="deptname"]').text(deptname);

						modal('mypage-modal');
					},
					error : function(error) {
						console.error('오류발생', error);
					}
				});
				// 모달창 띄우기
			});

	$("#editmypage").click(function() {
		var url = "${pageContext.request.contextPath}/member/editmypage";
		window.location.href = url;
	});
</script>
<script>
	$.ajax({
		url : "${pageContext.request.contextPath}/member/loginUser",
		type : "get",
		data : {
			userid : '${principal.username}'
		},
		success : function(result) {
			$(".text-dark").text(result.mname + "님");
		},
		error : function() {
			console.log("loginUser에서 오류 발생");
		}
	});
</script>
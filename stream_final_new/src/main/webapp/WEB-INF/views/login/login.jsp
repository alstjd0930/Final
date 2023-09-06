<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

<link rel="canonical"
	href="https://demo-basic.adminkit.io/pages-sign-in.html" />

<title>로그인</title>

<link href="css/app.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

</style> -->
</head>

<body>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">Stream에 오신 것을 환영합니다!</h1>
							<p class="lead"></p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<div class="text-center">
										<h1>Stream로고 들어갑니다</h1>
									</div>
									<div>
										<form id="frmLogin">
											<div class="mb-3">

												<label class="form-label">Username</label> <input
													class="form-control form-control-lg" type="email"
													name="userId" placeholder="E-mail" required="required" />
											</div>
											<div class="mb-3">
												<label class="form-label">Password</label> <input
													class="form-control form-control-lg" type="password"
													name="password" placeholder="비밀번호" required="required" />
												<small> <a href="index.html">비밀번호 찾기</a>
												</small>
											</div>
											<div>
												<label class="form-check"> <input
													class="form-check-input" type="checkbox"
													value="remember-me" name="remember-me" checked> <span
													class="form-check-label"> 자동 로그인 </span>
												</label>
											</div>
											<div class="text-center mt-3">
												<!-- <a href="index.html" class="btn btn-lg btn-primary">로그인</a>-->
												<button type="button" class="btn btn-lg btn-primary login">로그인</button>

											</div>
										</form>
									</div>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>
	<script>
		$(".btn.login").click(btnLoginClickHandler);
		function btnLoginClickHandler() {
			console.log($("#frmLogin").serialize());

			$.ajax({
				url : "${pageContext.request.contextPath}/login",
				type : "post",
				data : $("#frmLogin").serialize(),
				success : function(result) {
					console.log(result);
				}
			});
		}
	</script>
	<script src="js/app.js"></script>

</body>

</html>
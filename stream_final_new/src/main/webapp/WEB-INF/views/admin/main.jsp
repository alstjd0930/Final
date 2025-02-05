<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/setvariable.jsp"%>
<meta charset="UTF-8">

<!-- 로고 결정 요망 -->

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Stream - 업무도 흐름이다!</title>

<link href="${pageContext.request.contextPath }/css/streamapp.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/maintask.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Modal.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/admin.css"
	rel="stylesheet">


<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/views/alertmsg.jsp"%>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main class="content admin-main">
				<div class="admin-cen">
					<!-- 간단 통계 -->
					<div class="admin-maintext col-lg-8 offset-lg-2">
						<c:if test="${CNT != null }">
							<div>
								<span>현재 stream 그룹웨어를 </span> <span>${CNT.ccnt }</span> <span>
									개 회사에서 이용 하고 있으며</span>
							</div>
							<div>
								<span>stream을 이용하여 진행된 프로젝트는 총 </span> <span>${CNT.pcnt }</span>
								<span> 개이고</span>
							</div>
							<div>
								<span>진행된 업무 개수는 모두 </span> <span>${CNT.tcnt }</span> <span>
									개 입니다.</span>
							</div>
						</c:if>
					</div>
					<!-- 회사 리스트 -->
					<div class="admin-ctable col-lg-8 offset-lg-2 admin-margin-top">
						<div>
							<select id="cntPerPage" name="sel" onchange="selChange()">
								<option value="5"
									<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
									보기</option>
								<option value="10"
									<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
									보기</option>
							</select>
							<table class="list-table">
								<thead>
									<tr>
										<th>회사 코드</th>
										<th>회사명</th>
										<th>회사 전화번호</th>
										<th>회사 주소</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${viewAll }" var="companyList">
										<tr>
											<td class="admin-pointer" data-ccode="${companyList.ccode }"
												data-bs-toggle="modal" data-bs-target="#detailCompanyModal"
												onclick="companyDetailModalHandler(this);">${companyList.ccode }</td>
											<td>${companyList.cname }</td>
											<td>${companyList.cphone }</td>
											<td>${companyList.caddress }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div>
								<c:if test="${paging.startPage != 1 }">
									<a
										href="${pageContext.request.contextPath }/admin/main?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
									var="p">
									<c:choose>
										<c:when test="${p==paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a
												href="${pageContext.request.contextPath }/admin/main?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a
										href="${pageContext.request.contextPath }/admin/main?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="admin-margin-top">
					<div class="admin-cen">
						<div>
							<h1>오시는 길</h1>
						</div>
						<div>
							<h3>Stream&copy; 로 오시는 길입니다.</h3>
						</div>
					</div>
					<div class="admin-cen admin-martin-top">
						<table class="admin-maptable col-lg-8">
							<tbody>
								<tr>
									<th class="admin-border-top">주소</th>
									<td class="admin-border-top">서울특별시 강남구 테헤란로 10길 9 그랑프리빌딩
										7F (공공데이터 융합 자바개발자 양성과정A23(2)/stream)</td>
								</tr>
								<tr>
									<th class="admin-border-t-and-b">버스</th>
									<td class="admin-border-t-and-b">역삼역.포스코P&S타워 정류장<br>
									<img alt="지선" src="/stream/img/icons/busB.jpg"> 146 / 740
										/ 341 / 360<br>
									<img alt="간선" src="/stream/img/icons/busR.jpg"> 1100 /
										1700 / 2000 / 7007 / 8001
									</td>
								</tr>
								<tr>
									<th class="admin-border-bottom">지하철</th>
									<td class="admin-border-bottom">지하철 2호선 역삼역 3번출구 100m</td>
								</tr>
								<tr>
									<td colspan="2" class="admin-map-padding">
										<div class="admin-map"></div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</main>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<%@include file="/WEB-INF/views/admin/admincompanymodal.jsp"%>
	<%@include file="/WEB-INF/views/admin/adminmap.jsp"%>

	<script>
		function selChange(){
			var sel = $('#cntPerPage').val();
			location.href=contextPath+"/admin/main?nowPage=${paging.nowPage}&cntPerPage="+sel;
		}
	</script>
	<script>
	companyDetailModalHandler=(thisButton)=>{
		console.log("[JM]===companyDetailModalHandler===");
		console.log(thisButton);
		var targetCcode = $(thisButton).data("ccode");
		console.log(targetCcode);
		
		$("#detailPtaskModal").modal("toggle");
		
		$.ajax({
			 	url: contextPath+"/admin/showcompanydetail",
			 	type: "post",
			 	dataType: "json",
			 	data: {ccode: targetCcode },
			 	success: function(cdetail){
			 		var cname = cdetail[0].cname;
			 		var ccode = cdetail[0].ccode;
			 		$(".jm-find-cname .admin-result-cname").html(cname);
			 		makeView(cdetail);
			 		makeModalPieChart(ccode);
			 	},
			 	error : function(request, status, error){
					console.log(request);
					console.log(status);
					console.log(error);
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
			});
	}
	
	</script>
	<script>
	makeView=(cdetail)=>{
		console.log(cdetail)
		var htmlList="";
		var totalUcnt=0;
		var totalPcnt=0;
		var totlaTcnt=0;
		
		for(var c=0;c<cdetail.length;c++){
			const result = cdetail[c];
			htmlList+=`
			<ul>
				<li class="col-lg-3 admin-cen admin-deptname">
					<div><span>\${result.deptname}</span></div>
				</li>
				<li class="col-lg-3 admin-cen admin-usercount">
					<div><span>\${result.ucnt}</span></div>
				</li>
				<li class="col-lg-3 admin-cen admin-projectcount">
					<div><span>\${result.pcnt}</span></div>
				</li>
				<li class="col-lg-3 admin-cen admin-taskcount">
					<div><span>\${result.tcnt}</span></div>
				</li>
			</ul>
			`
		totalUcnt+=parseInt(result.ucnt);
		totalPcnt+=parseInt(result.pcnt);
		totlaTcnt+=parseInt(result.tcnt);
		
		}
		htmlList+=`
			<ul>
			<li class="col-lg-3 admin-cen">
				<div><span>합계</span></div>
			</li>
			<li class="col-lg-3 admin-cen">
				<div><span>\${totalUcnt}</span></div>
			</li>
			<li class="col-lg-3 admin-cen">
				<div><span>\${totalPcnt}</span></div>
			</li>
			<li class="col-lg-3 admin-cen">
				<div><span>\${totlaTcnt}</span></div>
			</li>
			</ul>
			`
		$('.admin-result').html(htmlList);
		
		
	}
	</script>
	<script>
	makeModalPieChart=(data)=>{
		console.log("[JM]===makeModalPieChart===");
		console.log(data);
		$.ajax({
			 	url: contextPath+"/admin/makepiechart",
			 	type: "post",
			 	dataType: "json",
			 	data: {ccode: data },
			 	success: function(result){
			 		makeChartTest(result);
			 	},
			 	error : function(request, status, error){
					console.log(request);
					console.log(status);
					console.log(error);
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
			});
	}
	</script>
	<script>
	makeChartTest=(result)=>{
		if(result[0]!=null){
			makeChart();
			chartPie(result);
		}else{
			msgNoDetail();
		}
	}
	</script>
	<script>
	chartPie=(result)=>{
		console.log("[JM]===chartPie===")
		console.log(result);
		var Arr1 = new Array()
		for(ps=0;ps<result.length;ps++){
			console.log(result[ps].countforpiechart );
			Arr1[ps]=result[ps].countforpiechart;
		}
		console.log(Arr1);
				// Pie chart
			 	new Chart($(".pie"), {
					type: "pie",
					data: {
						labels: ["미진행", "보류", "숨김", "요청", "진행"],
						datasets: [{
							data: Arr1,
							backgroundColor: [
								"#dee2e6",
								window.theme.danger,
								"#000000",
								window.theme.warning,
								window.theme.primary
							],
							borderColor: "transparent"
						}]
					},
					options: {
						maintainAspectRatio: false,
						legend: {
							display: false
						}
					}
				}); 
			};
	</script>
	<script>
	makeChart=()=>{
		makeHtml="";
		makeHtml+=`
		<div class="admin-cen">
			<h2>진행중인 프로젝트 현황 분석</h2>
		</div>
		<hr>
		<div class="chart">
			<canvas class="pie"></canvas>
		</div>
		`
		$(".admin-chart-pie").html(makeHtml)
	}
	</script>
	<script>
	msgNoDetail=()=>{
		makeHtml="";
		makeHtml+=`
		<div class="admin-cen">
			<h2>진행중인 프로젝트 현황 분석</h2>
		</div>
		<hr>
		<div class="admin-cen">
			<h4>진행중인 프로젝트가 존재하지 않습니다.</h4>
		</div>
		`
		$(".admin-chart-pie").html(makeHtml)
	}
	</script>
</body>
</html>
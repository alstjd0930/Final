<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- 모달 -->
<div id="readScheduleModal" class="modal project right fade" aria-labelledby="myModalLabel">
<div class="modal-dialog pcal">
  <!-- Modal content -->
  <div class="modal-content pcal">
  	<div class="modal-header pcal">
  		
  		<!-- TODO -->
  		<span class="read-close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
  	</div>
 	<div class="modal-body">
 		<form id="readcalmodal">
	    	<div class="card">
	    		<!-- TODO 일정번호 -->
	    		<input type="hidden" name="sno">
				<div class="card-header" id="readcalmodal-header">
				<!-- 작성자 -->
				<div id="userid"></div> <!-- 여기에 뭐 적으면x -->
				<div class="read-dropdown-grop">
					<div class="btn-dropdown-toggle" id="read-dropdown" data-bs-toggle="dropdown">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical me-2"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
					</div>
					<ul class="dropdown-menu">
						     <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#updatecalmodal">수정</a></li>
						<li><a class="dropdown-item" href="#"> 삭제</a></li>
					</ul>
		  		</div>
				</div>
				<div class="card-body">
					<!-- 제목 -->
					<div class="stitle" id="title"></div>
				
					<div class="d-flex align-items-center" id="form-content">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar align-middle me-2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
						<!-- <input type="date" class="form-date" id="start" name="start" required="required">
						~
						<input type="date" class="form-date" id="end" name="end" required="required"> -->
						<div id="start"></div>~<div id="end"></div>
					</div>
					
						<!-- 참석자  -->
						<div id="attenduseridList"></div>
						<!-- 지도 -->
						<div>
							<div id="splace"></div>
							<div id="map"></div>
							
						</div>
						<!-- 내용 -->
						<div id="smemo"></div>
						
					<div>
						<!-- 댓글 -->
					<div class="cal-comment" >
						<form id="commentFrm">
							<h4>댓글쓰기</h4>
							<div class="comment-box">
								<input type="text" class="form-control comment" placeholder="Input">
								<input type="submit" class="c-btn" value="등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
  </div>
    <div class="modal-footer project">
  	</div>
  </div>
</div>
<!-- <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
	center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level : 3
// 지도의 확대 레벨
};
var a1 =  $('#splace');
var a2 = $('#splace').html();
function readtest(){

	if(a1 != null){
		showMap();
	}
}

//showMap 함수 정의
function showMap() {
	
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
console.log(a1);
console.log(a2);

// 주소로 좌표를 검색합니다
geocoder.addressSearch(a1 , function(result, status) {
	
		var address = a1
		if (address != null)
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
			});
			infowindow.open(map, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
			
			// 지도를 표시
		    mapContainer.style.display = 'block';
			
		}
	});
}
</script>  -->


<!-- 모달 -->
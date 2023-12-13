<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>식도라기 - 플래너 보기기</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/98401b861d.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/common.css">
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:"NPSfontRegular"; font-size: 16px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:707px;}
.menu_wrap {position:absolute;top:0;right:0;bottom:0;width:25%;overflow-y:auto;background:white;z-index: 1;font-size:12px;}
.bg_white {background:#fff;}
.menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
.menu_wrap .option{text-align: center;}
.menu_wrap .option p {margin:10px 0;}  
.menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
/* 추가된 스타일 코드 */
.search-bar {
    position: absolute;
    top: 10px;
    right: 24%;
    z-index: 2;
}
.submit {
    position: absolute;
    bottom: 10px;
    right: 24%;
    z-index: 2;
}
.search-bar input:focus { border: 3px solid #FF7A00; }
#search_image:focus { border: none; }
.circle {
    width: 24px;
    height: 24px;
    border-radius: 50%;
    background-color: #FF7A00;
    font-size: 16px;
    color: white; /* 텍스트 색상을 흰색으로 설정합니다. */
    text-align: center;
    line-height: 24px; /* 텍스트를 원의 중앙에 정렬합니다. */
}
#list_head * { margin: 0 5px; }
.ellipsis {
  width: 200px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
</style>
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	
	<!-- 플래너 보기 페이지에서는 플래너 리스트만 보이게 설정 -->
    <c:set var="lastIndex">${places.size()-1}</c:set>
   	<input type="hidden" id="x_point" value="${places[lastIndex].x_point}" />
   	<input type="hidden" id="y_point" value="${places[lastIndex].y_point}" />
       <!-- planner_idx가 not null일 때 실행될 코드 -->
    <!-- 나의 플래너 리스트 -->
    <div class="menu_wrap bg_white myplanner">
        <div class="option py-3">
            ${memberDTO.nickname}의 플래너 <span style="color: #FF7A00;">(${places[0].place_name} > ${places[lastIndex].place_name})</span>
        </div>  
        <ul id="myplaceList">
        	<c:forEach items="${places}" var="row" varStatus="loop">
            <li>
                <div id="list_head" class="d-flex justify-content-between">
                	<div class="d-flex my-3 px-2">		                	
	                    <div class="circle">${loop.count}</div>
	                    <span class="placeName">${row.place_name}</span>
	                    <input type="hidden" class="pos_x" value="${row.x_point}" />
	                    <input type="hidden" class="pos_y" value="${row.y_point}" />
	                    <span style="color: #999999;">${row.place_category}</span>
                	</div>
                	<div class="mt-2 me-1">
                    	<input type="hidden" value="${row.place_idx}" />
                	</div>
                </div>
                <div class="d-flex justify-content-between my-3 px-3">
                    <span style="width: 66%; color: gray;" class="ellipsis">
                    	${row.road_addr} <br />
                    	${row.place_telecom}
                    	<%-- ${row.memo} --%>
                    </span>
                    <button style="float: right; background-color: #FF7A00; color: white;" onclick="window.open().location.href='${row.place_url}'" class="btn rounded-4 px-3 py-2 me-1">상세정보</button>
                </div>
                <!-- 마지막 요소가 아니면 화살표 추가 -->
				<c:if test="${not loop.last}">
				    <div class="text-center" style="color: #FF7A00;">▼</div>
				</c:if>
            </li>
        	</c:forEach>
        </ul>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58c1517c26a147b5119aacb8ce4f7d5c&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

// 마지막 장소의 x, y좌표를 갖고 온다.
var x_point = $("#x_point").val();
var y_point = $("#y_point").val();
// 정보가 없다면 기본값을 시청역으로 합니다.
if (x_point=='' || y_point=='') {
	x_point = 126.9786567;
	y_point = 37.566826;
} else {
	x_point = parseFloat(x_point);
	y_point = parseFloat(y_point);
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(y_point, x_point), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
// searchPlaces();

// ##################################################################
// 루트를 지도에 띄워줍니다. 호출방법은 아래와 같습니다.
// drawRoutes('127.10255558658325,37.51260447840551', '127.14840204005722,37.48011055297601');
// JavaScript내부에서 JSTL의 forEach문을 사용했습니다.
<c:forEach var="i" begin="0" end="${places.size()}" step="1">
	drawRoutes('${places[i].x_point},${places[i].y_point}', '${places[i+1].x_point},${places[i+1].y_point}');
</c:forEach>
function drawRoutes(start, end) {
    $.ajax({
        // 카카오 모빌리티 길찾기 API 사용
        url: 'https://apis-navi.kakaomobility.com/v1/directions',
        type: "get",
        headers: {
            Authorization: 'KakaoAK ada18f999f4c859dca4dc9e1707710b7',
            'Content-Type': 'application/json'
        },
        data: {
            origin: start,
            destination: end
        },
        success: function(res) {
            console.log("요청성공");
            const linePath = [];
            res.routes[0].sections[0].roads.forEach(router => {
                router.vertexes.forEach((vertex, index) => {
	                // x,y좌표가 우르르 들어온다. 그러니 인덱스가 8의 배수일때만 linePath에 넣는다.
	                if (index%8 == 0) {
	                    linePath.push(new kakao.maps.LatLng(router.vertexes[index+1], router.vertexes[index]));
	                }
                });
            });
            var polyline = new kakao.maps.Polyline({
                path: linePath, // 선을 구성하는 좌표배열 입니다
                strokeWeight: 5, // 선의 두께 입니다
                strokeColor: '#FF0000', // 선의 색깔입니다
                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid' // 선의 스타일입니다
            });
            polyline.setMap(map);
        },
        error: function(err) {
            console.log("요청실패:"+err);
        }
    });
}
// ################################################################################
// 각 경로마다 마커를 띄워줍니다.
// 마커를 표시할 위치와 title 객체 배열입니다 
var x_pos = [];
var y_pos = [];
$(".pos_x").each(function() {
	x_pos.push($(this).val());
});
$(".pos_y").each(function() {
	y_pos.push($(this).val());
});

var placeNames = [];
$(".placeName").each(function() {
	placeNames.push($(this).text());
});

var positions = [];
for (let i=0; i<x_pos.length; i++) {
	positions.push({ title: placeNames[i], latlng: new kakao.maps.LatLng(y_pos[i], x_pos[i]) });
}

console.log(y_pos[0], x_pos[0]);

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png",
imageSize = new kakao.maps.Size(64, 69),
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    
for (var i=0; i<positions.length; i++) {
    
    // 마커 이미지의 이미지 크기 입니다
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀
        image : markerImage // 마커 이미지 
    });
    
    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        position : positions[i].latlng, 
        content : "<div style='width: 150px; padding: 3px; background-color: #FF7A00; color: white; text-align: center;'>"+positions[i].title+"</div>"
    });
      
    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
    infowindow.open(map, marker);
}
// ################################################################################
</script>

</body>
</html>
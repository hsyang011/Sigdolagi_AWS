<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>식도라기 - 플래너 만들기</title>
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
    <!-- 장소 검색 버튼 -->
    <div class="search-bar me-2">
        <form onsubmit="searchPlaces(); return false;" class="d-flex align-items-center">
            <input type="text" id="keyword" class="form-control rounded-4 p-2" size="15" placeholder="장소 검색" style="height: 60px; width: 240px;">
            <input type="image" id="search_image" src="../images/search_icon.png" height="30" class="rounded-pill" style="position: relative; right: 40px; cursor: pointer;">
        </form>
    </div>
    <!-- 작업 완료 버튼 -->
    <div class="submit me-2">
        <button class="btn rounded-4 px-5 py-3" style="background-color: #FF7A00; color: white; position: relative; right: 30px;" data-bs-toggle="modal" id="addBtn" data-bs-target="#addPlannerModal">작업 완료</button>
    </div>
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>


<c:choose>
    <c:when test="${not empty planner_idx}">
       	<c:set var="lastIndex">${places.size()-1}</c:set>
    	<input type="hidden" id="x_point" value="${places[lastIndex].x_point}" />
    	<input type="hidden" id="y_point" value="${places[lastIndex].y_point}" />
        <!-- planner_idx가 not null일 때 실행될 코드 -->
	    <!-- 나의 플래너 리스트 -->
	    <div class="menu_wrap bg_white myplanner">
	        <div class="option py-3">
	            나의 플래너 <span style="color: #FF7A00;">(${places[0].place_name} > ${places[lastIndex].place_name})</span>
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
                           	<img src="../images/cross-wish-ico.png" alt="" class="deletePlace" style="cursor: pointer;">
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
    </c:when>
    <c:otherwise>
        <!-- planner_idx가 null일 때 실행될 코드 -->
	    <div class="menu_wrap bg_white myplanner">
	        <div class="option py-3">
	            장소를 탐색 후, 플래너에 추가해보세요!
	        </div>  
	    </div>
    </c:otherwise>
</c:choose>

	<!-- 검색결과 리스트 -->
    <div class="menu_wrap bg_white searchResult">
        <div class="option py-3" style="font-family: 'NPSfontRegular'; font-size: 16px;">
            <span id="searchText"></span>
            <img src="../images/cross-wish-ico.png" alt="" id="closeSearchResult" class="me-2" style="cursor: pointer; float: right;">
        </div>
        <hr>
        <ul id="placesList" style="padding-left: 0; font-family: 'NPSfontRegular'; font-size: 16px;"></ul>
        <div id="pagination" style="font-family: 'NPSfontRegular'; font-size: 16px;"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58c1517c26a147b5119aacb8ce4f7d5c&libraries=services"></script>
<script>
$(function() {
	// 문서가 로드되면 검색결과만 숨겨서 나의 플래너가 먼저 보이게 처리한다.
	$(".searchResult").hide();
	// 나의 플래너에서 x를 누르면 해당 일정이 삭제됨
	$(".deletePlace").click((e) => {
		let data = {
			place_idx: $(e.target).next().val()
		};
		// 삭제 요청 ajax
		$.ajax({
	        type: "POST",
	        url: "./deleteFromPlanner.do",
	        data: data,
	        success: function(res) {
	            console.log("요청성공");
	            // 플래너에서 삭제
				$(e.target).parent().parent().parent().remove();
	            // 재실행
	            location.reload();
	        },
	        error: function(err) {
	    		console.log("요청실패");
	        }
		});
	});
});

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
//################################################################################
//각 경로마다 마커를 띄워줍니다.
//마커를 표시할 위치와 title 객체 배열입니다 
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

//마커 이미지의 이미지 주소입니다
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
     title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
     image : markerImage // 마커 이미지 
 });
}
//################################################################################

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	// 나의 플래너를 숨기고 검색 결과를 보여준다.
	$(".myplanner").hide();
	$(".searchResult").show();
	// 검색결과 닫기 버튼을 누르면 나의 플래너가 나옴.
	$("#closeSearchResult").click((e) => {
		$(".searchResult").hide();
		$(".myplanner").show();
	});

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 전역변수 선언
let placeArr = [];

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        $("#searchText").html('<span style="color: #FF7A00;">' + $("#keyword").val() + '</span> 검색결과'); // 검색결과 텍스트 반영

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        console.log(data[0]);
        placeArr = data;
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementsByClassName('searchResult')[0],
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="d-flex justify-content-between align-items-center"><div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';
    itemStr += '<button style="float: right; background-color: #FF7A00; color: white;" onclick="addList('+index+');" class="btn rounded-4 px-3 py-2 me-1">추가하기</button></div>'; 

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

// 추가하기 버튼을 눌렀을 때, DB에 저장 후, 나의 플래너 리스트로 전환
function addList(i) {
	// console.log('하이', i, placeArr[i]);
	let place = placeArr[i];
	let data = {
		planner_idx: ${planner_idx},
		lot_addr: place.address_name,
		road_addr: place.road_address_name,
		place_name: place.place_name,
		place_category: place.category_name,
		place_telecom: place.phone,
		x_point: place.x,
		y_point: place.y,
		place_url: place.place_url
	};
	
	$.ajax({
        type: "POST",
        url: "./addToPlanner.do",
        data: data,
        success: function(res) {
            console.log("요청성공");
            $(".searchResult").hide();
            $(".myplanner").show();
            // 새로고침하여 플래너 추가 업데이트
            location.reload();
        },
        error: function(err) {
    		console.log("요청실패");
        }
	});
	
}
</script>

	
<!-- The Modal -->
<style>
#addPlannerModal * { font-size: 16px; font-family: "NPSfontRegular"; }
#select_cate .btn { background-color: #FF7A00; color: white; }
</style>
<div class="modal" id="addPlannerModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <div id="thumbnail" style="width:100%;height:350px;">
                	<form name="savePlanner" action="./saveProcess.do" enctype="multipart/form-data" method="post">
                		<input type="hidden" name="planner_idx" id="planner_idx" value="${planner_idx}" />
                		<input type="hidden" name="cate" id="cate" />
                		<input type="hidden" name="plan_start" value="${places[0].place_name}" />
                		<input type="hidden" name="plan_end" value="${places[lastIndex].place_name}" />
                		<input type="file" name="ofile" />
                	</form>
                </div>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <h3 style="font-weight: bold; font-size: 1.5em;">카테고리 선택 <span id="select_val" style="color: #FF7A00;"></span></h3>
                <div id="select_cate" class="d-flex align-items-center justify-content-between">
                    <button class="btn rounded-pill">아이들과</button>
                    <button class="btn rounded-pill">커플/신혼</button>
                    <button class="btn rounded-pill">부모님과</button>
                    <button class="btn rounded-pill">남자혼자</button>
                    <button class="btn rounded-pill">여자혼자</button>
                    <button class="btn rounded-pill">여자끼리</button>
                    <button class="btn rounded-pill">남자끼리</button>
                    <button class="btn rounded-pill">남녀함께</button>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <div id="review" class="my-5" style="width: 100%;">
                    <div class="d-flex justify-content-between">
                        <p>장소 <span style="color: #FF7A00;">${places.size()}건</span></p>
                        <div></div>
                    </div>
                    <ul id="myplaceList">
                    <c:if test="${not empty planner_idx}">
			        	<c:forEach items="${places}" var="row" varStatus="loop">						        	
			            <li>
			                <div id="list_head" class="d-flex justify-content-between">
			                	<div class="d-flex my-3 px-2">		                	
				                    <div class="circle">${loop.count}</div>
				                    <span>${row.place_name}</span>
				                    <span style="color: #999999;">${row.place_category}</span>
			                	</div>
			                	<div class="mt-2 me-1">
			                          	<img src="../images/cross-wish-ico.png" alt="" class="deletePlace" style="cursor: pointer;">
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
                    </c:if>
			        </ul>
                </div>
                <div class="d-flex">
	                <button type="button" id="save" class="btn rounded-pill me-3" style="background-color: #FF7A00; color: white;">저장하기</button>
	                <button type="button" class="btn rounded-pill" style="background-color: #FF7A00; color: white;" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$("#select_cate .btn").click((e) => {
	$("#select_val").text($(e.target).text());
	$("#cate").val($(e.target).text());
});
$("#save").click((e) => {
	if ($("#select_val").text() == '') {
		alert("카테고리를 선택해주세요!");
	} else {
		// 저장요청 보내기 코드
		document.savePlanner.submit();
	}
});
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/kakaomap.css" />
</head>
<body>

	<div class="button-container">
	<h2>지역 선택</h2>
		<button onclick="zoomIn('gyeonggi')">경기도</button>
		<button onclick="zoomIn('gangwon')">강원도</button>
		<button onclick="zoomIn('chungcheong')">충청도</button>
		<button onclick="zoomIn('gyeongsang')">경상도</button>
		<button onclick="zoomIn('jeolla')">전라도</button>
		<button onclick="zoomIn('jeju')">제주도</button>
	</div>

<div class="map_wrap">
	<div id="map" style="width:900px;height:500px;position:relative;overflow:hidden;"></div>
	
	<div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=416439531d0e4d8f33eb240c9b791ffb&libraries=services"></script>
<script src="${pageContext.request.contextPath}/js/kakaomap.js"></script>
</body>
</html>
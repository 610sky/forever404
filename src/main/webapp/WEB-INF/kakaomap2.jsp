<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/kakaomap2.css" />
</head>
<body>
<div class="search_menu">
		<div>
			<form onsubmit="searchLocalPlaces(); return false;">
				위치 검색 : <input type="text" id="keyword" size="15">
				<button type="submit">검색하기</button>
			</form>
		</div>
	</div>
	

<div class="map_wrap">
	<div id="map" style="width:900px;height:500px;position:relative;overflow:hidden;"></div>
	 <ul id="category">
        <li id="AT4" data-order="0"> 
            <span class="category_bg visit"></span>
            관광명소
        </li>       
        <li id="FD6" data-order="1"> 
            <span class="category_bg food"></span>
            음식점
        </li>  
        <li id="CE7" data-order="2"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="AD5" data-order="3"> 
            <span class="category_bg hotel"></span>
            숙박
        </li>      
    </ul>
</div>



<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=416439531d0e4d8f33eb240c9b791ffb&libraries=services"></script>
<script src="${pageContext.request.contextPath}/js/kakaomap2.js"></script>


</body>
</html>
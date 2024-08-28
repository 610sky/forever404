<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/kakaomap2.css" />
<script src="https://kit.fontawesome.com/ef885bd654.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="search_menu">
		<div>
			<form onsubmit="searchLocalPlaces(); return false;">
				위치 검색 : <input type="text" id="keyword" size="15">
				<button type="submit" id="bttn"><i class="fa-solid fa-magnifying-glass"></i></button>
			</form>
		</div>
	</div>
	

<div class="map_wrap">
	<div id="map" style="width:900px;height:500px;position:relative;overflow:hidden;"></div>
	 <ul id="category">
        <li id="AT4"> 
        	<i class="fa-solid fa-landmark"></i>
           <!-- <span class="category_bg visit"></span> -->
            <span>관광명소</span>
        </li>       
        <li id="FD6"> 
        	<i class="fa-solid fa-utensils"></i>
           <!-- <span class="category_bg food"></span> -->
            <span>음식점</span>
        </li>  
        <li id="CE7"> 
       		<i class="fa-solid fa-mug-saucer"></i>
           <!-- <span class="category_bg cafe"></span> -->
            <span>카페</span>
        </li>  
        <li id="AD5"> 
        	<i class="fa-solid fa-house"></i>
           <!-- <span class="category_bg hotel"></span> -->
            <span>숙박</span>
        </li>      
    </ul>
</div>

<div class="testtesttest">
    <h1>테스트</h1>
   			메모 : <input type="text" id="memo" name="memo"><br/>
			<p>예약
			<select id="isReservation">
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select>
			</p>
			<p>시간
			<select id="time">
				<option value="0">0시</option>
				<option value="1">1시</option>
				<option value="2">2시</option>
				<option value="3">3시</option>
				<option value="4">4시</option>
				<option value="5">5시</option>
				<option value="6">6시</option>
				<option value="7">7시</option>
				<option value="8">8시</option>
				<option value="9">9시</option>
				<option value="10">10시</option>
				<option value="11">11시</option>
				<option value="12">12시</option>
				<option value="13">13시</option>
				<option value="14">14시</option>
				<option value="15">15시</option>
				<option value="16">16시</option>
				<option value="17">17시</option>
				<option value="18">18시</option>
				<option value="19">19시</option>
				<option value="20">20시</option>
				<option value="21">21시</option>
				<option value="22">22시</option>
				<option value="23">23시</option>
			</select>
			</p>
			<span id="serviceName"></span><br>
			<span id="serviceJibun"></span><br>
			<span id="servicePhone"></span><br>
			<input type="submit" value="테스트" id="ssTest">
	</div>
	
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=416439531d0e4d8f33eb240c9b791ffb&libraries=services"></script>
<script src="${pageContext.request.contextPath}/js/kakaomap2.js"></script>


</body>
</html>
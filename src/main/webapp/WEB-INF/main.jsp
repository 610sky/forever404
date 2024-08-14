<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/calander.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}js/index.global.js"></script>
</head>
<body>
	<c:if test="${not empty user}">
	<header>
      <div class="addgroup">
        <button id="addgroup"><i class="fa-solid fa-plus"></i></button>
      </div>
      <button type="button" onclick="location.href='/logout'">로그아웃</button>
      <div class="group" id="group">
     	 </div>
     	 <div class="user">
        <i class="fa-regular fa-user"></i>
      </div>
	</header>
	<div id="calendar-container">
      <div id="calendar"></div>
    </div>
    <h1>큰그룹 정보</h1>
		<form id="frm">
			여행 이름 : <input type="text" name="tripName"><br/>
			시작 날짜 : <input type="text" name="startDate"><br/>
			종료 날짜 : <input type="text" name="endDate"><br/>
			총 경비 : <input type="text" name="totalMoney"><br/>
			<input type="submit" value="큰그룹정보" id="add">
		</form>
		<div id="modal1" class="modal">
      <div class="modalcontent">
        <span class="close">&times</span>
        <h2>그룹 추가</h2>
        <hr />
        <div class="add">
        	<p><input type="text" id="textBox"></p>
          <button id="schedule" class="add2">추가</button>
        </div>
      </div>
    </div>
		<script src="https://kit.fontawesome.com/ef885bd654.js"
      		crossorigin="anonymous">
		</script>
		<script>
			$("#addgroup").click(function () {
			  $("#modal1").css("display", "block");
			});
			  $(".close").click(function () {
			     $(".modal").css("display", "none");
			  });
			  $(window).click(function (event) {
			     if ($(event.target).is(".modal")) {
			       $(".modal").css("display", "none");
			     }
			  });
			$(document).keydown(function (event) {
			    if (event.keyCode == 27) {
			       $(".modal").css("display", "none");
			     }
			  });
    	</script>
    	
		<script>
		let buttonId;
		$(document).ready(function () {
			
		$.ajax ({
			type : "post",
			url : "/userGroup",
			success : function(list) {
				const groupList = list.map((item) => item.bigGroup);		
				const nameList = groupList.map((value) => value.groupName);				
				nameList.forEach((value) => {
					$("#group").append("<button type='button' class='groupButton' id='"+value+"'>"+"<i class='fa-solid fa-user-group'></i></button><span>"+value+"</span>");
				});
			}
		});
		
		
		});
		$(document).on('click', '.groupButton', function() {
	        buttonId = $(this).attr('id');
	        console.log("버튼 클릭됨, ID:", buttonId);
	    });
		$("#add").click(() => {
			$.ajax({
				type : 'post',
				url : '/scheduleAdd',
				data : {info :$('#frm').serialize(),
						groupName : buttonId
						},
				success : function() {
					console.log('!');
				}
			
			});
		});
	</script>

	<script>
	$("#schedule").click(() => {
		const title = $("#textBox").val();
		$.ajax ({
			type : "post",
			url : "/addGroup",
			data : "groupName=" + $("#textBox").val(),
		// <button><i class="fa-solid fa-plus"></i></button>
			success : function(result) {
				console.log(result);
				if(result == true) {
					$("#successText").text("생성완료");
					$("#group").prepend("<button type='button' class='groupButton'><i class='fa-solid fa-user-group'></i></button><span>"+title+"</span>");
				} else {
					$("#successText").text("사용할 수 없는 그룹명입니다.");
				}
			}
		});
	});
	</script>
	</c:if>
	<script src="${pageContext.request.contextPath}/js/calander.js"></script>
</body>
</html>

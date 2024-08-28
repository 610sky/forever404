<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}css/calander.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}js/index.global.min.js"></script>

</head>
<body>
	<c:if test="${not empty user}">
		<jsp:include page="header.jsp" />
      <div>
        <div id="calendar-container">
          <div id="calendar"></div>
        </div>
      </div>
		
      
      <button id="deleteGroup" class="add2">삭제</button>
      
      <script>
      $("#deleteGroup").click(() => {
    	  let groupName = localStorage.getItem("groupName");
    	 $.ajax({
    		 url : '/deleteGroup',
    		 type : 'post',
    		 data : 'groupName=' + groupName,
    		 success : function () {
    			 window.location.href = "/main";
    			 
    		 }
    	 }); 
      });
      </script>
		<div id="modal1" class="modal">
			<div class="modalcontent">
				<p class="close">&times</p>
				<h2>그룹 추가</h2>
				<hr />
				<br />
				<p>
					새로운 그룹에 이름을 부여해 <br /> 동료들과 함께해 보세요
				</p>
				<section class="mid">
					<h3>새 그룹 명</h3>
					<br /> <input type="text" id="textbox" />
					<div class="add">
						<button id="addGroup" class="add2">만들기</button>
						<div id="successText"></div>
						>
					</div>
				</section>
			</div>
		</div>
		<div id="modal2" class="modal">
			<div class="modalcontent">
				<p class="close">&times</p>
				<h2>그룹 참가</h2>
				<hr />
				<br />
				<p>
					아래에 전달받은 그룹코드를 입력해<br /> 그룹에 참여해보세요
				</p>
				<section class="mid">
					<h3>그룹 코드</h3>
					<br /> <input type="text" placeholder="ex) Forever404"
						id="inputatt" />
					<div class="add">
						<button id="attend" class="add2">그룹 참가하기</button>
					</div>
				</section>
			</div>
		</div>
		<script>
        $("#attend").click(() => {
          const title = $("#inputatt").val();
          $.ajax({
            type: "post",
            url: "/attendGroup",
            data: "groupName=" + title,
            success: function (check) {
            	if(check === true){
            		alert("그룹 참여 성공:)");
            	} else {
            		alert("없는 그룹입니다");
            	}
            	location.reload();
            },
            error: function(){
            	alert("실패");
            }
          });
        });
      </script>
     
      <div id="allList">
       ${groupName}
        <c:forEach items="${bsList}" var="bs">
        ${bs.title} : ${bs.bsCode} / 총 경비 ${bs.entireMoney}원, ${bs.startDate} ~ ${bs.endDate}<br>
        </c:forEach>
      </div>

      <div id="bigModal" style="display: none">
        <div id="modalContent3">
          <header class="mdl-header">
            <p class="head-wrd">일정 추가하기</p>
            <i class="fa-solid fa-xmark" id="X"></i>
          </header>
          <!-- <div id="addMemo"><h1>안녕하세요</h1></div> -->
          <div class="modsection" id=addMemo>
            <button id=addMemoh1></button>
          <p id=addMemop></p><p id=addMemop2></p><p id=addMemop3></p>
          </div>
          <button class="modsection" id="six">추가</button>
        </div>
      </div>
      
      
      <div id="detModal" style="display: none">
        <div id="modalContent4">
          <header class="mdl-header2">
            <p class="head-wrd2">세부 일정 추가</p>
            <i class="fa-solid fa-xmark" id="X2"></i>
          </header>
          <div class="inpt-brder" id="title">
            <i class="fa-solid fa-pencil"></i>
            <input
              type="text"
              placeholder="일정 이름"
              class="tripinfo"
              id="title2"
            />
          </div>
          <div class="inpt-brder">
            <i class="fa-solid fa-plane-departure"></i>
            <input
              type="date"
              placeholder="시작 날짜"
              class="tripinfo"
              max="9999-12-31"
              id="startDate"
            />
          </div>
          <div class="inpt-brder">
            <i class="fa-solid fa-plane-arrival"></i>
            <input
              type="date"
              placeholder="종료 날짜"
              class="tripinfo"
              max="9999-12-31"
              id="endDate"
            />
          </div>
          <div class="inpt-brder" id="date">
            <i class="fa-solid fa-coins"></i>
            <input
              type="text"
              placeholder="여행 총 경비"
              class="tripinfo"
              id="entireMoney"
            />
          </div>
          <div><button class="submit" id="final">추가하기</button></div>
        </div>
      </div>

		<script src="https://kit.fontawesome.com/ef885bd654.js"
			crossorigin="anonymous"></script>
	<script>	
    $("#final").click(() => {
        $.ajax({
          type: "post",
          url: "/scheduleAdd",
          data: {
            title: $("#title2").val(),
            startDate: $("#startDate").val(),
            endDate: $("#endDate").val(),
            entireMoney: $("#entireMoney").val(),
          },
          success: function (result) {
        	 
          	alert("추가됐음!");
          	const id = $("#title2").val();
          	$("#addMemo").html("<button>"+id+"</button>");
          	location.reload();
          },
        });
      });
        $("#add2").click(() => {
          $.ajax({
            type: "post",
            url: "/scheduleAdd2",
            data: {
              groupName: buttonId,
              memo: $("#memo").val(),
              items: $("#items").val(),
              isReservation: $("#isReservation").val(),
            },
            success: function () {},
          });
        });
      </script>
 
		<script>
        $(".add2").click(() => {
         const title = $("#textbox").val().trim();
         const miniTitle = title.substring(0, 2);
          $.ajax({
            type: "post",
            url: "/addGroup",
            data: { groupName : title },
            success: function (response) {
              if (response) {
                $(".group").append(
                  "<button type='button' data-code='" + title + "' class='groupButton' id='" +
                  	miniTitle +
                    "'>" + miniTitle +
                    "</button><span>" +
                    title +
                    "</span>"
                );
             // 사용할 앱의 JavaScript 키를 설정해 주세요.
              
                //$('.modal').css("display", "none");
       
              } else {
                $("#successText").text("사용할 수 없는 그룹명입니다.");
              }
            },
          });
        });

      </script>

    </c:if>
    <!-- 로그아웃 cif -->
    <c:if test="${empty user}">
      <script>
        window.location.href = "redirect:/";
      </script>
	</c:if>
	<script>
    const bigSchedules = [];
    let schedule = {};
    <c:forEach items="${bsList}" var="item">
	    schedule.title = "${item.title}";
	    schedule.start = "${item.startDate}";
	    schedule.end = "${item.endDate}" ;
	    schedule.money = "${item.entireMoney}";
	    schedule.color = "${item.scheduleColor}";
	    schedule.bsCode = "${item.bsCode}";
    	bigSchedules.push(schedule);
    	schedule = {};
    </c:forEach>
    console.log(bigSchedules);
    </script>
	<script src="${pageContext.request.contextPath}/js/calander.js"></script>
</body>
</html>
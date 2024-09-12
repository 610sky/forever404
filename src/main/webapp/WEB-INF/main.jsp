<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>ForeverCalendar</title>
    <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/reset.css"/>
    <link rel="stylesheet"
      href="${pageContext.request.contextPath}css/calander.css"/>
    <link rel="stylesheet"
      href="${pageContext.request.contextPath}css/tetris.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}js/index.global.min.js"></script>
    <script src="${pageContext.request.contextPath}js/tetris.js"></script>
  </head>
  <body>
    <script>
      const currentURL = window.location.href;
      const targetURL = "http://localhost:8080/main";
      if (currentURL === targetURL) {
        localStorage.clear();
      }
    </script>
    
    <c:if test="${not empty user}">
      <jsp:include page="header.jsp" />

      <c:if test="${check==true}">
        <c:if test="${not empty groupName}">
          <div id="calendar-container">
            <div id="btn-Container">
              <button id="teamBtn">
                <i id="teamUser" class="fa-solid fa-user"></i>
                <h1>${userListSize}</h1>
              </button>
              <button id="teamDelBtn">그룹 삭제</button>

  <script>
  	// 그룹 삭제
    $("#teamDelBtn").click(() => {
      let groupName = localStorage.getItem("groupName");
      if (
        confirm(
          "삭제하시면 복구할 수 없습니다 \n정말로 삭제하시겠습니까??"
        )
      ) {
        $.ajax({
          url: "/deleteGroup",
          type: "post",
          data: "groupName=" + groupName,
          success: function () {
            window.location.href = "/main";
          },
        });
      } else {
        return false;
      }
    });
  </script>
           </div>
           <div id="calendar"></div>
         </div>
       </c:if>
       <c:if test="${empty groupName}">
       	<div id="pId1">
       		<p>그룹을 선택하세요</p>
       	</div>
       <div class="selectOrAdd">
         <canvas></canvas>
       </div>
      </c:if>
     </c:if>

      <c:if test="${check==false}">
        <p id="pId1">그룹을 생성하세요</p>
        <div class="selectOrAdd"><canvas></canvas></div>
      </c:if>
      <div id="teamModal" style="display: none">
        <div id="modalContent7">
          <i id="cancelBtn" class="fa-solid fa-x"></i>
          <c:if test="${not empty groupName}">
            <c:forEach items="${userList}" var="smallGroup">
              <div id="users">
                <i id="UserProfile" class="fa-solid fa-user"></i>
                <p id="userCount">${smallGroup.user.id}</p>
              </div>
            </c:forEach>
          </c:if>
        </div>
      </div>

      <div id="bigModal" style="display: none">
        <div id="modalContent3">
          <header class="mdl-header">
            <p id="addTitle" class="head-wrd">일정 추가하기</p>
            <button id="addMemoh1"></button>
          </header>
          <i class="fa-solid fa-xmark" id="X"></i>

          <div class="modsection" id="addMemo">
            <div id="memoSection">
            </div>
            <div id="memoSection1">
              여행 시작 :
              <p id="addMemop"></p>
            </div>
            <div id="memoSection2">
              여행 끝 :
              <p id="addMemop2"></p>
            </div>
            <div id="memoSection3">
              여행 경비 :
              <p id="addMemop3"></p>
              원
            </div>
            <div id="memoSection4">
              <p id="addMemop4">
               아직 일정이 없어요, 일정을 넣어주세요!
              </p>
            </div>
          </div>
          <button class="modsection" id="seven"><i class="fa-solid fa-images"></i></button>
          <button class="modsection" id="six"><i class="fa-solid fa-paper-plane"></i></button>
          <button class="modsection" id="eight"><i class="fa-solid fa-trash-can"></i></button>
        </div>
      </div>

      <div id="detModal" style="display: none">
        <div id="modalContent4">
          <header class="mdl-header2">
            <p class="head-wrd2">세부 일정 추가</p>
          </header>
          <i class="fa-solid fa-xmark" id="X2"></i>
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
              type="text"
              placeholder="시작 날짜"
              onfocus="this.type='date'"
              class="tripinfo"
              max="9999-12-31"
              id="startDate"
            />
          </div>
          <div class="inpt-brder">
            <i class="fa-solid fa-plane-arrival"></i>
            <input
              type="text"
              placeholder="종료 날짜"
              onfocus="this.type='date'"
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
          <div><button class="submit" id="final"><i id="finalBtn" class="fa-regular fa-calendar-plus"></i></button></div>
        </div>
      </div>
      <div id="albumModal" style="display: none">
        <div id="modalContent6">
          <header id="mdl-header3">
            <button id="delete">삭제</button>
            <i class="fa-solid fa-xmark" id="close"></i>
          </header>
          <div id="modalContent5">
            <main id="photoSection">
              <div id="mainImg"></div>
            </main>
          </div>
          <div id="picScroll">
            <button id="slideBtn1" class="slide">&#10094;</button>
            <button id="slideBtn2" class="slide">&#10095;</button>
            <div id="slider"></div>
          </div>
        </div>
      </div>
      
      <script src="https://kit.fontawesome.com/ef885bd654.js"
        crossorigin="anonymous"></script>
        
      <script>
      
       // 전체적인 일정 추가
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
              alert("일정 추가 완료!");
              const id = $("#title2").val();
              $("#addMemo").html("<button>" + id + "</button>");
              location.reload();
            },
            error: function () {
              alert("추가에 실패했습니다.");
              location.reload();
            },
          });
        });
      </script>

    </c:if>
    <!-- 로그아웃 -->
    <c:if test="${empty user}">
      <script>
        alert("로그아웃 처리 되었습니다!");
        window.location.href = "/";
      </script>
    </c:if>
    
    <script>
      const bigSchedules = [];
      let schedule = {};
      <c:forEach items="${bsList}" var="item">
        schedule.title = "${item.title}"; 
        schedule.start = "${item.startDate}";
        schedule.end = "${item.endDate}"; 
        schedule.money = "${item.entireMoney}"; 
        schedule.color = "${item.scheduleColor}"; 
        schedule.bsCode = "${item.bsCode}"; 
        bigSchedules.push(schedule); 
        schedule = {};
      </c:forEach>;
    </script>
    
    <script src="${pageContext.request.contextPath}/js/calander.js"></script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/reset.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/detail2.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&family=Nanum+Gothic:wght@400;700&display=swap"
      rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  </head>
  <body>
    <header>
      <!-- <div id="group"><a href="/${groupName}">그룹</a></div> -->
      <div id="group"><button type="text" class="group" onclick="location.href='/${groupName}';">그룹</button></div>
      <section id="date">
        <c:forEach items="${selectSRange}" var="date">
          <div class="date" data-date="${date}"></div>
        </c:forEach>
        <h1 id="h1date">"${date}"</h1>
      </section>
    </header>
    <main>
      <section class="section1">
        <div id="pay">
          <span id="bsCode" style="display: none"> ${param.bsCode} </span>
          <c:forEach items="${selectS}" var="ssss">
            ${ssss.bigSchedule.bsCode}
          </c:forEach>
          <c:forEach items="${moneyL}" var="m"> ${m.useMoney} </c:forEach>
          <p>남은금액 : 300,000원</p>
          <p>총 지불금액 : 250,000원</p>
          <p>지불품목 : 바닐라라떼, 케이크</p>
          <p>사용금액 : 50,000원</p>
          <button id="payPlus">추가</button>
        </div>
      </section>
      <div id="time1" class="time"><p>09:00</p></div>
      <button id="nextBtn1" class="button1">&#10095;</button>

      <div class="sectioncontainer">
        <section class="section">
          <div class="img">image</div>
          <div>
            <div class="title"><h2>타이틀</h2></div>
            <p>위치</p>
            <p>영업시간</p>
            <button id="imgPlus">추가</button>
          </div>
        </section>
      </div>
      <section class="section">
      <div class="img">image</div>
        <div>
          <h2>타이틀</h2>
          <p>위치</p>
          <p>영업시간</p>
       
        </div>
      </section>
      <button id="nextBtn2" class="button2">&#10094;</button>

      <section class="time" id="time2">
        <div><p>18:00</p></div>
      </section>
    </main>

    <section id="btncontainer">
      <button id="button3" class="btn1">일정 추가</button>
      <button id="button4" class="btn1">사진 추가</button>
      <button id="button5" class="btn1">지불 품목</button>
      <button id="plus" class="btn">
        <i class="bi bi-plus-square"></i>
      </button>
    </section>

    <script>
      const kakaobtn = document.querySelector("#plus");
      kakaobtn.addEventListener("click", () => {
    	  $.ajax({
    		  
    	  });
        window.location.href = "/kakao/map";
      });
    </script>

    <!-- 
    <div id="modal1" class="modal">
      <div class="modalcontent">
        <span class="close">&times</span>
        <h2>일정 추가</h2>
        <hr />
        <div class="ps">
          <p>시작시간 :</p>
          <select id="start">
            <option value="09:00">09:00</option>
            <option value="10:00">10:00</option>
          </select>
        </div>
        <div class="ps">
          <p>종료시간 :</p>
          <select id="finish">
            <option value="09:00">18:00</option>
            <option value="10:00">19:00</option>
          </select>
        </div>
        <div class="ps">
          <p>위치 :</p>
          <input type="text" />
        </div>
        <div class="ps">
          <p>영업시간 :</p>
          <input type="text" />
        </div>
        <div class="add">
          <button id="schedule" class="add2">추가</button>
        </div>
      </div>
    </div>
-->
	<div id="modal2" class="modal">
		<div class="modalcontent">
			<span class="close">&times</span>
			<h2>사진 추가</h2>
			<hr />
			<form id="fileForm" method="post" enctype="multipart/form-data">
				<div class=fileContainer>
					<label for="file" class="upload"><div>+</div></label> <input
						id="file" type="file" name="files" multiple accept="image/*"
						onchange="imgShow(event)" value="+" placeholder="+" />
					<div id="image_container"></div>
				</div>

			</form>
			<section class="addSection">
				<button class="add2" id="fileSubmit">업로드</button>
			</section>
		</div>
	</div>
	<script>
          let bsCode = localStorage.getItem("bsCode");

          function imgShow(event) {
            const container = document.getElementById("image_container");
            container.innerHTML = ""; // Clear existing images
            Array.from(event.target.files).forEach((file) => {
              const reader = new FileReader();
              reader.onload = function (e) {
                const img = document.createElement("img");
                img.setAttribute("src", e.target.result);
                container.appendChild(img);
              };
              reader.readAsDataURL(file);
            });
          }

          $("#fileSubmit").click(() => {
            const files = new FormData($("#fileForm")[0]);
            files.append("bsCode", bsCode);
            $.ajax({
              type: "POST",
              enctype: "multipart/form-data", // 필수
              data: files, // 필수
              processData: false, // 필수
              contentType: false, // 필수
              cache: false,
              url: "/testupload",
              success: function () {
                console.log("!");
              },
            });
          });
        </script>
      </div>
    </div>
    <div id="modal3" class="modal">
      <div class="modalcontent">
        <span class="close">&times</span>
        <h2>지불 품목</h2>
        <hr />
        지불 품목 : <input type="text" class="money" id="buyingList" /> <br />
        사용 금액 :
        <input type="text" class="money" id="useMoney" />
        <div class="add">
          <button class="add2" id="moneyBtn">추가</button>
        </div>
      </div>
    </div>
    <script>
      $("#moneyBtn").click(() => {
        $.ajax({
          type: "post",
          url: "/insertMoney",
          data: {
            buyingList: $("#buyingList").val(),
            useMoney: $("#useMoney").val(),
          },
          success: function () {},
          error: function() {
        	  alert("다시입력");
          }
        });
      });
    </script>
    <script><%--
      $(".btn").click((e) => {
        let content = $(".btn1");

        if (content.css("display") === "none") {
          content.slideDown(150);
        } else {
          content.slideUp(150);
        }
      });
	--%>
      $(window).resize(() => {
        let content = $(".btn1");
        if ($(window).width() < 1200) {
          content.slideUp(150);
        }
      });

      /*
      $("#button3").click(function () {
        $("#modal1").css("display", "block");
      });
		*/
      /*
		  $(".btn").click(function () {
		        $("#modal1").css("display", "block");
		      });
*/
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

      $("#imgPlus").click(function () {
        $("#modal2").css("display", "block");
      });

      $("#payPlus").click(function () {
        $("#modal3").css("display", "block");
      });
      // $("#schedule").click(function () {
      // $(".section").show().css("display", "block");
      // });
    </script>

    <script type="text/javascript">
      const dateList = ${selectSRange};
    </script>

    <script>
         	$(document).ready(function () {
         	  const dateElements = document.querySelectorAll('.date');
         	  const dateList = Array.from(dateElements).map(el => el.getAttribute('data-date'));
      	    <%-- const dateList = ${selectSRange}; --%>
      	    let currentIndex = 0;

      	    function updateDate(index) {
      	        if (index >= 0 && index < dateList.length) {
      	            $("#h1date").text(dateList[index]);
      	    		sessionStorage.setItem("date", $("#h1date").text());
      	        }
      	    }
						
      		$('#nextBtn1').click(() => {
      	        if (currentIndex < dateList.length - 1) {
      	            currentIndex++;
      	            updateDate(currentIndex);
      	        }
      	    });

      	    $('#nextBtn2').click(() => {
      	        if (currentIndex > 0) {
      	            currentIndex--;
      	            updateDate(currentIndex);
      	        }
      	    });



      	    if(dateList.length > 0) {
      	    	updateDate(currentIndex);
      	    }
         	});
    </script>

    <script>
      $(document).ready(function () {
        let groupName = localStorage.getItem("groupName");
        $.ajax({
          type: "post",
          url: "/mola",
          contentType: "application/json; charset=utf-8",
          data: JSON.stringify({ groupName: groupName }),
          dataType: "json",
          success: function (response) {
            let miniTitle = response.groupName.substring(0, 2);
            $(".group").text(miniTitle);
          },
          error: function (xhr, status, error) {
            console.error("Error:", error);
          },
        });
      });
    </script>
    
    <script>
    </script>
  </body>
</html>

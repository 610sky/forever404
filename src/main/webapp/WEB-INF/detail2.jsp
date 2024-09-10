<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/detail2.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/ef885bd654.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<script>
		<c:if test="${empty user}">
		alert("로그인 세션 만료!");
		window: location.href = "/";
		</c:if>
	</script>
<c:set var="using" value="0" />
	<div class="carousel-container">
		<c:forEach items="${totalList}" var="total">
			<div class="carousel-item">
				<header>
					<button type="button" class="group"
						onclick="location.href='/${groupName}';">그룹</button>
					<h1 class="h1date" id='${total.curDate}'>${total.curDate}</h1>
				</header>

				<main>
				
					<c:forEach items="${total.list}" var="item" varStatus="status">
						<div class="main-content">
							<div id="time1" class="time">
								<c:choose>
									<c:when test="${item.schedule.curTime < 10}">
									0${item.schedule.curTime}:00
								</c:when>
									<c:otherwise>
									${item.schedule.curTime}:00
								</c:otherwise>
								</c:choose>
							</div>
							<div class="detail-content">
								<!-- 여기까지가 머니 섹션 -->
								<div id="pay">
									<p id="entireMoney">예산 : ${item.schedule.bigSchedule.entireMoney}원</p>

									<c:forEach items="${item.moneyList}" var="money">
										<c:set var="using" value="${using + money.useMoney}" />
										<input type="hidden" value="${money.mCode}">
										<hr>
											<button class="deleteM">
  											<svg viewBox="0 0 15 17.5" height="17.5" width="15" xmlns="http://www.w3.org/2000/svg" class="icon">
  												<path transform="translate(-2.5 -1.25)" d="M15,18.75H5A1.251,1.251,0,0,1,3.75,17.5V5H2.5V3.75h15V5H16.25V17.5A1.251,1.251,0,0,1,15,18.75ZM5,5V17.5H15V5Zm7.5,10H11.25V7.5H12.5V15ZM8.75,15H7.5V7.5H8.75V15ZM12.5,2.5h-5V1.25h5V2.5Z" id="Fill"></path>
											</svg>
										</button>
										<p>지불금액 : ${money.useMoney}</p>
										<p>지불품목 : ${money.buyingList}</p>

									</c:forEach>
									
									<hr>
									<c:set var="remainingAmount"
										value="${item.schedule.bigSchedule.entireMoney - using}" />
									<p>남은 예산 : ${remainingAmount}원</p>
									
									

								</div>
								<section>
									<c:choose>
										<c:when test="${item.schedule.serviceImg == null}">
											<div class="img">image</div>
										</c:when>
										<c:otherwise>
											<img src="${item.schedule.serviceImg}" class="img">
										</c:otherwise>
									</c:choose>
									<div class="item-content">
										<input type="hidden" value="${item.schedule.ssCode}">
										<h2>장소 : ${item.schedule.serviceName}
										<c:if test="${item.schedule.isReservation eq 'Y'}">
										<div class="tooltip">
 											<div class="icon">i</div>
  											<div class="tooltiptext">
  											예약 완료.
  											</div>
  											</div>
  											</c:if>
										</h2>
										<p>위치 : ${item.schedule.serviceJibun}</p>
										<p>연락처 : ${item.schedule.servicePhone}</p>
										<p>메모 : ${item.schedule.memo}</p>
									</div>
									<div class="button-content">
									<input type="hidden" value="${item.schedule.ssCode}">
									<button class="payPlus"><i class="fa-solid fa-won-sign"></i></button>
										<input type="submit" class="deleteSc" value="X">
									</div>
								</section>
							</div>
						</div>
					</c:forEach>
							<section class="paging"></section>
				</main>
			</div>
		</c:forEach>
	</div>

	<!-- 고정 되어 있어야 함 -->
	<section id="btncontainer">
		<button id="button3" class="btn1">일정 추가</button>
		<button id="button4" class="btn1">사진 추가</button>
		<button id="plus" class="btn">
			<i class="bi bi-plus-square"></i>
		</button>
	</section>

	<button id="prevBtn" class="movingBtn">&#10094;</button>
	<button id="nextBtn" class="movingBtn">&#10095;</button>

	<div id="modal2" class="modal">
		<div  id="modalcontent3" class="bigmodalcontent">
	<p class="close">&times</p>
			<h2>사진 추가</h2>

			<hr />
			<div class="modalcontent">

				<form id="fileForm" method="post" enctype="multipart/form-data">
					<div class=fileContainer>
						<div id="image_container">
						<label for="file" class="upload">
						<div>+</div>
							<input id="file" type="file" name="files" multiple accept="image/*" onchange="imgShow(event)" value="+" placeholder="+" />
						</label> 
						</div>
					</div>
				</form>
			</div>
			<section class="addSection">
				<button class="add2" id="fileSubmit">업로드</button>
			</section>
		</div>
	</div>

	<div id="modal3" class="modal">
		<div class="modalcontent" id="modalcontent2">
			<span class="close">&times</span>
			<h2>비용 지불</h2>
			<hr />
						<label><i class="fa-solid fa-coins"></i><input type="text" class="money" id="useMoney" placeholder="사용 금액(원)"/></label>
						<label><i class="fa-solid fa-pencil" id="labelI2"></i>
			<input type="text" class="money" id="buyingList" placeholder="지불 품목"></input></label>

			<div class="add">
				<button class="add2" id="moneyBtn">추가</button>
			</div>
		</div>
	</div>

	<script>
	
      const kakaobtn = document.querySelector("#button3");
      kakaobtn.addEventListener("click", () => {
    	  $.ajax({
    		  
    	  });
        window.location.href = "/kakao/map";
      });
   
	// 사진이 오른쪽부터 나오게하는 기능
	    $('#file').on('change', function(event) {
	        const imageContainer = $('#image_container');
		    const files = event.target.files;

	        for (let i = 0; i < files.length; i++) {
	            const file = files[i];
	            const reader = new FileReader();

	            reader.onload = (function(theFile) {
	                return function(e) {
	                    const img = $('<img>').attr('src', e.target.result);
	                    imageContainer.append(img);
	                };
	        	});
	            reader.readAsDataURL(file);
	        }
	    });
	
          let bsCode = localStorage.getItem("bsCode");

          function imgShow(event) {
            const container = document.getElementById("image_container");
            //container.innerHTML = ""; // Clear existing images
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
            	  $('#modal2').css("display", "none");
            	  $("#image_container img").remove(); // img 태그만 삭제하려면 
              },
            });
          });
       
      $(".btn").click((e) => {
        let content = $(".btn1");

        if (content.css("display") === "none") {
          content.slideDown(150);
        } else {
          content.slideUp(150);
        }
      });
      
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
        $("#image_container img").remove();
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

      $("#button4").click(function () {
        $("#modal2").css("display", "block");
      });

      let ssCode;
      
      $(".payPlus").click(function () {
        $("#modal3").css("display", "block");
        ssCode = $(this).siblings('input[type="hidden"]').val();
      });
      
      $("#moneyBtn").click(() => {
        $.ajax({
          type: "post",
          url: "/insertMoney",
          data: {
            buyingList: $("#buyingList").val(),
            useMoney: $("#useMoney").val(),
            ssCode: ssCode,
          },
          success: function () {
        	  alert($("#useMoney").val()+ "원 사용하셨습니다!");
        	  location.reload();
          },
          error: function() {
        	  alert("다시 입력해주세요");
          }
        });
      });
      
      //금액 삭제
      $(".deleteM").click(function () {
    	  var mCode = $(this).siblings('input[type="hidden"]').val();
    	  $.ajax({
    		  type: "get",
    		  url: "/deleteM",
    		  data: {
    			  mCode: mCode,
    		  },
    		  success: function(){
    			  location.reload();
    		  }
    	  });
      });
     
      //스케줄 삭제
      $(".deleteSc").click(function () {
    	  ssCode = $(this).siblings('input[type="hidden"]').val();
    	  if(confirm( "삭제하시면 복구할 수 없습니다 \n정말로 삭제하시겠습니까??")) {
    	  $.ajax({
    		  type: "get",
    		  url:"/deleteSc",
    		  data: {
    			  ssCode: ssCode,
    		  },
    		  success: function(){
    			  alert("삭제되었습니다.");
    			  location.reload();
    		  }
    	  });
    	  }else {
    		  return false;
    	  }
      });
      
      
      // $("#schedule").click(function () {
      // $(".section").show().css("display", "block");
      // });
   
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
      
      function dateLoad(date){
    	  var cur_date = date;
    	  
    	  $.ajax({
              type: "post",
              url: "/mola",
              contentType: "application/json; charset=utf-8",
              data: JSON.stringify({ cur_date: cur_date }),
              dataType: "json",
              success: function (response) {
                let miniTitle = response.groupName.substring(0, 2);
                $(".group").text(miniTitle);
                
              },
              error: function (xhr, status, error) {
                console.error("Error:", error);
              },
            });
      }
    </script>

	<script src="${pageContext.request.contextPath}/js/detail2.js">
    
    </script>
    
          <script
        src="https://kit.fontawesome.com/ef885bd654.js"
        crossorigin="anonymous"
      ></script>
</body>
</html>
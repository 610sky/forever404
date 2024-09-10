let linkbs;

document.addEventListener("DOMContentLoaded", function () {
  const Calendar = FullCalendar.Calendar;
  const calendarEl = document.getElementById("calendar");
  const calendar = new Calendar(calendarEl, {
    headerToolbar: {
      left: "prev,today,next",
      center: "title",
      right: "",
    },
    selectable: true,
    editable: true,
    events: bigSchedules,
    eventTextColor: "black",
    customButtons: {
      groupUsers: {
        text: "그룹인원",
        click: function () {
          $("#teamModal").css("display", "none");
        },
      },
      groupcurrent: {
        text: "그룹 삭제",
        click: function () {
          let groupName = localStorage.getItem("groupName");
          if (
            confirm(
              "삭제하시면 복구할 수 없습니다 \n 정말로 삭제하시겠습니까??"
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
          /*$.ajax({
            url: "/deleteGroup",
            type: "post",
            data: "groupName=" + groupName,
            success: function () {
              window.location.href = "/main";
            },
          });*/
        },
      },
    },
    events: bigSchedules.map((event) => {
      let endDate = new Date(event.end);
      endDate.setDate(endDate.getDate() + 1);
      return {
        ...event,
        end: endDate.toISOString().split("T")[0],
      };
    }) /*
	 eventContent: {
		html: `<div><i class="fa-solid fa-pencil"></i></div>` -> 나중에 생일할때 이용하면 좋을것같음
	 },*/,
    eventClick: function (info) {
    },
    eventClick: function showModal() {
      $("#bigModal").css("display", "block");
    },
    eventClick: function (info) {
      const modal = $("#bigModal");
      const btn = $("#six");
      const btn2 = $("#seven");
      const btn3 = $("#eight");
      $("#addMemoh1").text(info.event.title);
      $("#addMemop").text(`${info.event.start.toLocaleDateString()}`);
      linkbs = info.event.extendedProps.bsCode;

      sessionStorage.setItem("bsCode", linkbs);

      const endDate = new Date(info.event.end);
      endDate.setDate(endDate.getDate() - 1);
      $("#addMemop2").text(`${endDate.toLocaleDateString()}`);
      $("#addMemop3").text(info.event.extendedProps.money);
      modal.css("display", "block");
      if ("#addMemoh1" != null) {
        btn2.css("display", "block");
        btn3.css("display", "block");
        btn.css("display", "none");
        $("#addMemoh1").show();
		$("#addTitle").hide();
        $("#memoSection1").show();
        $("#memoSection2").show();
        $("#memoSection3").show();
		$("#memoSection4").hide();
      }
    },

    dateClick: function (info) {
      const events = calendar.getEvents(); // 모든 이벤트 가져오기
      const clickedDate = info.dateStr;

      // 클릭한 날짜에 이벤트가 있는지 확인
      const hasEvent = events.some((event) => {
        const eventStart = event.start.toISOString().split("T")[0];
        const eventEnd = new Date(event.end);
        eventEnd.setDate(eventEnd.getDate()); // 하루 빼기
        const eventEndDate = eventEnd.toISOString().split("T")[0];

        return clickedDate >= eventStart + 1 && clickedDate <= eventEndDate;
      });

      // 클릭한 날짜에 해당하는 이벤트 찾기
      const eventOnClickedDate = events.find((event) => {
        const eventStart = event.start.toISOString().split("T")[0];
        const eventEnd = new Date(event.end);
        eventEnd.setDate(eventEnd.getDate()); // 하루 빼기
        const eventEndDate = eventEnd.toISOString().split("T")[0];

        // 클릭한 날짜가 이벤트 기간 내에 있는지 확인
        return clickedDate >= eventStart + 1 && clickedDate <= eventEndDate;
      });

      if (eventOnClickedDate) {
        // 해당 날짜에 이벤트가 있으면 eventClick과 동일한 로직 실행
        const modal = $("#bigModal");
        const btn = $("#six");
        const btn2 = $("#seven");
        const btn3 = $("#eight");

        $("#addMemoh1").text(eventOnClickedDate.title);
        $("#addMemop").text(`${eventOnClickedDate.start.toLocaleDateString()}`);

        linkbs = eventOnClickedDate.extendedProps.bsCode;
        sessionStorage.setItem("bsCode", linkbs);

        const endDate = new Date(eventOnClickedDate.end);
        endDate.setDate(endDate.getDate() - 1);
        $("#addMemop2").text(`${endDate.toLocaleDateString()}`);
        $("#addMemop3").text(eventOnClickedDate.extendedProps.money);

        modal.css("display", "block");

        if ($("#addMemoh1").length) {
          btn2.css("display", "block");
          btn3.css("display", "block");
          btn.css("display", "none");
		  $("#addTitle").hide();
          $("#addMemoh1").show();
          $("#memoSection1").show();
          $("#memoSection2").show();
          $("#memoSection3").show();
		  $("#memoSection4").hide();
        }

        // 클릭한 날짜에 이벤트가 있으므로 추가 로직은 실행하지 않음
        return;
      }
      // 이벤트가 없으면 아래 로직 실행
      const month = calendarEl
        .querySelector(".fc-toolbar-title")
        .innerText.split(" ")[0];
      const selectedMonth = info.date.getMonth(); // 0부터 시작하는 월 인덱스
      sessionStorage.setItem("date", clickedDate);
      let groupName = localStorage.getItem("groupName");
      let date = sessionStorage.getItem("date");

      $.ajax({
        type: "post",
        url: "/mola",
        data: {
          groupName: groupName,
          localDate: date,
        },
        success: function (response) {
        },
      });

      // 예: 7월 (8월의 경우 7로 설정)
      if (
        (selectedMonth === 0 && month === "January") ||
        (selectedMonth === 1 && month === "February") ||
        (selectedMonth === 2 && month === "March") ||
        (selectedMonth === 3 && month === "April") ||
        (selectedMonth === 4 && month === "May") ||
        (selectedMonth === 5 && month === "June") ||
        (selectedMonth === 6 && month === "July") ||
        (selectedMonth === 7 && month === "August") ||
        (selectedMonth === 8 && month === "September") ||
        (selectedMonth === 9 && month === "October") ||
        (selectedMonth === 10 && month === "November") ||
        (selectedMonth === 11 && month === "December")
      ) {
        showModal(clickedDate);
      }
    },
  });

  calendar.render();
  function showModal() {
    $("#bigModal").css("display", "block");
	$("#addTitle").show();
    $("#addMemoh1").hide();
    $("#memoSection1").hide();
    $("#memoSection2").hide();
    $("#memoSection3").hide();
	$("#memoSection4").show();
    $("#six").css("display", "block");
    $("#seven").css("display", "none");
	$("#eight").css("display", "none");
  }
  /*
  document.getElementById("X").addEventListener("click", function () {
    document.getElementById("bigModal").style.display = "none";
  });*/
  $("#X").click(function () {
    $("#bigModal").css("display", "none");
  });
});
$("#six").click(function () {
  $("#detModal").css("display", "block");
  $("#bigModal").css("display", "none");
});
$("#X2").click(function () {
  $("#detModal").css("display", "none");
  $("#bigModal").css("display", "block");
});
$("#final").click(function () {
  $("#detModal").css("display", "none");
  $("#bigModal").css("display", "block");
});
$("#groupmake").click(function () {
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
$("#addgroup3").mouseover((e) => {
  setTimeout(() => {
    let content = $(".modalgroup");
    if (content.css("display") === "none") {
      content.fadeIn(450);
    }
  }, 400);
});
$("#calendar-container").mouseover((e) => {
  let content = $(".modalgroup");
  if (content.css("display") != "none") {
    content.fadeOut(200);
  }
});
$("#grouppart").click(function () {
  $("#modal2").css("display", "block");
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
$(".user").click(function () {
  $(".mymodal").css("display", "block");
});
$("#teamBtn").click(function () {
  $("#teamModal").css("display", "block");
});
$("#cancelBtn").click(function () {
  $("#teamModal").css("display", "none");
});
$("#calendar-container").mouseover((e) => {
  let content = $(".mymodal");
  if (content.css("display") != "none") {
    content.fadeOut(200);
  }
});
const detailButton = document.querySelector("#addMemoh1");
detailButton.addEventListener("click", () => {
  const code = linkbs;
  localStorage.setItem("bsCode", code);
  const url = new URL(location.href + "/detail");
  const urlParams = url.searchParams;
  urlParams.append("bsCode", code);
  location.href = url;
});

$(".user").mouseout((e) => {
  let content = $(".mymodal");
  if (content.css("display") != "none") {
    setTimeout(function () {
      content.fadeOut(200);
    }, 3000);
  }
});
$("#addgroup3").mouseout((e) => {
  let content = $(".modalgroup");
  if (content.css("display") != "none") {
    setTimeout(function () {
      content.fadeOut(200);
    }, 3000);
  }
});
$("#seven").click(function () {
  let bsCode = sessionStorage.getItem("bsCode");
  // 이미지 리스트로 뿌림 result에서 추출 잘하세요
  $.ajax({
    type: "post",
    url: "/selectMyImg",
    data: { bsCode: bsCode },
    success: function (result) {
      $("#albumModal").css("display", "block");
      $("#bigModal").css("display", "none");

      const imgContainer1 = $("#slider");
      const photo = result.map(function (picture) {
        const photo2 = picture.photoUrl;
        const photoCode = picture.photoCode;
        const photoExist =
          imgContainer1.find(`img[src="${photo2}"]`).length > 0;

        if (!photoExist) {
          const imgTag = $("<img>")
            .attr("src", photo2)
            .addClass("smallImg")
            .attr("alt", photoCode);
          imgContainer1.append(imgTag);
        }
      });
      $(".smallImg").click(function () {
        const src = $(this).attr("src"); // 클릭한 이미지의 src 속성 값
        const pCode = $(this).attr("alt");
        // .bigImg가 이미 존재하는지 확인
        let bigImg = $("#bigImg");

        if (bigImg.length === 0) {
          // .bigImg가 존재하지 않으면 새로 생성하여 body에 추가
          bigImg = $("<img>")
            .attr("id", "bigImg")
            .addClass("bigImg")
            .attr("src", src)
            .attr("alt", pCode);
          $("#mainImg").append(bigImg);
        } else {
          // .bigImg가 이미 존재하면 src 속성만 변경
          bigImg.attr("src", src).attr("alt", pCode);
        }
      });
      setupSlider();
    },
  });
});

$("#eight").click(() => {
	
  let bsCode = sessionStorage.getItem("bsCode");
  if(confirm( "삭제하시면 복구할 수 없습니다 \n정말로 삭제하시겠습니까??")) {
  $.ajax({
    type: "get",
    url: "/deleteBs",
    data: {
      bsCode: bsCode,
    },
    success: function () {
      location.reload();
    },
  });
  }else {
	return false;
  }
});

$("#delete").click(() => {
  const bigImg = document.querySelector("#bigImg");
  var imgSrc = bigImg.getAttribute("src");
  var imgCode = bigImg.getAttribute("alt");
  if (confirm("삭제하시면 복구할 수 없습니다 \n정말로 삭제하시겠습니까??")) {
  $.ajax({
    type: "post",
    url: "/deletePhoto",
    data: {
      photoUrl: imgSrc,
      photoCode: imgCode,
    },
    success: function () {
      alert("성공적으로 삭제되었습니다");
      $('img[alt="' + imgCode + '"]').remove();
    },
    error: function () {
      alert("삭제되지 않았습니다");
      location.reload();
    },
  });
  }else {
	return false;
  }
});

function setupSlider() {
  const leftButton = document.querySelector("#slideBtn1");
  const rightButton = document.querySelector("#slideBtn2");
  const slideInside = document.querySelector("#slider");
  const photos = slideInside.querySelectorAll("img");
  let currentIndex = 0;

  function showPhoto(index) {
    const totalPhotos = photos.length;
    const photoWidth = photos[0].clientWidth; // 사진 한 장의 너비
    const visibleWidth = slideInside.clientWidth; // 슬라이더의 가시 영역 너비
    const photosPerSlide = Math.floor(visibleWidth / photoWidth);
    if (index < 0) {
      currentIndex = 0;
    } else if (index >= totalPhotos) {
      currentIndex = totalPhotos;
    } else {
      currentIndex = index;
    }
    slideInside.style.transform = `translateX(-${
      (currentIndex * 100) / photosPerSlide
    }%)`;
  }

  leftButton.addEventListener("click", function () {
    showPhoto(currentIndex - 5);
  });

  rightButton.addEventListener("click", function () {
    showPhoto(currentIndex + 5);
  });
}
$("#close").click(function () {
  $("#albumModal").css("display", "none");
  $("#bigModal").css("display", "block");
  $("#picScroll").find("img").remove();
  $("#mainImg").find("#bigImg").remove();
  const slideInside = document.querySelector("#slider");
  slideInside.style.transform = "translateX(0)";
});
const Calendar = FullCalendar.Calendar;
const Users = $("#users");




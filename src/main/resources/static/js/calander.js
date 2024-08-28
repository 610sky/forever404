let linkbs;

document.addEventListener("DOMContentLoaded", function () {
  const Calendar = FullCalendar.Calendar;
  const calendarEl = document.getElementById("calendar");
  const calendar = new Calendar(calendarEl, {
    headerToolbar: {
      left: "prev,next today",
      center: "title",
      right: "dayGridMonth,timeGridWeek,timeGridDay",
    },
    selectable: true,
    editable: true,
    events: bigSchedules,
    eventTextColor: "black",
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
      console.log(info.event.extendedProps.money);
    },
    eventClick: function showModal() {
      $("#bigModal").css("display", "block");
    },
    eventClick: function (info) {
      const modal = $("#bigModal");
      const btn = $("#six");
      const btn2 = $("#seven");
      $("#addMemoh1").text(info.event.title);
      $("#addMemop").text(`${info.event.start.toLocaleDateString()}`);
	  linkbs = info.event.extendedProps.bsCode;
      const endDate = new Date(info.event.end);
      endDate.setDate(endDate.getDate() - 1);
      $("#addMemop2").text(`${endDate.toLocaleDateString()}`);
      $("#addMemop3").text(info.event.extendedProps.money);
      modal.css("display", "block");
      if ("#addMemoh1" != null) {
        btn2.css("display", "block");
        btn.css("display", "none");
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

      if (hasEvent) {
        // 해당 날짜에 이벤트가 있으면 클릭 무시
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
          console.log(response);
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
    $("#addMemoh1").text("");
    $("#addMemop").text("");
    $("#addMemop2").text("");
    $("#addMemop3").text("");
    $("#six").css("display", "block");
    $("#seven").css("display", "none");
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

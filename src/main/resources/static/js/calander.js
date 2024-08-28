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
      $("#bigModal").slideDown();
      if (modal.css("display") === "none") {
        modal.slideUp(400);
      }
      let groupName = localStorage.getItem("groupName");
      let date = sessionStorage.getItem("date");
    },
    eventClick: function (info) {
      const modal = $("#bigModal");
      $("#addMemoh1").text(info.event.title);
      $("#addMemop").text(`${info.event.start.toLocaleString()}`);
      linkbs = info.event.extendedProps.bsCode;
      const endDate = new Date(info.event.end);
      endDate.setDate(endDate.getDate() - 1);
      $("#addMemop2").text(`${endDate.toLocaleString()}`);
      $("#addMemop3").text(info.event.extendedProps.money);
      modal.slideDown();
      if (modal.css("display") === "none") {
        modal.slideUp(400);
      }
    },
    dateClick: function (info) {
      const month = calendarEl
        .querySelector(".fc-toolbar-title")
        .innerText.split(" ")[0];
      const clickedDate = info.dateStr;
      const selectedMonth = info.date.getMonth(); // 0부터 시작하는 월 인덱스
      sessionStorage.setItem("date", clickedDate);
      let groupName = localStorage.getItem("groupName");
      let date = sessionStorage.getItem("date");

      // 예: 7월 (8월의 경우 7로 설정)
      if (selectedMonth === 0 && month === "January") {
        showModal(clickedDate);
      } else if (selectedMonth === 1 && month === "February") {
        showModal(clickedDate);
      } else if (selectedMonth === 2 && month === "March") {
        showModal(clickedDate);
      } else if (selectedMonth === 3 && month === "April") {
        showModal(clickedDate);
      } else if (selectedMonth === 4 && month === "May") {
        showModal(clickedDate);
      } else if (selectedMonth === 5 && month === "June") {
        showModal(clickedDate);
      } else if (selectedMonth === 6 && month === "July") {
        showModal(clickedDate);
      } else if (selectedMonth === 7 && month === "August") {
        showModal(clickedDate);
      } else if (selectedMonth === 8 && month === "September") {
        showModal(clickedDate);
      } else if (selectedMonth === 9 && month === "October") {
        showModal(clickedDate);
      } else if (selectedMonth === 10 && month === "November") {
        showModal(clickedDate);
      } else if (selectedMonth === 11 && month === "December") {
        showModal(clickedDate);
      }
    },
  });
  calendar.render();
  function showModal() {
    $("#bigModal").slideDown();
    if (modal.css("display") === "none") {
      modal.slideUp(400);
    }
  }
  /*
  document.getElementById("X").addEventListener("click", function () {
    document.getElementById("bigModal").style.display = "none";
  });*/
  $("#X").click(function () {
    $("#bigModal").slideUp(400);
  });
});
$("#six").click(function () {
  $("#detModal").slideDown(400);
  $("#detModal").css("display", "block");
  $("#bigModal").css("display", "none");
});
$("#X2").click(function () {
  $("#detModal").slideUp(400);
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

const detailButton = document.querySelector(".modsection");
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

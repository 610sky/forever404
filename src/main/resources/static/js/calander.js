document.addEventListener("DOMContentLoaded", function () {
  var Calendar = FullCalendar.Calendar;
  var Draggable = FullCalendar.Draggable;

  var containerEl = document.getElementById("external-events");
  var calendarEl = document.getElementById("calendar");
  var checkbox = document.getElementById("drop-remove");

  var calendar = new Calendar(calendarEl, {
    headerToolbar: {
      left: "prev,next today",
      center: "title",
      right: "dayGridMonth,timeGridWeek,timeGridDay",
    },
    selectable: true,
    editable: true,
    droppable: true, // this allows things to be dropped onto the calendar
    drop: function (info) {
      // is the "remove after drop" checkbox checked?
      if (checkbox.checked) {
        // if so, remove the element from the "Draggable Events" list
        info.draggedEl.parentNode.removeChild(info.draggedEl);
      }
    },
  });

  calendar.render();
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

$("#addgroup").mouseover((e) => {
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
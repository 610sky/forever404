const modal = document.getElementById("myModal");
const ShowModal = document.getElementById("six");
const Modal2 = document.getElementById("modal2");
const exit = document.getElementById("X2");

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
    dateClick: function (info) {
      const month = calendarEl
        .querySelector(".fc-toolbar-title")
        .innerText.split(" ")[0];
      const clickedDate = info.dateStr;
      const selectedMonth = info.date.getMonth(); // 0부터 시작하는 월 인덱스
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
    const modal = document.getElementById("myModal");
    modal.style.display = "block";
  }

  document.getElementById("X").addEventListener("click", function () {
    document.getElementById("myModal").style.display = "none";
  });
});

ShowModal.addEventListener("click", () => {
  Modal2.style.display = "block";
  modal.style.display = "none";
});

exit.addEventListener("click", () => {
  Modal2.style.display = "none";
  modal.style.display = "block";
});
// function ShowModal() {
//   const Modal = document.getElementById("myModal2");
//   Modal.style.display = "block";
// }

// document.getElementById("X2").addEventListener("click", function () {
//   document.getElementById("MyModal").style.display = "none";
// });

document.addEventListener("DOMContentLoaded", function () {
  const prevButton = document.querySelector("#prevBtn");
  const nextButton = document.querySelector("#nextBtn");
  const items = document.querySelectorAll(".carousel-item");
  console.log(items.length); // 0-4
  for (let i = 2; i <= items.length; i++) {
    $(`.carousel-item:nth-child(${i})`).css({ display: "none" });
  }
  let currentIndex = 1;

  const curDateNodes = document.querySelectorAll(".h1date");
  let curDate;

  curDateNodes.forEach((curDate) => {
    if (curDate.isEqualNode(curDateNodes[currentIndex - 1])) {
      curDate = curDate.getAttribute("id");
      sessionStorage.setItem("curDate", curDate);
      console.log(curDate);
    }
  });

  prevButton.addEventListener("click", function () {
    if (currentIndex > 1) {
      $(`.carousel-item:nth-child(${currentIndex - 1})`).css({
        display: "block",
      });
      $(`.carousel-item:nth-child(${currentIndex})`).css({ display: "none" });
      currentIndex--;
      curDateNodes.forEach((curDate) => {
        if (curDate.isEqualNode(curDateNodes[currentIndex - 1])) {
          curDate = curDate.getAttribute("id");
          sessionStorage.setItem("curDate", curDate);
          console.log(curDate);
        }
      });
    }
  });

  nextButton.addEventListener("click", function () {
    if (currentIndex < items.length) {
      $(`.carousel-item:nth-child(${currentIndex})`).css({ display: "none" });
      $(`.carousel-item:nth-child(${currentIndex + 1})`).css({
        display: "block",
      });
      currentIndex++;
      curDateNodes.forEach((curDate) => {
        if (curDate.isEqualNode(curDateNodes[currentIndex - 1])) {
          curDate = curDate.getAttribute("id");
          sessionStorage.setItem("curDate", curDate);
          console.log(curDate);
        }
      });
    }
  });
});

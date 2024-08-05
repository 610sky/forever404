const options = {
  root: null,
  rootMargin: "0px 0px 30px 0px",
  threshold: 0,
};

// IntersectionObserver 를 등록한다.
const io = new IntersectionObserver((entries, observer) => {
  entries.forEach((entry) => {
    // 관찰 대상이 viewport 안에 들어온 경우 image 로드
    if (entry.isIntersecting) {
      console.log(entry);
      entry.target.src = entry.target.dataset.src;
      observer.unobserve(entry.target);
    }
  });
}, options);

// 관찰할 대상을 선언하고, 해당 속성을 관찰시킨다.
const images = document.querySelectorAll(".image");
images.forEach((el) => {
  io.observe(el);
});

document.addEventListener('DOMContentLoaded', function() {
  const modal = document.getElementById('modal');
  const modalImage = document.getElementById('modal-image');
  const closeBtn = document.querySelector('.close');

  // 모든 이미지에 클릭 이벤트 리스너 추가
  document.querySelectorAll('.image').forEach(img => {
    img.addEventListener('click', function() {
      modal.style.display = 'block';
      modalImage.src = this.getAttribute('data-src');
    });
  });

  // 모달 닫기 버튼 클릭 시 모달 닫기
  closeBtn.addEventListener('click', function() {
    modal.style.display = 'none';
  });

  // 모달 외부 클릭 시 모달 닫기
  window.addEventListener('click', function(event) {
    if (event.target === modal) {
      modal.style.display = 'none';
    }
  });
});
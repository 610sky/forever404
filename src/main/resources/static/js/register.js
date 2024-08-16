const userId = document.querySelector("#id");
const userIdSpan = document.querySelector("#userIdSpan");

userId.addEventListener("input", function () {
  const regExp = /^(?=.*[a-z])(?=.*\d).{0,20}$/;
  const idcheck = regExp.test(userId.value);
  if (idcheck) {
    userIdSpan.style.color = "white";
  } else {
    userIdSpan.style.color = "red";
  }
});

const userPassword = document.querySelector("#password");
const userPasswordSpan = document.querySelector("#userPasswordSpan");

userPassword.addEventListener("input", function () {
  const regExp = /^(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$/;
  const pwdcheck = regExp.test(userPassword.value);
  if (pwdcheck) {
    userPasswordSpan.style.color = "white";
  } else {
    userPasswordSpan.style.color = "red";
  }
});

const userName = document.querySelector("#name");
const userNameSpan = document.querySelector("#userNameSpan");

userName.addEventListener("input", function () {
  const regExp = /^(?=.*[가-힣]).{2,10}$/;
  const namecheck = regExp.test(userName.value);
  if (namecheck) {
    userNameSpan.style.color = "white";
  } else {
    userNameSpan.style.color = "red";
  }
});

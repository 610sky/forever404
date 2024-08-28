let idSubmit = false;
let pwdSubmit = false;
let nameSubmit = false;

// * 아이디는 무조건 영소문자, 숫자 포함 20자 이하여야합니다.
// * 비밀번호는 영소문자, 숫자, 특수문자 포함 8자리 이상이여야합니다.
// * 이름은 필수입니다! (2글자 이상)

const userId = document.querySelector("#id");
const userIdSpan = document.querySelector("#userIdSpan");

userId.addEventListener("input", function () {
  const regExp = /^(?=.*[a-z])(?=.*\d).{0,20}$/;
  const idcheck = regExp.test(userId.value);
  if (idcheck) {
    userIdSpan.innerHTML = "";
    idSubmit = true;
  } else if (idcheck === "") {
    userIdSpan.innerHTML = "";
    idSubmit = false;
  } else {
    userIdSpan.style.color = "red";
    userIdSpan.innerHTML =
      "* 아이디는 무조건 영소문자, 숫자 포함 20자 이하여야합니다.";
    idSubmit = false;
  }
});

const userPassword = document.querySelector("#password");
const userPasswordSpan = document.querySelector("#userPasswordSpan");

userPassword.addEventListener("input", function () {
  const regExp = /^(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$/;
  const pwdcheck = regExp.test(userPassword.value);
  if (pwdcheck) {
    userPasswordSpan.innerHTML = "";
    pwdSubmit = true;
  } else if (pwdcheck === "") {
    userPasswordSpan.style.color = "red";
    userPasswordSpan.innerHTML =
      "* 비밀번호는 영소문자, 숫자, 특수문자 포함 8자리 이상이여야합니다.";
    pwdSubmit = false;
  } else {
    userPasswordSpan.style.color = "red";
    userPasswordSpan.innerHTML =
      "* 비밀번호는 영소문자, 숫자, 특수문자 포함 8자리 이상이여야합니다.";
    pwdSubmit = false;
  }
});

const userName = document.querySelector("#name");
const userNameSpan = document.querySelector("#userNameSpan");

userName.addEventListener("input", function () {
  const regExp = /^(?=.*[가-힣]).{2,10}$/;
  const namecheck = regExp.test(userName.value);
  if (namecheck) {
    userNameSpan.innerHTML = "";
    nameSubmit = true;
  } else if (namecheck === "") {
    userNameSpan.style.color = "red";
    userNameSpan.innerHTML = "* 이름은 필수입니다! (2글자 이상)";
    nameSubmit = false;
  } else {
    userNameSpan.style.color = "red";
    userNameSpan.innerHTML = "* 이름은 필수입니다! (2글자 이상)";
    nameSubmit = false;
  }
});
function validate() {
  if (!idSubmit) id.focus();
  else if (!pwdSubmit) password.focus();
}
$("#submit").click(() => {
  if (idSubmit && pwdSubmit && nameSubmit) {
    $.ajax({
      type: "post",
      url: "/signUp",
      data: {
        id: $("#id").val(),
        password: $("#password").val(),
        phone: $("#phone").val(),
        name: $("#name").val(),
        email: $("#email").val(),
        birth: $("#birth").val(),
      },
      success: function () {
        location.href = "/";
      },
      error: function (xhr, status, error) {
        alert("회원가입 실패!");
      },
    });
  }
});

const login = document.querySelector(".login");
const openLogin = document.querySelector(".open_login");

openLogin.addEventListener("click", () => {
  login.style.display = "flex";
});

const userId = document.querySelector("#id");
const userPassword = document.querySelector("#password");
const loginBtn = document.querySelector("#loginBtn");

loginBtn.addEventListener("click", function () {
  if (userId != null && userPassword != null) {
    loginBtn.disabled = "false";
  } else if (userId == null && userPassword == null) {
    loginBtn.disabled = "true";
  }
});

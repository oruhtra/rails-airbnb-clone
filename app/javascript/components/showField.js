function showField() {

const check = document.getElementById("user_status");
const field = document.getElementById("hiddenfield");

if (check) {
  if (check.checked == true) {
    field.classList.remove("toto");
  check.addEventListener("click", (event) => {
    field.classList.toggle("toto");
    });
  } else {
    check.addEventListener("click", (event) => {
    field.classList.toggle("toto");
  });
  }
  }
}
export { showField };

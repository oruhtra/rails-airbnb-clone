function showField() {

const check = document.getElementById("user_status");
const field = document.getElementById("hiddenfield");

if (check) {
  check.addEventListener("click", (event) => {
    field.classList.remove("toto");
  });
  }
}
export { showField };

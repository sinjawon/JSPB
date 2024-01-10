/**
 * 
 */

 
const modalBtn = document.getElementById("open-modal");
const modal = document.getElementById("modal");
const closeModalBtn = document.getElementById("close-modal");

modalBtn.addEventListener("click", () => {
   modal.style.display="block";
});

closeModalBtn.addEventListener("click", () => {
  modal.style.display = "none";
});
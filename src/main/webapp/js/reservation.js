
//지역모달창
const locationModal = document.querySelector('.location-modal');
const btnLocationOpenModal = document.querySelector('.rv-locationAndDateBox-location');


btnLocationOpenModal.addEventListener("click", () => {
    locationModal.style.display = "flex";
});

const locationCloseBtn = document.querySelector(".location-modal-close-Btn");
locationCloseBtn.addEventListener("click", e => {
    locationModal.style.display = "none";
});

locationModal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("location-modal")) {
        locationModal.style.display = "none";
    }
});

//달력모달창
const dateModal = document.querySelector('.date-modal');
const btnDateOpenModal = document.querySelector('.rv-locationAndDateBox-date');

btnDateOpenModal.addEventListener("click", () => {
    dateModal.style.display = "flex";
});

const dateCloseBtn = document.querySelector(".date-modal-close-Btn");
dateCloseBtn.addEventListener("click", e => {
    dateModal.style.display = "none";
});

dateModal.addEventListener("click", e => {
    const evTarget2 = e.target
    if(evTarget2.classList.contains("date-modal")) {
        dateModal.style.display = "none";
    }
});

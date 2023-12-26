const locationModal = document.querySelector('.location-modal');
const btnLocationOpenModal = document.querySelector('.rv-locationAndDateBox-location');

btnLocationOpenModal.addEventListener("click", () => {
    locationModal.style.display = "flex";
});
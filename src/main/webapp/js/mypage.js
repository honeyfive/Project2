// 회원등급 모달창 버튼
let ratingModalOpen = document.querySelector(".memeber_rating_box");
let ratingModal = document.querySelector(".modal_rating");
let ratingModalClose = document.querySelector(".modal_rating_close_btn");


ratingModalOpen.addEventListener("click",()=>{ // 모달 안 보이게
	ratingModal.style.display = "flex";
})

ratingModalClose.addEventListener("click",()=>{ // 모달 안 보이게
	ratingModal.style.display = "none";
})

// 이용내역 모달창 버튼
let useModalOpen = document.querySelector(".use_count_box");
let useModal = document.querySelector(".modal_use");
let useModalClose = document.querySelector(".modal_use_close_btn");

useModalOpen.addEventListener("click",()=>{ // 모달 안 보이게
	useModal.style.display = "flex";
})

useModalClose.addEventListener("click",()=>{ // 모달 안 보이게
	useModal.style.display = "none";
})

//지역모달창
const locationModal = document.querySelector('.location-modal');
const btnLocationOpenModal = document.querySelector('.rv-locationAndDateBox-location');
const rentModal = document.querySelector('.rent-place');
const returnModal = document.querySelector('.return-place');

rentModal.addEventListener("click", () => {
	locationModal.style.display = "flex";
});

const locationCloseBtn = document.querySelector(".location-modal-close-Btn");
locationCloseBtn.addEventListener("click", e => {
	locationModal.style.display = "none";
});

locationModal.addEventListener("click", e => {
	const evTarget = e.target
	if (evTarget.classList.contains("location-modal")) {
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
	if (evTarget2.classList.contains("date-modal")) {
		dateModal.style.display = "none";
	}
});

/*//자동차 모델 선택바
const body = document.querySelector('body');
const select = document.querySelector(`[data-role="selectBox"]`);
const values = select.querySelector(`[date-value="optValue"]`);
const option = select.querySelector('ul');
const opts = option.querySelectorAll('li');

 셀렉트영역 클릭 시 옵션 숨기기, 보이기 
function selects(e) {
	e.stopPropagation();
	option.setAttribute('style', `top:${select.offsetHeight}px`)
	if (option.classList.contains('hide')) {
		option.classList.remove('hide');
		option.classList.add('show');
	} else {
		option.classList.add('hide');
		option.classList.remove('show');
	}
	selectOpt();
}

 옵션선택 
function selectOpt() {
	opts.forEach(opt => {
		const innerValue = opt.innerHTML;
		function changeValue() {
			values.innerHTML = innerValue;
		}
		opt.addEventListener('click', changeValue)
	});
}

 렌더링 시 옵션의 첫번째 항목 기본 선택 
function selectFirst() {
	const firstValue = '--자동차 모델을 선택하세요--';
	values.innerHTML = `${firstValue}`
}*/

/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
function hideSelect() {
	if (option.classList.contains('show')) {
		option.classList.add('hide');
		option.classList.remove('show');
	}
}

selectFirst();
select.addEventListener('click', selects);
body.addEventListener('click', hideSelect);

//제이쿼리 선택색상변경
$(document).ready(function() {
	// 모든 asanList 클래스에 클릭 이벤트 추가
	$('.asanList,.cheonanList').click(function() {
		$(this).addClass('selected');
		// 다른 asanList 클래스에서 selected 클래스 제거
		$('.asanList,.cheonanList').not(this).removeClass('selected');
		if ($('.asanList,.cheonanList').hasClass('selected')) {
			var clickedValue = $(this).text(); // 클릭된 요소의 텍스트 가져오기
      $(".place.rent-place").text(clickedValue); // 텍스트 설정
			$(".location-modal-check-Btn").css("background-color", "#0D6FFC");
		}
	});
});

//모달 다음 확인
document.addEventListener("DOMContentLoaded", function() {
	// 다음버튼 클릭 시 이벤트 처리
	document.querySelector('.location-modal-check-Btn').addEventListener('click', function() {
		// 대여장소선택을 반납장소선택으로 변경

		document.querySelector('.location-modal-header-text').innerText = '반납장소선택';

		// 다음을 확인으로 변경
		document.querySelector('.location-modal-check-Btn').innerText = '확인';

		// 여기에 추가로 원하는 기능을 구현할 수 있습니다.
		// 예를 들어, 다음을 누를 때마다 특정 동작이 일어나도록 할 수 있습니다.
	});
});


// 장소 클릭시 연동되는 거 .. > 중도포기
/*const rentPlaceElement = document.querySelector('.rent-place'); // 대여장소선택
const returnPlaceElement = document.querySelector('.return-place'); // 반납장소선택
const asanListElements = document.querySelectorAll('.asanList'); // 아산 리스트 요소들
const cheonListElements = document.querySelectorAll('.cheonanList'); // 천안 리스트 요소들

asanListElements.forEach(function(element){
	element.addEventListener('click', ()=>{ // 천안에서 클릭한 세부 장소의 innerText값 가져오기
		const clickedValue = element.innerText; 
		rentPlaceElement.innerText = clickedValue;
	})
})

cheonanListElements.forEach(function(element){
	element.addEventListener('click', ()=>{ // 클릭한 세부 장소의 innerText값 가져오기
		const clickedValue = element.innerText; 
		returnPlaceElement.innerText = clickedValue;
	})
})*/



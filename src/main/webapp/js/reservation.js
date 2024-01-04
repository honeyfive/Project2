
//지역모달창
const locationModal = document.querySelector('.location-modal');
const btnLocationOpenModal = document.querySelector('.rv-locationAndDateBox-location');
const rentModal = document.querySelector('.rent-place');
const returnModal = document.querySelector('.return-place');
const locationCloseBtn = document.querySelector('.location-modal-close-Btn');
const locationCloseBtn2 = document.querySelector('.location-modal2-close-Btn');
const modalCheckBtn = document.querySelector('.location-modal-check-Btn');
const modalCheckBtn2 = document.querySelector('.location-modal2-check-Btn');

// 대여장소선택박스를 누르면 실행되는 이벤트
rentModal.addEventListener("click", () => {
	locationModal.style.display = "flex";
	$(".location-modal-check-Btn").css("background-color", "#999999");
	$('.location-modal-body').css("z-index", 301);
	$('input[type="text"].rent-place').css("border","3px solid #0D6FFC")
	$('.asanList, .cheonanList').on('click', function() {
		$('.asanList, .cheonanList').removeClass('selected');
		$(this).addClass('selected');
		var clickedValue = $(this).text();
		$('input[type="text"].rent-place').val(clickedValue);
		$('.location-modal-check-Btn').css("background-color", "#0D6FFC");
	});
});

returnModal.addEventListener("click", () => {
	locationModal.style.display = "flex";
	$(".location-modal2-check-Btn").css("background-color", "#999999");
	$('input[type="text"].return-place').css("border","3px solid #0D6FFC")
	$('.asanList2, .cheonanList2').on('click', function() {
		$('.asanList2, .cheonanList2').removeClass('selected');
		$(this).addClass('selected');
		var clickedValue = $(this).text();
		$('input[type="text"].return-place').val(clickedValue);
		$(".location-modal2-check-Btn").css("background-color", "#0D6FFC");
	});
});

modalCheckBtn.addEventListener("click", () => {
	$('.location-modal-body').css("z-index", 299);
	if ($('.asanList, .cheonanList').hasClass('selected')) {
		locationModal.style.display = "none";
	}
});

modalCheckBtn2.addEventListener("click", () => {
	if ($('.asanList2, .cheonanList2').hasClass('selected')) {
		locationModal.style.display = "none";
	}
});

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

modalCheckBtn.addEventListener("click", () => {
	if ($('.asanList, .cheonanList').hasClass('selected')) {
		locationModal.style.display = "none";
	}
});

modalCheckBtn2.addEventListener("click", () => {
	if ($('.asanList2, .cheonanList2').hasClass('selected')) {
		locationModal.style.display = "none";
	}
});

locationCloseBtn.addEventListener("click", () => {
	$('.location-modal-body').css("z-index", 299);
	locationModal.style.display = "none";
});

locationCloseBtn2.addEventListener("click", () => {
	$('.location-modal-body').css("z-index", 299);
	locationModal.style.display = "none";
});

locationModal.addEventListener("click", e => {
	const evTarget = e.target
	if (evTarget.classList.contains("location-modal")) {
		$('.location-modal-body').css("z-index", 299);
		locationModal.style.display = "none";
	}
});





//달력모달창

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
/*function hideSelect() {
	if (option.classList.contains('show')) {
		option.classList.add('hide');
		option.classList.remove('show');
	}
}*/

/*selectFirst();
select.addEventListener('click', selects);
body.addEventListener('click', hideSelect);*/

//제이쿼리 선택색상변경



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

/*document.addEventListener("DOMContentLoaded", function() {
		var carBoxes = document.querySelectorAll('.rv-carInfoBox-Box');
		var carSizeCheckboxes = document.querySelectorAll('.carCheckbox');
		var carTypeCheckboxes = document.querySelectorAll('.carTypeCheckobx');
		var selectAllSizes = document.getElementById('selectAllSizes');
		var selectAllTypes = document.getElementById('selectAllTypes');

		selectAllSizes.addEventListener('change', toggleAllSizes);
		selectAllTypes.addEventListener('change', toggleAllTypes);

		carSizeCheckboxes.forEach(function(checkbox) {
			checkbox.addEventListener('change', updateDisplayedCars);
		});

		carTypeCheckboxes.forEach(function(checkbox) {
			checkbox.addEventListener('change', updateDisplayedCars);
		});

		function toggleAllSizes() {
			carSizeCheckboxes.forEach(function(cb) {
				cb.checked = selectAllSizes.checked;
			});
			updateDisplayedCars();
		}

		function toggleAllTypes() {
			carTypeCheckboxes.forEach(function(cb) {
				cb.checked = selectAllTypes.checked;
			});
			updateDisplayedCars();
		}

		function updateDisplayedCars() {
			var selectedSizes = [];
			var selectedTypes = [];

			carSizeCheckboxes.forEach(function(cb) {
				if (cb.checked) {
					selectedSizes.push(cb.value.toLowerCase());
				}
			});

			carTypeCheckboxes.forEach(function(cb) {
				if (cb.checked) {
					selectedTypes.push(cb.value.toLowerCase());
				}
			});

			carBoxes.forEach(function(carBox) {
				var carSizeElement = carBox.querySelector('.rv-carInfoBox-Box-carSize');
				var carTypeElement = carBox.querySelector('.rv-carInfoBox-Box-carType');

				var carSizeText = carSizeElement.textContent.trim().toLowerCase();
				var carTypeText = carTypeElement.textContent.trim().toLowerCase();

				var sizeFilter = selectedSizes.length === 0 || selectedSizes.includes(carSizeText) || selectedSizes.includes('all');
				var typeFilter = selectedTypes.length === 0 || selectedTypes.includes(carTypeText) || selectedTypes.includes('all');

				if ((selectedSizes.length === 1 && selectedTypes.length === 0 && sizeFilter) ||
					(selectedTypes.length === 1 && selectedSizes.length === 0 && typeFilter) ||
					(sizeFilter && typeFilter)) {
					carBox.style.display = 'flex';
				} else {
					carBox.style.display = 'none';
				}
			});
		}
	});*/
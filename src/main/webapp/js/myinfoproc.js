// 모달을 열고 닫는 함수
function closeModal(modalClass) {
  document.querySelectorAll(modalClass).forEach(modal => {
    modal.style.display = 'none';
  });
}

function openModal(modalClass) {
  closeModal('.modal'); // 모든 모달 창을 닫습니다.
  document.querySelector(modalClass).style.display ='block';
}

// 각각의 클릭 이벤트에 모달 열기 함수 할당
document.querySelectorAll('.my_email_box').forEach(element => {
  element.addEventListener('click', () => {
    openModal('.member_email_modal');
  });
});

document.querySelectorAll('.my_phonenum').forEach(element => {
  element.addEventListener('click', () => {
    openModal('.member_tel_modal');
  });
});

document.querySelectorAll('.my_birthday').forEach(element => {
  element.addEventListener('click', () => {
    openModal('.member_birth_modal');
  });
});

// 닫기 버튼 이벤트
document.querySelectorAll('.close_modal_btn').forEach(element => {
  element.addEventListener('click', () => {
    closeModal('.member_email_modal');
    closeModal('.member_tel_modal');
    closeModal('.member_birth_modal');
  });
});

// 모달 외부 영역 클릭 시 닫기 이벤트
window.addEventListener('click', function(event) {
  const modals = document.querySelectorAll('.modal');
  if (!event.target.closest('.modal-content') && !event.target.matches('.modal')) {
    modals.forEach(modal => {
      if (modal.style.display == 'block') {
        modal.style.display = 'none';
      }
    });
  }
});







document.querySelectorAll('.go_to_kakao_linkage, .go_to_apple_linkage, .go_to_naver_linkage').forEach(function(button) {
  button.addEventListener('click', function(event) {
      const currentButton = event.currentTarget;

      currentButton.classList.toggle('connected');
      currentButton.textContent = currentButton.classList.contains('connected') ? '연동중' : '연동하기';

      if (currentButton.classList.contains('connected')) {
          const checkIcon = document.createElement('i');
          checkIcon.className = 'fa-solid fa-check';
          checkIcon.style.marginLeft = '5px'; // 아이콘과 텍스트 간격 조정
          currentButton.appendChild(checkIcon);
      } else {
          currentButton.removeChild(currentButton.querySelector('.fa-check'));
      }
  });
});


document.querySelector('#go_to_logout').addEventListener('click', () => {
  if (confirm('로그아웃 하시겠습니까?')) {
      alert('로그아웃 되었습니다');
      location.href = "./login.jsp";
  }
});

document.querySelector('.member_out').addEventListener('click',()=>{
  if(confirm('카모아를 떠나실건가요?')) {
    alert('가는 사람 안 잡아요');
    location.href = "./deleteMemberInfo_proc.jsp";
  }
});



// 비밀번호 영어 문자 숫자 그거 ..


function checkPasswordPattern(pw) {
  const pwInput = document.getElementById('pw').value; // 비번 입력값
  const pwBtn = document.getElementById('pwChkBtn'); // 확인 버튼
  let message = ""; // 출력 메세지

  const pattern1 = /[0-9]/;  // 숫자
  const pattern2 = /[a-zA-Z]/; // 영어
  const pattern4 = /[~!@#$%^&*()_+|<>?:{}]/;  // 특문

  console.log("버튼");
  // 숫자 존재하냐
  if (pattern1.test(pwInput) == false) {
    console.log("숫자없삼");
    message = "비밀번호에 숫자가 입력되지 않았습니다.\n숫자를 입력하여 주시기 바랍니다.";
  }

  // 영문 존재하냐
  if (pattern2.test(pwInput) == false) {
    console.log("영어없삼");
    message = "비밀번호에 영문 소문자가 입력되지 않았습니다.\n영문을 입력하여 주시기 바랍니다.";
  }

  // 특문 존재 하냐
  if (pattern4.test(pwInput) == false) {
    console.log("특문없삼");
    message = "비밀번호에 특수문자가 입력되지 않았습니다.\n특수문자를 입력하여 주시기 바랍니다.";
  }

  // 길이 검사
  if (pwInput.length < 3 || pwInput.length > 10) {
    console.log("길이오류");
    message = "비밀번호는 3자리 이상 10자리 이하만 가능합니다.\n비밀번호를 다시 입력하여 주시기 바랍니다.";
  }

  // 결과 출력
  if (message) {
    alert(message);
  } else {
    alert("사용 가능한 비밀번호입니다!");
  }
}

// 개인정보 동의 안 하면 회원가입 불가

function toggleButton() {
  const agreeBtn = document.querySelector('#plz-ok'); // 체크박스
  const submitBtn = document.querySelector('.signin-submit'); // 회원가입버튼

  if (agreeBtn.checked) {
      submitBtn.removeAttribute("disabled");
      console.log("눌림");
  } else {
      submitBtn.setAttribute("disabled", "disabled");
  }
}
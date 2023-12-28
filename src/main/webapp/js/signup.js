// 비밀번호 영어 문자 숫자 그거 ..
const pw = document.getElementById('pw').val();
const pwBtn = document.getElementById('pwChkBtn');
const check = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{3,10}$/;

console.log(pw);

pwBtn.addEventListener('click', ()=>{
    if (check.test(pw)) {
        alert("이용 가능한 비밀번호입니다!");
      } else { 
        alert("비밀번호는 3자리 이상 10자리 이하 영문 + 숫자 + 특수문자 조합으로 이루어져야 합니다.")
    }
})


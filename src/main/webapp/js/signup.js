// 비밀번호 영어 문자 숫자 그거 ..
const pw = document.getElementById('password');
const cautionMessage = document.getElementsByClassName('hide');
const btn = document.getElementById('chkBtn');

console.log(pw);


function strongPassword(str) {
    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
}

// pw.addEventListener('onclick', ()=>{
//     if(pw.value.length !== 0){
//         if(strongPassword(pw.value)){
//             cautionMessage.classList.add('hide');
//         }
//     } else{
//         cautionMessage.classList.remove('hide');
//     }
// })

btn.onclick = function () {
    if (pw.value.length !== 0) {
        if (strongPassword(pw.value)) {
            cautionMessage.classList.add('hide');
        }
    } else {
        cautionMessage.classList.remove('hide');
    }
}

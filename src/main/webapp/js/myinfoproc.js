document.querySelector('#go_to_logout').addEventListener('click', () => {
    if (confirm('로그아웃 하시겠습니까?')) {
        alert('로그아웃 되었습니다');
        location.href = "./login.jsp";
    }
});

document.querySelectorAll('.my_email_id').forEach(element => {
    element.addEventListener('click', () => {
        document.querySelector('.member_email_modal').classList.add('active');
    });
});

document.querySelectorAll('.close_modal_btn').forEach(element => {
    element.addEventListener('click', () => {
        document.querySelector('.member_email_modal').classList.remove('active');
    });
});

window.onclick = function(event) {
    if (event.target === document.querySelector('.member_email_modal')) {
        document.querySelector('.member_email_modal').classList.remove('active');
    }
};

document.querySelectorAll('.my_phonenum').forEach(element =>{
    element.addEventListener('click',()=>{
        document.querySelector('.member_tel_modal').classList.add('active');
    })
});

document.querySelectorAll('.close_modal_btn').forEach(element => {
    element.addEventListener('click', () => {
        document.querySelector('.member_tel_modal').classList.remove('active');
    });
});

window.onclick = function(event) {
    if (event.target === document.querySelector('.member_tel_modal')) {
        document.querySelector('.member_email_modal').classList.remove('active');
    }
};

document.querySelectorAll('.my_nickname').forEach(element => {
    element.addEventListener('click', () => {
        document.querySelector('.member_nickname_modal').classList.add('active');
    });
});

document.querySelectorAll('.close_modal_btn').forEach(element => {
    element.addEventListener('click', () => {
        document.querySelector('.member_nickname_modal').classList.remove('active');
    });
});

window.onclick = function(event) {
    if (event.target === document.querySelector('.member_nickname_modal')) {
        document.querySelector('.member_nickname_modal').classList.remove('active');
    }
};

document.querySelectorAll('.my_birthday').forEach(element => {
    element.addEventListener('click', () => {
        document.querySelector('.member_birth_modal').classList.add('active');
    });
});

document.querySelectorAll('.close_modal_btn').forEach(element => {
    element.addEventListener('click', () => {
        document.querySelector('.member_birth_modal').classList.remove('active');
    });
});

window.onclick = function(event) {
    if (event.target === document.querySelector('.member_birth_modal')) {
        document.querySelector('.member_birth_modal').classList.remove('active');
    }
};



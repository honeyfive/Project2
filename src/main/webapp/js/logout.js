document.querySelector('#login_after').addEventListener('click', () => {
  if (confirm('로그아웃 하시겠습니까?')) {
      alert('로그아웃 되었습니다');
      location.href = "./logout.jsp";
   
  }else{
	  
  }
});


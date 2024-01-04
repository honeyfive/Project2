document.querySelectorAll('.logout_status').forEach(item => {
  item.addEventListener('click', () => {
    if (alert('로그인을 해 주세요.')) {
      location.href = "./login.jsp";
    }
  });
});
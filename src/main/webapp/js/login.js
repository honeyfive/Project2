document.querySelectorAll('.logout_status').forEach(item => {
  item.addEventListener('click', () => {
    if (alert('로그인을 해 주세요.')) {
      location.href = "./login.jsp";
    }
  });
});

document.querySelectorAll('#payment-pg').forEach(item => {
  item.addEventListener('click', () => {
    if (alert('예약을 하셔야 합니다.')) {
      location.href = "./reservation.jsp";
    }
  });
});
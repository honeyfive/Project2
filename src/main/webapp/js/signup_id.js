// 아이디 확인 ajax
$(document).ready(function() {
	$('#idChkBtn').click(function() {
		if ($('#id').val() != '') { // 아이디 입력값이 있으면
			$.ajax({
				type: 'GET',
				url: './signup_id_proc.jsp',
				data: 'id=' + $('#id').val(),
				dataType: 'json',
				success: function(data) {
					if (data == 0) {
						alert('이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.');;
					} else {
						alert('사용 가능한 아이디입니다!');
					}
				},
				error: function(a, b, c) {
				}

			});

		} else { // 아이디 입력값 공백이면
			alert("아이디를 입력하세요.");
			$('#id').focus();
		}

	})
})
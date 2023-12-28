// 이메일 확인 ajax
$(document).ready(function() {
	$('#emailChkBtn').click(function() {

		if (($('#email').val() != '')) {

			$.ajax({
				type: 'GET',
				url: './signup_email_proc.jsp',
				data: 'email=' + $('#email').val(),
				dataType: 'json',
				success: function(data) {
					console.log(data);

					if (data == 0) {
						alert('이미 등록된 이메일입니다.');;
					} else {
						alert('이메일이 등록되었습니다!');
					}
				},
				error: function(a, b, c) {
				}

			});

		} else {
			alert("이메일을 입력하세요.");
			$('#email').focus();
		}

	})
})
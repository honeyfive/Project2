// 전화번호 확인 ajax
$(document).ready(function() {
	$('#telChkBtn').click(function() {
		console.log("눌림");

		if (($('#tel1').val() != '') && ($('#tel2').val() != '') && ($('#tel3').val() != '')) {
			console.log("값 들어옴");

			$.ajax({
				type: 'GET',
				url: './signup_tel_proc.jsp',
				data: 'tel=' + $('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel3').val(),
				dataType: 'json',
				success: function(data) {
					console.log(data);

					if (data == 0) {
						alert('이미 등록된 전화번호입니다.');;
					} else {
						alert('전화번호가 등록되었습니다!');
					}
				},
				error: function(a, b, c) {
				}

			});

		} else {
			alert("전화번호를 전부를 입력하세요.");
			if ($('#tel1').val() == '') {
				$('#tel1').focus();
			}

			if ($('#tel2').val() == '') {
				$('#tel2').focus();
			}

			if ($('#tel3').val() == '') {
				$('#tel33').focus();
			}
		}

	})
})
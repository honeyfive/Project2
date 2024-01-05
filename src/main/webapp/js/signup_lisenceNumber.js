// 운전면허번호 확인 ajax
$(document).ready(function() {
	$('#liChkBtn').click(function() {
			console.log("눌림");

		if (($('#lisence').val() != '') && ($('#lisence2').val() != '') && ($('#lisence3').val() != '') && ($('#lisence1').val() != '')) {
						console.log("값 들어옴");

			$.ajax({
				type: 'GET',
				url: './signup_lisenceNumber_proc.jsp',
				data: 'lisence_number=' + $('#lisence1').val() + '-' + $('#lisence2').val() + '-' + $('#lisence3').val() + '-' + $('#lisence4').val(),
				dataType: 'json',
				success: function(data) {
								console.log(data);

					if (data == 0) {
						alert('이미 등록된 운전면허번호입니다.');;
					} else {
						alert('운전면허번호가 등록되었습니다!');
					}
				},
				error: function(a, b, c) {
				}

			});

		} else {
			alert("운전면허번호를 전부를 입력하세요.");
			if ($('#lisence1').val() == '') {
				$('#lisence1').focus();
			}

			if ($('#lisence2').val() == '') {
				$('#lisence2').focus();
			}

			if ($('#lisence3').val() == '') {
				$('#lisence3').focus();
			}

			if ($('#lisence4').val() == '') {
				$('#lisence4').focus();
			}

		}

	})
})
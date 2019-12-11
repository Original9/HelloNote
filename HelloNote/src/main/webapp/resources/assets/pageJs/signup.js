// 회원가입 confirm
function signupbutton() {
	var form = document.signUp;
	var agree = confirm("회원가입 하시겠습니까?");

	if (!form.hellonoteId.value) {
		alert("아이디를 입력하세요.")
		return false;
	}
	if (form.idDuplication.value != "idCheck") {
		alert("아이디 중복체크를 해주세요.")
		return false;
	}

	if (!form.pw.value) {
		alert("비밀번호를 입력하세요.")
		return false;
	}
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if (form.pw.value != form.pwcheck.value) {
		alert("비밀번호를 동일하게 입력하세요.")
		return false;
	}
	if (!form.gender.value) {
		alert("성별을 선택해주세요.")
		return false;
	}
	if (!form.age.value) {
		alert("나이를 입력해주세요.")
		return false;
	}
	if (!form.hProfile.value) {
		alert("간단한 자기소개를 입력해주세요.")
		return false;
	}

	if (agree) {
		form.submit();
	}
}
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
$("#hellonoteId").blur(
		function() {
			// id = "id_reg" / name = "userId"
			var user_id = $('#hellonoteId').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/user/idCheck?hellonoteId='
						+ user_id,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : " + data);

					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {

						if (idJ.test(user_id)) {
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);

						} else if (user_id == "") {

							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);

						} else {

							$('#id_check').text(
									"아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}

					}
				},
				error : function() {
					console.log("실패");
				}
			});
		});

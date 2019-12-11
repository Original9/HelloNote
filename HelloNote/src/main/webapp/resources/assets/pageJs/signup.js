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

$(function() {
	$(".idCheck").click(function() {

		var query = {hellonoteId : $("#hellnoteId").val()};

		$.ajax({
			url : "idCheck",
			type : "post",
			data : query,
			success : function(data) {

				if (data == 1) {
					$(".result .msg").text("사용 불가");
					$(".result .msg").attr("style", "color:#f00")
					$("#submit").attr("disabled", "disabled");
				} else {
					$(".result .msg").text("사용 가능");
					$(".result .msg").attr("style", "color:#f00f")
					$("#submit").removeAttr("disabled");
				}
			}
		});
	});
	$("#userId").keyup(function() {
		$(".result .msg").text("아이디를 확인해주십시오.");
		$(".result .msg").attr("style", "color:#000");

		$("#submit").attr("disabled", "disabled");

	});
})

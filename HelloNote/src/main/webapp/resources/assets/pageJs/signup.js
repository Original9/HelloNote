// 회원가입 confirm
function signupbutton() {
	var form = document.signUp;
	var agree = confirm("회원가입 하시겠습니까?");
	if (!agree) {
		alert("취소 하였습니다.")
		return false;
	}
	if (!form.hellonoteId.value) {
		alert("아이디를 입력하세요.")
		$("#hellonoteId").focus();
		return false;
	}
	if (!form.pw.value) {
		alert("비밀번호를 입력하세요.")
		$("#pw").focus();
		return false;
	}
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if (form.pw.value != form.pwcheck.value) {
		alert("비밀번호를 동일하게 입력하세요.")
		$("#pwcheck").focus();
		return false;
	}
	if (!form.gender.value) {
		alert("성별을 선택해주세요.")
		$("#gender").focus();
		return false;
	}
	if (!form.age.value) {
		alert("나이를 입력해주세요.")
		$("#age").focus();
		return false;
	}
	if (!form.hProfile.value) {
		alert("간단한 자기소개를 입력해주세요.")
		$("#hProfile").focus();
		return false;
	}
	alert("가입이 완료 되었습니다.")
	document.signUp.submit();
}

$(function() {
	$(".idCheck").click(function() {

		var query = {
			hellonoteId : $("#hellonoteId").val()
		};
		console.log(query);
		$.ajax({
			url : "idCheck",
			type : "post",
			data : query,
			success : function(data) {
				console.log(data + '@@@@@');
				if (data == 1) {
					$(".result .msg").text("사용 불가");
					$(".result .msg").attr("style", "color:#f00")
					$("#btnSign").attr("disabled", "disabled");
				} else {
					$(".result .msg").text("사용 가능");
					$(".result .msg").attr("style", "color:#f00f")
					$("#btnSign").removeAttr("disabled");
				}
			}
		});
	});
	$("#hellonoteId").keyup(function() {
		$(".result .msg").text("아이디를 확인해주십시오.");
		$(".result .msg").attr("style", "color:#000");

		$("#btnSign").attr("disabled", "disabled");

	});
})

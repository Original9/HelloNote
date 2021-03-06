// 회원가입 confirm
function signupbutton() {
	var form = document.signUp;
	var agree = confirm("회원가입 하시겠습니까?");

	if (!agree) {
		alert("취소 하였습니다.")
		return false;
	}

	if (!form.pw.value) {
		alert("비밀번호를 입력하세요.")
		$("#pw").focus();
		return false;
	}

	var password1RegExp = /^.*(?=.{4,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	if (!password1RegExp.test(form.pwcheck.value)) {
		alert("비밀번호는 영문, 숫자 혼합하여 6~20자리 이내로 입력해야합니다.")
		$("#pw").focus();
		$("#pw").val('');
		$('#pwcheck').val('');
		return false;
	}
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if (form.pw.value != form.pwcheck.value) {
		alert("비밀번호를 동일하게 입력하세요.")
		$("#pwcheck").focus();
		$('#pwcheck').val('');
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

// ID 중복체크 눌렀을때 실행되는 function
$(function() {
	$(".idCheck").click(function() {
		var form = document.signUp;

		// 아이디 안에 공백 확인
		if ($("#hellonoteId").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#hellonoteId").focus();
			$("#hellnoteId").val('');
			return false;
		}
		
		// 아이디의 첫글자는 영어여야하고 영문+숫자조합
		var id1RegExp = 	/^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
		if (!id1RegExp.test(form.hellonoteId.value)) {
			alert("4~20 자리 첫글자는 숫자 사용 불가 영어와숫자만로만 입력해야합니다.")
			$("#hellonoteId").focus();
			$("#hellonoteId").val('');
			return false;
		}

		// ID안에 패턴공백검사
		if (form.hellonoteId.value.search(/\s/) != -1) {
			alert("아이디에 공백없이 입력해주세요.");
			$("#hellonoteId").focus();
			$('#hellonoteId').val('');
			return false;
		}
		// 아이디는 영문 대소문자와 숫자 4~12자리로 입력
		var special_pattern = /^[a-zA-z0-9]{4,12}$/;
		if (!special_pattern.test(form.hellonoteId.value)) {
			alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다");
			$("#hellonoteId").focus();
			$('#hellonoteId').val('');
			return false;
		}

		var query = {
			hellonoteId : $("#hellonoteId").val()
		};
		console.log(query);
		$.ajax({
			url : "idCheck",
			type : "post",
			data : query,
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디 입니다.");
					$("#btnSign").attr("disabled", "disabled");
				} else {
					alert("사용가능한 아이디 입니다.");
					$("#btnSign").removeAttr("disabled");
				}
			}
		});
	});
	$("#hellonoteId").keyup(function() {
		$("#btnSign").attr("disabled", "disabled");
	});
})


// 회원가입 confirm
function signupbutton() {
	var form = document.signUp;
	var agree = confirm("회원가입 하시겠습니까?");
<<<<<<< HEAD

	if (!agree) {
		alert("취소 하였습니다.")
		return false;
	}

	if (!form.pw.value) {
		alert("비밀번호를 입력하세요.")
		$("#pw").focus();
		return false;
	}

	// 패스워드 길이 제한
	if (form.pw.value.length <= 2) {
		alert("비밀번호는 3자리 이상으로 설정해주세요")
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

	// PW에 영문 숫자 혼용해야함 search 는 조회할때 str값 참조하기 때문에 앞에 str값이 와야함
	var checkNumber = form.pw.value.search(/[0-9]/g);
	var checkEnglish = form.pw.value.search(/[a-z]/ig);
	if (checkNumber < 0 || checkEnglish < 0) {
		alert("숫자와 영문자를 혼용하여야 합니다.");
		// ID가 pw 인곳에 val을 '' 공백처리하고 포커스를 맞춘다
		$('#pw').val('').focus();
		$('#pwcheck').val('');
		return false;
	}
//	// PW 값에 ID 가 포함 되었을때 false
//	if (form.pw.value.search(hellonoteId) > -4) {
//		alert("비밀번호에 아이디가 포함되었습니다.");
//		$('#pw').val('').focus();
//		$('#pwcheck').val('');
//		return false;
//	}

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

		// 아이디 길이 제한
		if (form.hellonoteId.value.length <= 3) {
			alert("아이디는 4자리 이상으로 설정해주세요")
			$("#hellonoteId").focus();
			$('#hellonoteId').val('');
			return false;
		}

		// ID안에 패턴공백검사
		if (form.hellonoteId.value.search(/\s/) != -1) {
			alert("아이디에 공백없이 입력해주세요.");
			$("#hellonoteId").focus();
			$('#hellonoteId').val('');
			return false;
		}
		// 특수 문자가 있나 없나 체크
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		if (special_pattern.test(form.hellonoteId.value) == true) {
			alert("아이디에 특수문자 없이 입력해주세요.");
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
=======
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

>>>>>>> branch 'master' of https://github.com/Original9/HelloNote
	});
})

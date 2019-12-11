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
// 아이디 입력창에 값 입력시 hidden에 idUncheck를 셋팅
function inputIdChk() {
	document.signUp.idDuplication.value = "idUncheck"
}

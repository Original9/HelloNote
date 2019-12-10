// 회원가입 confirm
function signupbutton() {
	var agree = confirm("회원가입 하시겠습니까?");
	if (agree) {
		document.signUp.submit();
	}
}
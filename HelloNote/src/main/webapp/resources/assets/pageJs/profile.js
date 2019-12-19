// userdatatable Jquery
$(document).ready(function() {
	// 수정 버튼 클릭
	$('#updatebutton').on('click', function() {

		// span tag는 FORM ID 에 ID .html
		// input태그는 (form ID input 종류select or input["name=이름"]).val()
		var pw = $('#ChangeInfo input[name="pw"]').val();
		var hellonoteId = $('#ChangeInfo input[name="hellonoteId"]').val();
		var gender = $('#ChangeInfo input[name="gender"]').val();
		var age = $('#ChangeInfo input[name="age"]').val();
		var hGrant = $('#ChangeInfo input[name="hGrant"]').val();
		var hProfile = $('#ChangeInfo textarea[name="hProfile"]').val();

		
		if (!ChangeInfo.pw.value) {
			alert("비밀번호를 입력하세요.")
			$("#pw").focus();
			return false;
		}

		var password1RegExp = /^.*(?=.{4,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		if (!password1RegExp.test(ChangeInfo.pw.value)) {
			alert("영문, 숫자 혼합하여 6~20자리 이내로 입력해야합니다.")
			$("#pw").focus();
			$("#pw").val('');
			$('#pwch').val('');
			return false;
		}
		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (ChangeInfo.pw.value != ChangeInfo.pwch.value) {
			alert("비밀번호를 동일하게 입력하세요.")
			$("#pwch").focus();
			$('#pwch').val('');
			return false;
		}

		$.ajax({
			url : "ChangeInfo",
			method : 'PUT',
			dataType : 'json',
			data : JSON.stringify({
				pw : pw,
				hellonoteId : hellonoteId,
				hProfile : hProfile,
				hGrant : hGrant,
				age : age,
				gender : gender
			}),
			contentType : 'application/json',
			success : getChangeHandler
		});
	});

});
function getChangeHandler(data) {
	var agree = confirm("회원정보를 변경 하시겠습니까?");
	if (agree) {
		alert("회원정보가 변경되었습니다.")
		location.reload();
	}
}
// 삭제버튼 클릭시 삭제 function
function deleteUser() {
	var agree = confirm("모든 자료가 모두 삭제 됩니다. 복구가 되지 않습니다. 그래도 탈퇴 하시겠습니까?");
	if (agree) {
		$('#ChangeInfo input[name="hellonoteId"]').val(
				$('#ChangeInfo #hellonoteId').html());
		alert("탈퇴 되었습니다.");
		document.ChangeInfo.submit();
	}
}
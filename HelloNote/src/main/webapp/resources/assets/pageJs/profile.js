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
		
		
		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (ChangeInfo.pw.value != ChangeInfo.pwch.value) {
			alert("비밀번호를 동일하게 입력하세요.")
			$("#pwch").focus();
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
	alert("회원정보 수정이 완료되었습니다.")

	location.reload();
}



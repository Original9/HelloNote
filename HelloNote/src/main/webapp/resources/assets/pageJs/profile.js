// userdatatable Jquery
$(document).ready(function() {
	$('#tabledata').DataTable();
});

// 수정 버튼 클릭
$('#updatebutton').on('click', function() {
	// span tag는 FORM ID 에 ID .html
	// input태그는 (form ID input 종류select or input["name=이름"]).val()
	var pw = $('#ChangeInfo input[name="pw"]').val();
	var hellonoteId = $('#ChangeInfo input[name="hellonoteId"]').val();
	var hProfile = $('#ChangeInfo input[name="hProfile"]').val();
	$.ajax({
		url : "ChangeInfo",
		method : 'PUT',
		dataType : 'json',
		data : JSON.stringify({
			pw : pw,
			hellonoteId : hellonoteId
		}),
		contentType : 'application/json',
		success : getChangeHandler
	});
});

function getChangeHandler(data) {
	alert("비밀번호 수정이 완료되었습니다.")
	$('#ChangeInfo input[name="pw"]').val(data.pw);
	$('#ChangeInfo input[name="hProfile"]').val(data.hProfile);
	

	location.reload();
}
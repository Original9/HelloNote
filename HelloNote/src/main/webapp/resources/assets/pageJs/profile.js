// userdatatable Jquery
$(document).ready(function() {
	$('#tabledata').DataTable();
});


$('#updatebutton').on('click', function() {
	// span tag는 FORM ID 에 ID .html
	// input태그는 (form ID input 종류select or input["name=이름"]).val()
	var gender = $('#UpdForm #gender').html(); 
	var hGrant = $('#UpdForm select[name="hGrant"]').val(); 
	var age = $('#UpdForm #age').html();
	var hProfile = $('#UpdForm textarea[name="hProfile"]').val();
	var hellonoteId = $('#UpdForm #hellonoteId').html();

	$.ajax({
		url : "updateUser",
		method : 'PUT',
		dataType : 'json',
		data : JSON.stringify({
			gender : gender,
			hGrant : hGrant,
			age : age,
			hProfile : hProfile,
			hellonoteId : hellonoteId
		}),
		contentType : 'application/json',
		success : getupdateHandler
	});
});

function getupdateHandler(data) {
$('#UpdForm #hellonoteId').html(data.hellonoteId);
$("#gender").html(data.gender);
$('#UpdForm select[name="hGrant"]').val(data.hGrant);
$('#UpdForm #age').html(data.age);
$('#UpdForm textarea[name="hProfile"]').val(data.hProfile);

$('#changeform').hide();
location.reload();

}
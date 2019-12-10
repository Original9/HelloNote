// 타이틀 체크 클릭시 모두 체크 
function allChk(obj) {
	var chkObj = document.getElementsByClassName("rowCheck");
	var rowCnt = chkObj.length - 1;
	var check = obj.checked;
	if (check) {
		for (var i = 0; i <= rowCnt; i++) {
			if (chkObj[i].type == "checkbox")
				chkObj[i].checked = true;
		}
	} else {
		for (var i = 0; i <= rowCnt; i++) {
			if (chkObj[i].type == "checkbox") {
				chkObj[i].checked = false;
			}
		}
	}
}

// ﻿ 체크박스 선택된 것 삭제 처리 (N개)
function fn_userDel() {

	var userid = "";
	var memberChk = document.getElementsByClassName("rowCheck");
	var chked = false;
	var indexid = false;
	for (i = 0; i < memberChk.length; i++) {
		if (memberChk[i].checked) {
			if (indexid) {
				userid = userid + '-';
			}
			userid = userid + memberChk[i].value;
			indexid = true;
		}
	}
	if (!indexid) {
		alert("삭제할 메모를 체크해 주세요");
		return;
	}

	var agree = confirm("삭제 하시겠습니까?");
	if (agree) {
		$('#userForm input[name="hellonoteId1"]').val($(this).closest('tr').find('td').val());
		document.userForm.submit();
	}
}

// 상세보기 모달창 삭제버튼 클릭시 삭제 function
function fn_userDel2() {
	var agree = confirm("삭제 하시겠습니까?");
	if (agree) {
		$('#dele input[name="hellonoteId"]').val($('#dele #hellonoteId').html());
		document.dele.submit();
	}
}

// 모달 function 호출
$(function() {
	UserUpdate();

	// 상세보기 모달창 열기
	$('.getUser').on('click', function() {
		$('#changeform').hide(); // 수정폼으로 close 햇을시 남아있는 수정 form을 숨겨준다
		$('#select').show(); // 다시 상세보기창을 띄운다
		// seq 선언 값
		var id = $(this).closest('tr').find('input').val(); // 클릭한버튼은 this

		$('#getUserModal').show();
		$.ajax({ // ajax 비동기식 실행
			url : 'getUser', // controller 부름 단건조회
			type : 'GET', // 받아온다
			data : {
				hellonoteId : id
			},
			dataType : 'json', // json 형식
			success : getUserHandler
		// 성공시 작동
		});
	})
	// success 후 function getMySiteHandler 실행 각ID에 데이터를 span에 값을 넣어줌 각 span은
	// html
	function getUserHandler(data) {
		$("#dele #hellonoteId").html(data.hellonoteId);
		$("#dele #gender").html(data.gender);
		$("#dele #hGrant").html(data.hGrant);
		$("#dele #age").html(data.age);
		$("#dele #hProfile").html(data.hProfile);
	}

	// .name 은 클래스 사용 모든영역에 사용가능 #name은 유니크한 ID 그객체만 사용가능
	// 상세보기 모달창 닫기
	$('#getUserModal .close').on('click', function() {
		$('#getUserModal').hide();
	})
 
	// change라는 ID버튼을 클릭시 수정모달로 show 해준다음 select 는 hide
	$('#change').on('click', function() {
		$('#UpdForm #hellonoteId').html($("#dele #hellonoteId").html());
		$('#UpdForm #gender').html($("#dele #gender").html());
		$('#UpdForm select[name="hGrant"]').val($("#dele #hGrant").html());
		$('#UpdForm #age').html($("#dele #age").html());
		$('#UpdForm textarea[name="hProfile"]').val($("#dele #hProfile").html());
		$('#changeform').show();
		$('#select').hide();
	})

	// 수정모달에서 change2(취소버튼)클릭시 다시 select(상세보기모달)로 show 해준다음 changeform은 hide
	$('#change2').on('click', function() {
		$('#select').show();
		$('#changeform').hide();
	})
});
// 사용자 수정 요청
function UserUpdate() {
	// 수정 버튼 클릭
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
}
function getupdateHandler(data) {
	$('#UpdForm #hellonoteId').html(data.hellonoteId);
	$("#gender").html(data.gender);
	$('#UpdForm select[name="hGrant"]').val(data.hGrant);
	$('#UpdForm #age').html(data.age);
	$('#UpdForm textarea[name="hProfile"]').val(data.hProfile);

	$('#changeform').hide();
	location.reload();

}

// userdatatable Jquery
$(document).ready(function() {
	$('#tabledata').DataTable();
});

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
		document.userForm.submit();
	}
}

// userdatatable Jquery
$(document).ready(function() {
	$('#tabledata').DataTable();
});


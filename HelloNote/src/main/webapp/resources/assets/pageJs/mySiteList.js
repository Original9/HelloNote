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

// 상세보기 모달창 삭제버튼 클릭시 삭제 function
function fn_userDel2() {
	var agree = confirm("삭제 하시겠습니까?");
	if (agree) {
		document.dele.submit();
	}
}

// 모달 function 호출
$(function() {
	mySiteUpdate();

	// 입력 모달창 열기
	// #specification ID 를 .on('click') 클릭시 , function() 실행
	$('#specification').on('click', function() {
		// mySiteModal 이라는 ID를 show 해준다
		$('#mySiteModal').show();
	})

	// 입력 모달창 닫기(열기와 같은 원리 hide는 숨겨줌)
	$('#mySiteModal .close').on('click', function() {
		$('#mySiteModal').hide();
	})

	// 상세보기 모달창 열기
	$('.getMySite').on('click', function() {
		$('#changeform').hide(); // 수정폼으로 close 했을시 남아있는 수정 form을 숨겨준다
		$('#select').show(); // 다시 상세보기창을 띄운다
		// seq 선언 값
		var seq = $(this).closest('tr').find('input').val(); // 클릭한버튼은 this
		// closest 부모위
		// find 배열 eq 1<
		// 2번째부터 html
		// 값넣어줌
		$('#getMySiteModal').show(); // getMySiteModal id 값의 모달을 show 해줌
		$.ajax({ // ajax 비동기식 실행
			url : 'getMySite', // controller 부름 단건조회
			type : 'GET', // 받아온다
			data : {
				mySiteSeq : seq
			}, // data는 {mySiteSeq:seq} 받아옴<input type="hidden"
			// name="mySiteSeq" id="mySiteSeq"> 참고
			dataType : 'json', // json 형식
			success : getMySiteHandler
		// 성공시 작동
		});
	})
	// success 후 function getMySiteHandler 실행 각ID에 데이터를 span에 값을 넣어줌 각 span은
	// html
	function getMySiteHandler(data) {
		$("#title").html(data.title);
		$("#siteAddr").html(data.siteAddr);
		$("#siteId").html(data.siteId);
		$("#sitePw").html(data.sitePw);
		$("#siteMemo").html(data.siteMemo);
		$("#mySiteSeq").val(data.mySiteSeq);
	}

	// .name 은 클래스 사용 모든영역에 사용가능 #name은 유니크한 ID 그객체만 사용가능
	// 상세보기 모달창 닫기
	// getMySiteModal form의 .close 클래스를 클릭시 function 실행
	$('#getMySiteModal .close').on('click', function() {
		$('#getMySiteModal').hide();
	})

	// change라는 ID버튼을 클릭시 수정모달로 show 해준다음 select 는 hide
	$('#change').on('click', function() {
		$('#UpdForm input[name="title"]').val($("#title").html());
		$('#UpdForm input[name="siteAddr"]').val($("#siteAddr").html());
		$('#UpdForm input[name="siteId"]').val($("#siteId").html());
		$('#UpdForm input[name="sitePw"]').val($("#sitePw").html());
		$('#UpdForm textarea[name="siteMemo"]').val($("#siteMemo").html());
		$('#UpdForm input[name="mySiteSeq"]').val($("#mySiteSeq").val());
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
function mySiteUpdate() {
	// 수정 버튼 클릭
	$('#updatebutton').on('click', function() {
		var title = $('#UpdForm input:text[name="title"]').val();
		var siteAddr = $('#UpdForm input:text[name="siteAddr"]').val();
		var siteId = $('#UpdForm input:text[name="siteId"]').val();
		var sitePw = $('#UpdForm input[name="sitePw"]').val();
		var siteMemo = $('#UpdForm textarea[name="siteMemo"]').val();
		var mySiteSeq = $('#dele #mySiteSeq').val();
		
		$.ajax({
			url : "updateMySite",
			method : 'PUT',
			dataType : 'json',
			data : JSON.stringify({
				title : title,
				siteAddr : siteAddr,
				siteId : siteId,
				sitePw : sitePw,
				siteMemo : siteMemo,
				mySiteSeq : mySiteSeq
			}),
			contentType : 'application/json',
			success : getupdateHandler
		});
	});
}
function getupdateHandler(data) {
	$("#title").html(data.title);
	$("#siteAddr").html(data.siteAddr);
	$("#siteId").html(data.siteId);
	$("#sitePw").html(data.sitePw);
	$("#siteMemo").html(data.siteMemo);
	$("#mySiteSeq").val(data.mySiteSeq);
	
	$('#changeform').hide();
	location.reload();
	
}

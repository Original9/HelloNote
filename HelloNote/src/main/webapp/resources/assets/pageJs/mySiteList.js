
$(function() {

	// 입력 모달창 열기
	$('#specification').on('click', function() {
		$('#mySiteModal').show();
	})

	// 입력 모달창 닫기
	$('#mySiteModal .close').on('click', function() {
		$('#mySiteModal').hide();
	})

	// 상세보기 모달창 열기
	$('.getMySite').on('click', function() {
		// seq 값
		var seq = $(this).parent().closest('tr').find('td').eq(1).html()
		$('#getMySiteModal').show();
		$.ajax({
			url : 'getMySite',
			type : 'GET',
			data : {mySiteSeq:seq},
			dataType : 'json',
			success : getMySiteHandler
		});
	})
	function getMySiteHandler(data) {
		$("#title").html(data.title);
		$("#siteAddr").html(data.siteAddr);
		$("#siteId").html(data.siteId);
		$("#sitePw").html(data.sitePw);
		$("#siteMemo").html(data.siteMemo);
		$("#mySiteSeq").val(data.mySiteSeq);
	}

	// 상세보기 모달창 닫기
	$('#getMySiteModal .close').on('click', function() {
		$('#getMySiteModal').hide();
	})
	
//	$('#change').on('click',".changeform", function() {
//		$('#changeform').show
//	}


})

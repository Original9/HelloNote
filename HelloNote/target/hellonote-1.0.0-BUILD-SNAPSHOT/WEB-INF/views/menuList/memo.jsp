<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/menu/memo.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
<script src="<c:url value="https://use.fontawesome.com/releases/v5.2.0/js/all.js"/>"></script>
<script	src="<c:url value="https://use.fontawesome.com/releases/v5.2.0/js/all.js"/>"></script>
<script>
	$(function() {
		var modal = $('#myModal');
		var span = $('.close').eq(0);
		var $modal = document.getElementById('myModal');
		var a = 0;
		var i = 1;

		// 메모 클릭 시 팝업 모달 표시
		$('#memoul')
				.on(
						'click',
						'li a',
						function() {
							// 모달 팝업 안의 내용들이 존재 하면 다 지운다.
							$('#modal-title').remove();
							$('#modal-text').remove();
							$('#title-edit').remove();
							$('#text-edit').remove();
							$('#edit').remove();
							$('#edit-done').remove();
							// 팝업 표시
							modal.show();
							// 메모 안의 내용 불러옴(변수로 지정)
							var $memos = $(this).text().trim().split(',');
							// 팝업에 메모 내용 append
							$('#modal-content')
									.append(
											'<div style="width: 100%; margin-top: 20px;" id="modal-title" class="modal-title">'
													+ $memos[0] + '</div>');
							$('#modal-content')
									.append(
											'<div style="width: 100%; margin-top: 20px;" id="modal-text" class="modal-text">'
													+ $memos[1].trim()
													+ '</div>');
							$('#modal-content').prepend(
									'<button id="edit">편집</button>');
							$('#modal-content').focus();
							a = $(this).attr('id').replace(/memo/, '');
						});

		$('#modal-content')
				.on(
						'click',
						'#edit',
						function() {
							var $modalContent = $(this).parent();
							$('#modal-title').hide();
							$('#modal-text').hide();
							$modalContent
									.append('<textarea rows="1" style="width: 100%" id="title-edit">'
											+ $('#modal-title').text()
											+ '</textarea>');
							$modalContent
									.append('<textarea rows="12" style="width: 100%" id="text-edit">'
											+ $('#modal-text').text()
											+ '</textarea>');
							$('#edit').html('완료');
							$('#edit').attr('id', 'edit-done');
						});

		$('#modal-content').on(
				'click',
				'#edit-done',
				function() {
					var $modalContent = $(this).parent(), $titleEdit = $(
							'#title-edit').val(), $textEdit = $('#text-edit')
							.val();
					$('#modal-title').text($titleEdit);
					$('#modal-text').text($textEdit);
					$('#title-edit').remove();
					$('#text-edit').remove();
					$('#modal-title').show();
					$('#modal-text').show();
					$('#edit-done').html('편집');
					$('#edit-done').attr('id', 'edit');
					$('#title' + a).text($titleEdit + ',');
					$('#text' + a).text($textEdit);
				});

		// x 누를 시 팝업 제거
		span.on('click', function() {
			modal.hide();

		})

		$('#add')
				.on(
						'click',
						function() {
							$('#memoul')
									.append(
											'<li class="memoli"><a id="memo'+i
											+'" class="memo"><div class="title-box"><h3 id="title'+i
											+'" class="title">Title,</h3></div><div class="text-box"><p id="text'+i
											+'" class="text">Text</p></div></a></li>');
							i = i + 1;
						});

		// 		$(window).click(function(e) {
		// 			if (e.target == modal) {
		// 				modal.hide();
		// 			}
		// 		})

		// 		window.onclick = function(event) {
		// 			if (event.target == modal) {
		// 				modal.style.display = "none";
		// 			}
		// 		}
	});
</script>
</head>
<body>
	<ul class="memoul" id="memoul">
		<li class="memoli"><a id="memo" class="memo">
				<div class="title-box">
					<h3 id="title" class="title">Title,</h3>
				</div>
				<div class="text-box">
					<p id="text" class="text">Text</p>
				</div>
		</a></li>
	</ul>
	<li class="icon"><i class="fas fa-plus-circle fa-4x" id="add"></i></li>
	<div class="modal" id="myModal">
		<div class="modal-content" id="modal-content">
			<span class="close">&times;</span>
		</div>
	</div>
</body>
</html>
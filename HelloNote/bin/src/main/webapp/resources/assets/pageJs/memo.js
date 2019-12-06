var modal, span, $modal, a, i, geocoder, address, marker = new kakao.maps.Marker;

$(function() {
	modal = $('#myModal');
	span = $('#modalClose');
	$modal = document.getElementById('myModal');
	// 카카오 맵 api geocoder 변수
	geocoder = new kakao.maps.services.Geocoder();
	// 주소 변수 미리 선언
	address;

	// 순서 변경 함수
	sorting();

	// 메모 클릭 시 팝업 모달 표시
	showMemoModal();

	// 편집
	editMemo();

	// 편집 시 장소 추가
	addingLocation();

	// 편집 완료
	editDone();

	// x 누를 시 팝업 제거
	closeModal();

	// 메모 추가
	addMemo();

	// 메모 삭제
	deleteHolder();

	// $(window).click(function(e) {
	// if (e.target == modal) {
	// modal.hide();
	// }
	// })

	// window.onclick = function(event) {
	// if (event.target == modal) {
	// modal.style.display = "none";
	// }
	// }
});

function deleteHolder() {
	$('#deleteHolder').droppable(
			{
				accept : '.memoli',
				drop : function(event, ui) {
					flag = false;
					var $id = ui.draggable.children().eq(0).attr("id").replace(
							'memo', '');
					$.ajax({
						url : 'deleteHandling',
						data : {
							memoSeq : $id
						},
						success : function() {
							ui.draggable.remove();
							console.log('delete success');
						}
					});
				}
			})
}

function addMemo() {
	$('#add').on('click', function() {
		$.ajax({
			url : 'insertMemo',
			dataType : 'json',
			method : 'post',
			success : addMemoHandler
		})

	});
}

function addMemoHandler(i) {
	$('#memoul')
			.append(
					'<li class="memoli" id="memoli'
							+ i
							+ '"><a id="memo'
							+ i
							+ '" class="memo"><div class="title-box"><h3 id="title'
							+ i
							+ '" class="title">Title</h3></div><div class="text-box"><p id="text'
							+ i
							+ '" class="text">Text</p></div><div class="location-box"><p id="location'
							+ i + '" class="text"></p></div></a></li>');
}

function closeModal() {
	span.on('click', function() {
		modal.hide();
	})
}

function editDone() {
	$('#modal-content')
			.on(
					'click',
					'#edit-done',
					function() {
						var $modalContent = $(this).parent(), $titleEdit = $(
								'#title-edit').val(), $textEdit = $(
								'#text-edit').val();

						// 모달 안의 텍스트 내용 변경
						$('#modal-title').text($titleEdit);
						$('#modal-text').text($textEdit);

						// input 삭제
						$('#title-edit').remove();
						$('#text-edit').remove();
						$('#addLocation').remove();

						// map 삭제
						$('#map').remove();

						// 숨겨놨던 모달 내용들 표시
						$('#modal-title').show();
						$('#modal-text').show();

						// 편집 완료 버튼을 편집버튼으로 변환
						$('#edit-done').html('편집');
						$('#edit-done').attr('id', 'edit');

						// 메모 안의 내용 변경
						$('#title' + a).text($titleEdit);
						$('#text' + a).text($textEdit);
						$('#location' + a).text($('#modalLocation').text());
					});
}

function addingLocation() {
	$('#modal-content')
			.on(
					'click',
					'#addLocation',
					function() {
						$(this)
								.before(
										'<div id="map" style="width: 100%; height: 400px;"></div>')
						var options = {
							center : new kakao.maps.LatLng(36.778338213001675,
									128.01324154787676),
							level : 14
						};
						var $container = $('#map');
						var map = new kakao.maps.Map($container[0], options);
						kakao.maps.event.addListener(map, 'click', function(
								mouseEvent) {
							var clickXy = mouseEvent.latLng;
							var coord = new kakao.maps.LatLng(clickXy.Ha,
									clickXy.Ga);
							marker.setMap(map);
							marker.setPosition(new kakao.maps.LatLng(
									clickXy.Ha, clickXy.Ga));
							var callback = function(result, status) {
								if (status === kakao.maps.services.Status.OK) {
									address = result[0].address.address_name;
									$('#modalLocation').text(address);

								}
							};

							geocoder.coord2Address(coord.getLng(), coord
									.getLat(), callback);
						});
						$('#addLocation').hide();
					});
}

function showMemoModal() {
	$('#memoul')
			.on(
					'click',
					'li a',
					function() {
						// 모달 팝업 안의 내용들이 존재 하면 다 지운다.
						$('#modalLocation').remove();
						$('#modal-title').remove();
						$('#modal-text').remove();
						$('#title-edit').remove();
						$('#text-edit').remove();
						$('#edit').remove();
						$('#edit-done').remove();
						$('#addLocation').remove();
						$('#map').remove();
						// 팝업 표시
						modal.show();
						a = $(this).attr('id').replace(/memo/, '');

						console.log($('#location' + a).text());

						// 팝업에 메모 내용 append
						$('#modal-content')
								.append(
										'<div style="width: 100%; margin-top: 20px;" id="modal-title" class="modal-title">'
												+ $('#title' + a).text()
												+ '</div>');
						$('#modal-content')
								.append(
										'<div style="width: 100%; margin-top: 20px;" id="modal-text" class="modal-text">'
												+ $('#text' + a).text()
												+ '</div>');
						$('#modal-content')
								.append(
										'<div style="width: 100%; margin-top: 20px;" id="modalLocation" class="modalLocation">'
												+ $('#location' + a).text()
												+ '</div>');

						$('#modal-content')
								.prepend(
										'<button id="edit" class="modalButton">편집</button>');
						$('#modal-content').focus();
					});
}

function editMemo() {
	$('#modal-content')
			.on(
					'click',
					'#edit',
					function() {
						var $modalContent = $(this).parent();
						$('#modal-title').hide();
						$('#modal-text').hide();
						$('#modalLocation').before(
								'<textarea rows="1" style="width: 100%" id="title-edit">'
										+ $('#modal-title').text()
										+ '</textarea>');
						$('#modalLocation').before(
								'<textarea rows="12" style="width: 100%" id="text-edit">'
										+ $('#modal-text').text()
										+ '</textarea>');
						if ($('#modalLocation').text() == '') {
							$modalContent
									.append('<button id="addLocation" class="modalButton">위치</button>');
						} else {
							locationExist();
						}
						$('#edit').html('완료');
						$('#edit').attr('id', 'edit-done');
					});
}

// 위치 값이 존재할 때 위치 버튼이 아니라 바로 맵이 뜨게 하는 함수
function locationExist() {
	$('#modalLocation')

	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			addMap(result[0].y, result[0].x);
			console.log(result[0].y, result[0].x);
		}
	};

	geocoder.addressSearch($('#modalLocation').text(), callback);
}

function addMap(lat, lng) {
	$('#modal-content').append(
			'<div id="map" style="width: 100%; height: 400px;"></div>')
	var options = {
		center : new kakao.maps.LatLng(lat, lng),
		level : 7
	};
	var $container = $('#map');
	var map = new kakao.maps.Map($container[0], options);
	marker.setMap(map);
	marker.setPosition(new kakao.maps.LatLng(lat, lng));
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		var clickXy = mouseEvent.latLng;
		var coord = new kakao.maps.LatLng(clickXy.Ha, clickXy.Ga);
		marker.setMap(map);
		marker.setPosition(new kakao.maps.LatLng(clickXy.Ha, clickXy.Ga));
		var callback = function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				address = result[0].address.address_name;
				$('#modalLocation').text(address);

			}
		};

		geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	});
}

var flag = false;
function sorting() {
	$("#memoul").sortable({
		start : function(e, ui) {
			flag = true;
			// creates a temporary attribute on the element with the old
			// index
			$(this).attr('data-previndex', ui.item.index() + 1);
		},
		update : function(e, ui) {
			if (flag != true)
				return;
			// gets the new and old index then removes the temporary
			// attribute
			var newIndex = ui.item.index() + 1;
			var oldIndex = $(this).attr('data-previndex');
			var element_id = ui.item.attr('id');
			var element_seq = ui.item.attr('id').replace('memoli', '');

			sortHandler(newIndex, oldIndex, element_seq);

			// console.log('id of Item moved = ' + element_id
			// + ' old position = ' + oldIndex
			// + ' new position = ' + newIndex);
			$(this).removeAttr('data-previndex');
			flag = false;
		}
	});
	$("#memoul").disableSelection();
}

function sortHandler(newIndex, oldIndex, elementId) {
	$.ajax({
		url : 'memoSortHandling',
		data : {
			memoOrder : newIndex,
			memoSeq : elementId,
			oldOrder : oldIndex
		}
	})
}
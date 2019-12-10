$(function() {

	// 모달 오픈 함수
	modalOpen();
	// 모달 클로즈 함수
	modalClose();
	// 사이드바 열고 닫는 함수들
	sidebarTop();
	sidebar();
	// 메뉴들 가져오는 함수(ajax)
	menuList();
	// 메뉴 순서 함수
	menuSort();
	// 메뉴 삽입 함수
	menuInsert();
	// 메뉴 삭제 함수
	deleteMenu();
	// 메뉴 수정 함수
	editMenuModal();
})

function editMenuModal() {
	$('#editMenu').on(
			'click',
			function() {
				// 아무 메뉴가 없을 경우 모달 띄우지 않음
				if ($('#accordionSidebar li').length == 0) {
					return;
				}
				// 옵션 모두 삭제
				$('#editMenuSelector').empty();
				// 모달 메뉴 전체 옵션 어펜드
				$('#accordionSidebar li').each(
						function() {
							$('#editMenuSelector').append(
									'<option value="' + this.id + '">'
											+ $(this).find('span').text()
											+ '</option>')
						})
				// 모달 창 띄움
				$('#editMenuModal').show();
			})
	// 모달 창 닫음
	$('#editMenuModalClose').on('click', function() {
		$('#editMenuModal').hide();
	})

	editMenuHandler();
}

function editMenuHandler() {
	$('#editConfirm').on(
			'click',
			function() {
				// 이름 유효성 체크
				if ($('#editName').val().trim() == '') {
					alert('메뉴 이름을 입력하세요')
					return;
				}
				// ajax로 정보처리
				$.ajax({
					url : 'editMenu',
					data : {
						menuId : $('#editMenuSelector').val(),
						menuName : $('#editName').val()
					},
					success : function() {
						// 동적으로 이름 변경
						$('#' + $('#editMenuSelector').val()).find('span')
								.text($('#editName').val());
						$('#editName').val('');
						console.log('edit success');
					}
				})
			})
}

function deleteMenu() {
	$('#deleteMenu').droppable({
		accept : '.nav-item',
		drop : function(event, ui) {
			flag = false;
			var $id = ui.draggable.attr("id");
			$.ajax({
				url : 'deleteMenu',
				data : {
					menuId : $id
				},
				success : function() {
					ui.draggable.remove();
					console.log('delete success');
				}
			});
		}
	})
}

// 메뉴 리스트 ajax 함수
function menuList() {
	$.ajax({
		url : 'menuList',
		dataType : 'json',
		success : function(data) {
			menuListHandler(data);

		}
	})
}

// 아이콘, 메뉴 링크 변수
var iconType, menuTypePage, menuId, menuName, menuIndex, menuTypenumber;
// 메뉴 리스트 동적으로 추가하는 함수
function menuListHandler(data) {
	for (i = 0; i < data.length; i++) {
		menuId = data[i].menuId;
		menuName = data[i].menuName;
		menuIndex = data[i].menuIndex;
		menuTypenumber = data[i].menuTypenumber;

		// 아이콘 설정
		iconSelector(menuTypenumber);
		// 메뉴 동적 추가
		addingMenuDynamically();

	}

}

function addingMenuDynamically() {
	$('#accordionSidebar').append(
			'<li class="nav-item" role="presentation" id="' + menuId
					+ '"><a class="nav-link active" href="' + menuTypePage
					+ '?menuId=' + menuId + '">' + iconType + '<span>'
					+ menuName + '</span></a></li>');
}

// 메뉴 타입에 따라 아이콘 변경하는 함수
function iconSelector(i) {
	if (i == 1)
		iconType = '<i class="far fa-calendar"></i>', menuTypePage = 'calendar';
	if (i == 2)
		iconType = '<i class="fas fa-sticky-note"></i>', menuTypePage = 'memo';
	if (i == 3)
		iconType = '<i class="fas fa-birthday-cake"></i>'; 
	if (i == 4)
		iconType = '<i class="fas fa-money-check"></i>';
	if (i == 5)
		iconType = '<i class="far fa-credit-card"></i>', menuTypePage = 'bankaccount';
	if (i == 6)
		iconType = '<i class="fas fa-tasks"></i>';
}
function modalOpen() {
	$('#addMenu').on('click', function() {
		$('#addMenuModal').show();
	})
}

function modalClose() {
	$('#addMenuModalClose').on('click', function() {
		$('#addMenuModal').hide();
	})
}

function sidebarTop() {
	$('#sidebarToggleTop').on('click', function() {
		$('#page-top').toggleClass('sidebar-toggled');
		$('#navigationBar').toggleClass('toggled');
	})
}

function sidebar() {
	$('#sidebarToggle').on('click', function() {
		$('#page-top').toggleClass('sidebar-toggled');
		$('#navigationBar').toggleClass('toggled');
	})
}

var flag = false;
function menuSort() {
	console.log('sort');
	$("#accordionSidebar").sortable(
			{
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

					menuSortHandler(newIndex, oldIndex, element_id);

					console.log('id of Item moved = ' + element_id
							+ ' old position = ' + oldIndex
							+ ' new position = ' + newIndex);
					$(this).removeAttr('data-previndex');
					flag = false;
				}
			});
	$("#accordionSidebar").disableSelection();
}

function menuSortHandler(newIndex, oldIndex, elementId) {
	$.ajax({
		url : 'menuSortHandling',
		data : {
			menuIndex : newIndex,
			menuId : elementId,
			oldOrder : oldIndex
		}
	})
}

function menuInsert() {

	$('#addConfirm').on('click', function() {
		var $menuName = $('#menuName').val().trim();
		var menuTypenumber = $('#menuType').val();
		if (menuName == '') {
			alert('메뉴 이름을 입력하세요');
			return;
		}

		$.ajax({
			url : 'insertMenu',
			data : {
				menuName : $menuName,
				menuTypenumber : menuTypenumber
			},
			dataType : 'json',
			success : function(data) {
				menuId = data, menuName = $menuName;
				iconSelector(menuTypenumber);
				addingMenuDynamically();
				$('#menuName').val('');
				$('#addMenuModal').hide();
			}
		})
	})
}
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

})

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
		if (!data[i].menuId.startsWith('KANG')) {
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
		iconType = '<i class="far fa-credit-card"></i>';
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

function menuSort() {
	console.log('sort');
	$("#accordionSidebar").sortable({
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
			console.log(element_id);
			// sortHandler(newIndex, oldIndex, element_seq);

			// console.log('id of Item moved = ' + element_id
			// + ' old position = ' + oldIndex
			// + ' new position = ' + newIndex);
			$(this).removeAttr('data-previndex');
			flag = false;
		}
	});
	$("#accordionSidebar").disableSelection();
}
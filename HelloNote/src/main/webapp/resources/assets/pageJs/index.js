$(function() {

	modalOpen();
	modalClose();
	sidebarTop();
	sidebar();
	menuList();

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
	console.log(data);
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
			'<li class="nav-item" role="presentation"><a class="nav-link active" href="'
					+ menuTypePage + '?menuId=' + menuId + '">' + iconType
					+ '<span>' + menuName + '</span></a></li>');
}

// 메뉴 타입에 따라 아이콘 변경하는 함수
function iconSelector(i) {
	console.log(i);
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
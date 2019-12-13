$(function() {
	// 위젯 드롭 함수
	widgetDropped();
	// 위젯 리스트 함수
	getWidgetList();
	// 위젯 삭제 함수
	widgetDeleteHolder();
})

// 위젯 드롭시 삭제
function widgetDeleteHolder() {
	$('#deleteHolder').droppable({
		accept : '.draggableWidget',
		drop : function(event, ui) {

			$.ajax({
				url : 'deleteWidget',
				data : {
					widgetsSeq : ui.draggable[0].id
				},
				success : function() {
					$(ui.draggable).remove();
				}
			})
		}
	})
}

// 위젯 데이터 가져오는 함수
function getWidgetList() {
	$.ajax({
		url : 'getWidgetList',
		dataType : 'json',
		success : function(data) {
			console.log(data)
			$(data).each(
					function() {
						// 위젯의 메뉴 타입을 가져옴
						var $mtn = this.menuTypeNumber
						// 위젯 데이터 담아줌
						var widgetData = this;
						console.log(this);
						// 위젯 타입에 따라 안의 내용을 ajax로 가져옴
						getWidgetContentByType(this.widgetsSeq, this.menuId,
								this.menuTypeNumber, this.xlocation,
								this.ylocation, this.zindex);
					})
		}
	})
}

// 화면 로드 시 위젯 타입에 따라 데이터 가져옴
// 위젯에 widgetsSeq는 id, menuId는 menuid attribute로 붙일 것
function getWidgetContentByType(widgetsSeq, menuId, menuTypeNumber, xlocation,
		ylocation, zindex) {
	if (menuTypeNumber == 9) {
		makeTranslateWidget(widgetsSeq, menuTypeNumber, xlocation, ylocation, zindex);
		return;
	}

	$.ajax({
		url : 'widgetContent',
		data : {
			menuTypeNumber : menuTypeNumber,
			menuId : menuId
		},
		dataType : 'json',
		success : function(data) {
			console.log(data);
			switch (parseInt(menuTypeNumber)) {
			case 2:
				makeMemoWidget(data, menuId, widgetsSeq, xlocation, ylocation, zindex);
				break;
			}
		}
	})
}

var flag = false;

// 메모 위젯 생성
function makeMemoWidget(data, menuId, widgetsSeq, xlocation, ylocation, zindex) {

	$(
			'<div class="grid-item"><a id="'
					+ widgetsSeq
					+ '" class="memo draggableWidget" menuid="'
					+ menuId
					+ '" style="left:'
					+ xlocation
					+ '; top:'
					+ ylocation
					+ '; z-index:'
					+ zindex
					+ '">  <div> <h3> </h3> </div> </a></div>').appendTo(
			'#widgetContainer').on('click', function() {
		if (!flag)
			location.href = 'memo?menuId=' + menuId;
	});

	$(data).each(function(){
		$('a#'+widgetsSeq+' div h3').append(this.MEMO_TITLE+'<br>');
	})
	
	widgetDraggable();
}

// 번역 위젯 생성
function makeTranslateWidget(widgetsSeq, menuTypeNumber, xlocation, ylocation, zindex) {
	$('#widgetContainer')
			.append(
					'<div style="width: 500px; height: 100px; left: '
							+ xlocation
							+ '; top: '
							+ ylocation
							+ '; z-index:'
							+ zindex
							+ '" menuTypeNumber="'
							+ menuTypeNumber
							+ '" class="draggableWidget grid-item" id="'
							+ widgetsSeq
							+ '"> <form><div class="table-responsive"> <table class="table table-bordered"> <thead> <tr> <th> <div> <select id="src_lang"> <option value="kr">한국어</option> <option value="en">영어</option> <option value="jp">일본어</option> <option value="cn">중국어</option> <option value="de">독일어</option> </select> </div> </th> <th> <div> <select id="target_lang"> <option value="kr">한국어</option> <option value="en" selected>영어</option> <option value="jp">일본어</option> <option value="cn">중국어</option> <option value="de">독일어</option> </select> </div> </th> </tr> </thead> <tbody> <tr> <td> <textarea class="form-control" rows="5" id="inputText" placeholder="Type Here">안녕하세요</textarea></td> <td> <textarea class="form-control" rows="5" id="outputText" name="outputText" ></textarea></td> </tr> </tbody> </table> <div align="right"> <input type="button" class="btn btn-dark" value="번역하기" id="translate"> </div> </div> </form>'
							+ '</div>');
	translatingMethod();
	widgetDraggable();
}

// 위젯 생성 함수
function widgetDropped() {
	$('#widgetContainer')
			.droppable(
					{
						accept : ".nav-item",
						drop : function(event, ui) {
							var $menuId = $(ui.draggable).attr('id');
							var $menuTypeNumber = $(ui.draggable).find('span')
									.attr('id');

							var check = true;
							// 이미 있는 위젯인지 체크
							$('.draggableWidget')
									.each(
											function() {
												if ($(this).attr('menuid') == $menuId
														|| $(this)
																.attr(
																		'menutypenumber') == $menuTypeNumber)
													check = false;
											});

							if (!check)
								return;

							$.ajax({
								url : 'insertWidget',
								data : {
									menuId : $menuId,
									menuTypeNumber : $menuTypeNumber
								},
								dataType : 'json',
								success : function(data) {
									getWidgetContentByType(data, $menuId,
											$menuTypeNumber, 0, 0, 1);
								}
							})

						}
					})
}

// 위젯 드래그 가능하게 하는 함수
function widgetDraggable() {
	// 위젯 드래그 가능
	$('#widgetContainer .draggableWidget').draggable(
			{
				// 위젯은 컨테이너 안에만 이동 가능
				containment : '#widgetContainer',
				start : function() {
					flag = true;
					$('#widgetContainer .draggableWidget').css('z-index', 1);
					$(this).css('z-index', 2);
					$.ajax({
						url : 'zIndexUpdate',
						data : {
							widgetsSeq : $(this).attr('id')
						}
					})
				},
				// 위젯 이동이 멈추면 이벤트 실행
				stop : function() {
					setTimeout(function() {
						flag = false;
					}, 100);

					updateWidgetPosition($(this).attr('id'), $(this)
							.css('left'), $(this).css('top'));

				}
			});
}

function updateWidgetPosition(i, x, y) {
	$.ajax({
		url : 'updateWidget',
		data : {
			widgetsSeq : i,
			xLocation : x,
			yLocation : y
		}
	})
}

// 번역 함수
function translatingMethod() {
	$('#translate').click(function() {
		var src_lang = document.getElementById('src_lang').value;
		var target_lang = document.getElementById('target_lang').value;
		var inputText = $('#inputText').val();
		console.log(src_lang);
		if (src_lang == target_lang) {
			window.alert("언어를 다르게 선택해주세요 ^.^")
		} else {
			$.ajax({
				method : "GET",
				url : "https://kapi.kakao.com/v1/translation/translate",
				data : {
					src_lang : src_lang,
					target_lang : target_lang,
					query : inputText
				},
				headers : {
					Authorization : "KakaoAK 1418cab94ef4e9c25e2f9a7f1a0541e4"
				}

			}).done(function(msg) {
				console.log(msg);
				console.log(msg.translated_text[0]);
				$('#outputText').val(msg.translated_text[0]);

			});

		}

	})
}
$(function() {
	// 위젯 드롭 함수
	// widgetDropped();
	// 위젯 리스트 함수
	getWidgetList();

})

// 위젯 데이터 가져오기 위한 변수
var widgetData;
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
						$mtn = this.menuTypeNumber
						// 위젯 데이터 담아줌
						widgetData = this;

						if ($mtn == 9) {
							makeTranslateWidget(this.menuId, $mtn,
									this.xLocation, this.yLocation);
						} else {
							// 위젯 타입에 따라 안의 내용을 ajax로 가져옴
							getWidgetContentByType();
						}

					})
		}
	})
}

function getWidgetContentByType() {
	$.ajax({
		url : 'widgetContent',
		data : {
			menuTypeNumber : widgetData.menuTypeNumber,
			menuId : widgetData.menuId
		},
		dataType : 'json',
		success : function(data) {
			console.log(data);
			switch (widgetData.menuTypeNumber) {
			case 2:
				makeMemoWidget(data);
				break;
			}
		}
	})
}

var flag = false;
// 메모 위젯 생성
function makeMemoWidget(data) {

	if (data.MEMO_PLACE == null) {
		data.MEMO_PLACE = '';
	}

	$(
			'<a id="'
					+ widgetData.menuId
					+ '" class="memo draggableWidget"'
					// +' href="memo?menuId='
					// + data.MENU_ID
					// + '"'
					+ '> <div class="title-box"> <h3 class="title">'
					+ data.MEMO_TITLE
					+ '</h3> </div> <div class="text-box"> <p class="text">'
					+ data.MEMO_TEXT
					+ '</p> </div> <div class="location-box"> <p id="location${list.memoSeq}" class="text">'
					+ data.MEMO_PLACE + '</p> </div> </a>').appendTo(
			'#widgetContainer').on('click', function() {
		if (!flag)
			location.href = 'memo?menuId=' + data.MENU_ID;
	});

	widgetDraggable();
}

// 번역 위젯 생성
function makeTranslateWidget(widgetId, widgetMenuType) {
	$('#widgetContainer')
			.append(
					'<div style="width: 500px; height: 100px;" class="draggableWidget" id="'
							+ widgetId
							+ '"> <form><div class="table-responsive"> <table class="table table-bordered"> <thead> <tr> <th> <div> <select id="src_lang"> <option value="kr">한국어</option> <option value="en">영어</option> <option value="jp">일본어</option> <option value="cn">중국어</option> <option value="de">독일어</option> </select> </div> </th> <th> <div> <select id="target_lang"> <option value="kr">한국어</option> <option value="en" selected>영어</option> <option value="jp">일본어</option> <option value="cn">중국어</option> <option value="de">독일어</option> </select> </div> </th> </tr> </thead> <tbody> <tr> <td> <textarea class="form-control" rows="5" id="inputText" placeholder="Type Here">안녕하세요</textarea></td> <td> <textarea class="form-control" rows="5" id="outputText" name="outputText" ></textarea></td> </tr> </tbody> </table> <div align="right"> <input type="button" class="btn btn-dark" value="번역하기" id="translate"> </div> </div> </form>'
							+ '<input type="hidden" id="widgetMenuType" value="'
							+ widgetMenuType + '"> </div>');
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
							$spanId = $(ui.draggable).find('span').attr('id');

							if ($spanId == '9') {
								if ($('#widgetContainer').find('#translate')
										.attr('id') == null) {
									makeTranslateWidget();
								}
							} else if ($spanId == '') {

							} else {
								$('#widgetContainer')
										.append(
												'<div style="width: 100px; height: 100px; background-color: black;" class="draggableWidget"></div>');

							}

						}
					})
}

// 위젯 드래그 가능하게 하는 함수
function widgetDraggable() {
	// 위젯 드래그 가능
	$('#widgetContainer .draggableWidget').draggable({
		// 위젯은 컨테이너 안에만 이동 가능
		containment : '#widgetContainer',
		start : function() {
			flag = true;
		},
		// 위젯 이동이 멈추면 이벤트 실행
		stop : function() {
			setTimeout(function(){
				flag = false;
			}, 100);
			console.log($(this).css('left'));
		}
	});
}

// 번역 함수
function translatingMethod() {
	$('#translate').click(function() {
		console.log('tr')
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
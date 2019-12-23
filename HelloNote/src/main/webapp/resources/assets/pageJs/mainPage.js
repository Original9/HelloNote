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
			$(data).each(
					function() {
						// 위젯의 메뉴 타입을 가져옴
						var $mtn = this.menuTypeNumber
						// 위젯 데이터 담아줌
						var widgetData = this;
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
		makeTranslateWidget(widgetsSeq, menuTypeNumber, xlocation, ylocation,
				zindex);
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
			switch (parseInt(menuTypeNumber)) {
			case 1:
				makeCalendarWidget(data, menuId, widgetsSeq, xlocation,
						ylocation, zindex);
				break;
			case 2:
				makeMemoWidget(data, menuId, widgetsSeq, xlocation, ylocation,
						zindex);
				break;

			case 4:
				makeAccountBook(data, menuId, widgetsSeq, xlocation, ylocation,
						zindex);
				break;

			case 6:
				makeCheckList(data, menuId, widgetsSeq, xlocation, ylocation,
						zindex);
				break;

			case 8:
				makeMySite(data, menuId, widgetsSeq, xlocation, ylocation,
						zindex);
				break;
			}
		}
	})
}

// 체크 리스트 위젯 생성 함수
function makeCheckList(data, menuId, widgetsSeq, xlocation, ylocation, zindex) {
	$('#widgetContainer')
			.append(
					'<div id="'
							+ widgetsSeq
							+ '" menuid="'
							+ menuId
							+ '" style="width : 400px;  position: absolute; left: '
							+ xlocation
							+ '; top: '
							+ ylocation
							+ '; z-index: '
							+ zindex
							+ '; " class="shadow draggableWidget"> <div class="card-header py-3"> <h6 class="text-primary font-weight-bold m-0">Todo List</h6> </div> <ul class="list-group list-group-flush" style="list-style-type: none;"> </ul> </div>');

	if (data.length == 0) {
		$('#widgetContainer div#' + widgetsSeq)
				.find('ul')
				.append(
						'<li style="margin-left: 10px; margin-bottom: 10px; margin-top: 10px"><strong>Nothing to do</strong></li>');
	}

	$(data)
			.each(
					function(i) {
						var checkData = this;
						$('#widgetContainer div#' + widgetsSeq)
								.find('ul')
								.append(
										'<li style="margin-left: 10px;" checklistseq="'
												+ checkData.CHECKLIST_SEQ
												+ '"><div class="custom-control custom-checkbox" style="display: inline;"><input class="custom-control-input" type="checkbox" id="formCheck-'
												+ i
												+ '"><label class="custom-control-label" for="formCheck-'
												+ i + '"> </label></div>'
												+ checkData.CHECKLIST_MISSION
												+ '</li>');
					});
	widgetDraggable();
	checkUpdate($('#widgetContainer div#' + widgetsSeq));
}

function checkUpdate(widgetItem) {
	$(widgetItem).find('input').on(
			'click',
			function() {

				var $menuId = parseInt($(this).parent().parent().parent()
						.parent().attr('menuid'));

				var $checkListSeq = parseInt($(this).parent().parent().attr(
						'checklistseq'));
				$.ajax({
					url : 'widgetCheckListUpdate',
					data : {
						checklistSeq : $checkListSeq,
						menuId : $menuId
					},
					success : function() {
						console.log('checklist update success');
					}
				})
			})
}

// 아이디 위젯 생성 함수
function makeMySite(data, menuId, widgetsSeq, xlocation, ylocation, zindex) {

	$('#widgetContainer')
			.append(
					'<div id="'
							+ widgetsSeq
							+ '" menuid="'
							+ menuId
							+ '" class="draggableWidget" style="position: absolute; width: 500px; left: '
							+ xlocation
							+ '; top: '
							+ ylocation
							+ '; z-index: '
							+ zindex
							+ '; "><div class="shadow-lg o-hidden border-0 my-5"> <h3 class="card-header d-flex justify-content-between align-items-center"> Site List</h3> <div class="card-body" id="accordion" role="tablist" aria-multiselectable="true"> <div class="panel"> <!-- content --> </div> </div> </div>');
	$(data)
			.each(
					function(i) {
						$('#widgetContainer #' + widgetsSeq)
								.find('.panel')
								.append(
										'<div class="panel-heading" role="tab" id="heading'
												+ i
												+ '"> <h4 class="panel-title"> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse'
												+ i
												+ '" aria-expanded="true" aria-controls="collapse'
												+ i
												+ '"> '
												+ this.SITE_ADDR
												+ ' </a> <button type="button" class="p-1 btn btn-primary btn-xs" id="goButton'
												+ i
												+ '">GO</button> </h4> </div> <div id="collapse'
												+ i
												+ '" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading'
												+ i
												+ '"> <div class="panel-body">'
												+'ID:'
												+ this.SITE_ID +"&nbsp;&nbsp;"+ ' PW:'
												+ this.SITE_PW
												+ '</div> </div>');
						var siteData = this;
						$('#goButton' + i).on(
								'click',
								function() {
									window.open(siteData.SITE_ADDR,
											'_blank');
								});
					})
	widgetDraggable();
}

// 가계부 위젯 생성 함수
function makeAccountBook(data, menuId, widgetsSeq, xlocation, ylocation, zindex) {

	$('#widgetContainer')
			.append(
					'<div id="'
							+ widgetsSeq
							+ '" class="draggableWidget" style="position: absolute; left : '
							+ xlocation + '; top: ' + ylocation + '; z-index: '
							+ zindex
							+ '; height: 200px; width: 300px" menuid="'
							+ menuId + '" align="center"></div>');

	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ],
		callback : function() {
			drawChart(data, widgetsSeq);
		}

	});

	widgetDraggable();
}

// 차트 그려주는 함수 개같은거
function drawChart(data, widgetsSeq) {
	var options = {
		// 크기 조절 및 배경색상, 배경색은 우리 프로젝트 색상으로 맞춰놓음
		title : '항목 통계',
		width : 600,
		height : 500,
		backgroundColor : '#f8f9fc'
	};

	// 차트에 넣을 data를 ajax 요청해서 가져옴
	// ajax결과를 chart에 맞는 data 형태로 가공
	var chartData = [];
	chartData.push([ '항목', '비율' ])
	// 차트에 표시하기 위한 항목과 퍼센트
	for (i = 0; i < data.length; i++) {
		var subarr = [ data[i].ACCOUNTBOOK_PURPOSE, (data[i].ACCOUNTBOOK_PERCENT) ];
		chartData.push(subarr);
	}
	// 챠트 그리기
	var chart = new google.visualization.PieChart($('#widgetContainer div#'
			+ widgetsSeq)[0]); // <--
	// piechart
	// 차트로
	// 그려서
	// 생성
	chart.draw(google.visualization.arrayToDataTable(chartData), options);
}

// 캘린더 위젯 생성 함수
function makeCalendarWidget(data, menuId, widgetsSeq, xlocation, ylocation,
		zindex) {
	$(
			'<div id="'
					+ widgetsSeq
					+ '" class="draggableWidget" menuid="'
					+ menuId
					+ '" style=" position: absolute; width : 162px; left : '
					+ xlocation
					+ '; top : '
					+ ylocation
					+ '; z-index : '
					+ zindex
					+ '; "><div id="wrapper"> <div class="row"> <div class="col"> <div class="shadow mb-3"> <div class="card-header py-3" style="width:500px;"> <p class="text-primary m-0 font-weight-bold">오늘 일정</p> </div> <div class="card-body"> <div class="form-row"> <div class="col"> <div class="form-group"><label for="username"></label></div> </div> </div> <div class="form-group"><button class="btn btn-primary btn-sm">캘린더 바로가기</button></div> </div> </div> </div> </div> </div></div>')
			.appendTo('#widgetContainer');

	$('#widgetContainer #' + widgetsSeq).find('button').on('click', function() {
		window.location.href = 'calendar?menuId=' + menuId;
	})
	$(data).each(
			function() {
				$('#widgetContainer #' + widgetsSeq).find('label').append(
						'<div><strong>' + this.TITLE + '</strong><div>');
			})
	$('#widgetContainer #' + widgetsSeq).find('label').not(':has(strong)')
			.append('<strong>오늘 일정은 없습니다.</strong>');
	widgetDraggable();
}

var flag = false;

// 메모 위젯 생성
function makeMemoWidget(data, menuId, widgetsSeq, xlocation, ylocation, zindex) {

	$(
			'<a id="' + widgetsSeq + '" class="memo draggableWidget" menuid="'
					+ menuId + '" style="position:absolute; left:' + xlocation
					+ '; top:' + ylocation + '; z-index:' + zindex
					+ '">  <div class="text-box"> </div> </a>').appendTo(
			'#widgetContainer').on('click', function() {
		if (!flag)
			location.href = 'memo?menuId=' + menuId;
	});

	$(data).each(function() {
		$('a#' + widgetsSeq + ' div').append('<h5>' + this.MEMO_TITLE + '</h5>');
	})

	widgetDraggable();
}

// 번역 위젯 생성
function makeTranslateWidget(widgetsSeq, menuTypeNumber, xlocation, ylocation,
		zindex) {
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

// for commit

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
																		'menutypenumber') == $menuTypeNumber
														|| $menuId == 7
														|| $menuId == 3
														|| $menuId == 5
														|| $menuTypeNumber == 10)
													check = false;
											});

							if (!check) {
								return;
							}

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

// 위젯 위치 업데이트
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
				$('#outputText').val(msg.translated_text[0]);

			});

		}

	})
}
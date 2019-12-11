$(function() {
	// 위젯 드롭 함수
//	widgetDropped();
	// 위젯 리스트 함수
	getWidgetList();

})

function getWidgetList(){
	$.ajax({
		url : 'getWidgetList',
		dataType : 'json',
		success : function(data){
			$(data).each(function(){
				// 위젯의 타입을 가져옴
				$mtn = this.menuTypeNumber
				
			})
		}
	})
}

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
									$('#widgetContainer')
											.append(
													'<div style="width: 500px; height: 100px;" class="draggableWidget"> <form><div class="table-responsive"> <table class="table table-bordered"> <thead> <tr> <th> <div> <select id="src_lang"> <option value="kr">한국어</option> <option value="en">영어</option> <option value="jp">일본어</option> <option value="cn">중국어</option> <option value="de">독일어</option> </select> </div> </th> <th> <div> <select id="target_lang"> <option value="kr">한국어</option> <option value="en" selected>영어</option> <option value="jp">일본어</option> <option value="cn">중국어</option> <option value="de">독일어</option> </select> </div> </th> </tr> </thead> <tbody> <tr> <td> <textarea class="form-control" rows="5" id="inputText" placeholder="Type Here">안녕하세요</textarea></td> <td> <textarea class="form-control" rows="5" id="outputText" name="outputText" ></textarea></td> </tr> </tbody> </table> <div align="right"> <input type="button" class="btn btn-dark" value="번역하기" id="translate"> </div> </div> </form>'
													+'<input type="hidden" id="widgetMenuType" value="'+
													$spanId+'"> </div>');
									translatingMethod();
								}
							} else if ($spanId == '') {

							} else {
								$('#widgetContainer')
										.append(
												'<div style="width: 100px; height: 100px; background-color: black;" class="draggableWidget"></div>');

							}
							// 위젯 드래그 가능
							$('#widgetContainer .draggableWidget').draggable({
								// 위젯은 컨테이너 안에만 이동 가능
								containment : '#widgetContainer',
								// 위젯 이동이 멈추면 이벤트 실행
								stop : function(){
									console.log($(this).css('left'));
								}
							});
						}
					})
}

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
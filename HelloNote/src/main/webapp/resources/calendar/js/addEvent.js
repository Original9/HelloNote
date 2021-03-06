var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) { // 이 함수는 언제 시작하는지 

	
	
    $("#contextMenu").hide(); // Date 클릭시 dropdown menu

    modalTitle.html('새로운 일정');
    
    
   
    editTitle.val(' '); // 안먹음   
    editDesc.val(' '); // 안먹음
    editStart.val(start);
    editEnd.val(end);
    editType.val(eventType).prop("selected", true); //prop() 지정한 선택자를 가진 첫번번째 요소의 속성값을 가져오거나 속성값을 추가합니다. 

    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    
    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind(); // .unbind()를 사용하여 요소의 모든 이벤트의 바인딩을 해제합니다. 
    $('#save-event').on('click', function () {

        var eventData = {
            _id: eventId, // DB 아이디 아직 설정안해서 temp값 넣어준다.
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            username: '나', // 필요없는값
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false
        };
    	var eventData1 = {
                "calendarSeq": eventId, // DB 아이디 아직 설정안해서 temp값 넣어준다.// DB에 넣어줄떄 알아서 계산해서 여기서 아무값이나 그대로 둔거임
                "title": editTitle.val(),
                "startDate": editStart.val(),
                "endDate": editEnd.val(),
                "description": editDesc.val(),
                "type": editType.val(),
                "userName": '사나', // 필요없는값 controller 에서 session 값 받아서 다시 넣는다.
                "backgroundColor": editColor.val(),
                "textColor": '#ffffff',                 
                "allDay": false
            };
    	console.log(eventData);
        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다!');
            return false;
        }

        if (eventData.title === '') {
        	console.log("!!!!!");
            alert('일정명은 필수입니다!');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 // 79라인까지 화면에 자동으로 등록해주고 나는 DB에만 넣으면 된다.
        $.ajax({ // 데이터 받아서 그냥 디비에 넣으면 끝인거 같고 
            type: "post",
            url: context_path+"/addCalendar",
            dataType:'json',
           // contentType: 'application/json',
            data: eventData1  //JSON.parse(eventData)//JSON.stringify(eventData).serializeObject()            //..... db 연동시 
            ,
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};
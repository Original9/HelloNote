/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {
	
	
	// 변경하기전 calendarSeq 값을 받아외야한다.
     var calendarSeq;
    $.ajax({
        type: "post",
        url: "getCalendarSeq",
        data: {"title":event.title,"startDate":event.start.format('YYYY-MM-DD HH:mm')
            //...
        },
        success: function (response) {        	
        	calendarSeq=response;
        	
        }
    });


    $('.popover.fade.top').remove();
    $(element).popover("hide");    

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show'); // modal이 hide되면 이 함수는 아무것도 리턴하지말고 이 함수를 빠져나와야한다.

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind(); // 이벤트 해제
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }
        
        eventModal.modal('hide');

        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();

        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
            type: "post",
            url: "updateCalendar",
            data: {"calendarSeq":calendarSeq,"allDay":event.allDay,"title":event.title,"startDate":event.start,"endDate":event.end,"type":event.type,"backgroundColor":event.backgroundColor,"description":event.description
                //...
            },
            success: function (response) {
                alert('수정되었습니다.')
                editTitle.val(" ");    
                editDesc.val(" ");
            }
        });

    });

    
    // 삭제버튼
    $('#deleteEvent').unbind(); // 이벤트를 제거하고 다시 실행해야한다.
    $('#deleteEvent').on('click', function () {
        $("#calendar").fullCalendar('removeEvents', [event._id]);
        eventModal.modal('hide');
        //삭세버튼을 누르면 title 값과 시작날짜를 넘겨서 삭제힌디.
        var title =  editTitle.val();
        var startDate = editStart.val();
       
        //삭제시
        $.ajax({
            type: "post",
            url: "deleteCalendar",
            data: {"title":title,"startDate":startDate
                //Json값으로 넘김
            },
            success: function (response) {
                alert('삭제되었습니다.');
                editTitle.val(" ");    
                editDesc.val(" ");
            }
        });
    });
    
    
};
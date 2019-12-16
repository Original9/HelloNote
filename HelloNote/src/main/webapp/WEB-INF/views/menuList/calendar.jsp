<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>


	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
<!--     <link rel=" shortcut icon" href="image/favicon.ico">-->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/css/bootstrap.min.css"> --%>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/css/fullcalendar.min.css" />
    <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/calendar/css/select2.min.css' />
    <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/calendar/css/bootstrap-datetimepicker.min.css' />
    <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/css/main.css">
    <link hef="${pageContext.request.contextPath}/resources/assets/css/mainFont.css" rel="stylesheet" type="text/css">
    	 
    <script src="<c:url value="/resources/assets/js/json.min.js"/>"></script>	 
    
    
	</head>

<body>
    <h4>session hellonoteId: "${hellonoteId}" session pw: "${pw}"</h4>
    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">★★★★</a></li>
                <li><a tabindex="-1" href="#">★★★</a></li>
                <li><a tabindex="-1" href="#">★★</a></li>
                <li><a tabindex="-1" href="#">★</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div> <!-- 여기 안에 소스 찾아가야하는데.. -->
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style='width:290px;' >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title"><p>제목&nbsp;&nbsp;</p></label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-5" for="edit-start"><p>시작&nbsp;&nbsp;</p> </label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end"><p>종료&nbsp;&nbsp;</p></label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type"><P>구분&nbsp;&nbsp;</P></label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type"  style='width:160px;'>
                                    <option value="카테고리1">★★★★</option>
                                    <option value="카테고리2">★★★</option>
                                    <option value="카테고리3">★★</option>
                                    <option value="카테고리4">★</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color"><p>색상 &nbsp;</p></label>
                                <select class="inputModal" name="color" id="edit-color" style='width:160px;'>
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                        	
                            <div class="col-xs-12">
                                <textarea rows="4" cols="80" class="inputModal" name="edit-desc" id="edit-desc" style='width:205px'></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <!-- <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>  -->

             <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">★중요도 구분★</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="카테고리1">★★★★</option>
                            <option value="카테고리2">★★★</option>
                            <option value="카테고리3">★★</option>
                            <option value="카테고리4">★</option>
                        </select>
                    </div>
                </div>

				<!-- 필요없는 부분이라서 display:none을 해두었다. -->
                <div class="col-lg-6" style="display:none" > 
                    <label for="calendar_view"></label>
                    <div class="input-group">
                         <label class="checkbox-inline"><input class='filter' type="checkbox" value="나"
                                checked>정연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>다현</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사나</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>나연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>지효</label> 
                    </div>
                </div>

            </div> 
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
	<script src="<c:url value="/resources/calendar/js/moment.min.js"/>"></script>	 
	<script src="<c:url value="/resources/calendar/js/fullcalendar.min.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/ko.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/select2.min.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/bootstrap-datetimepicker.min.js"/>"></script>	
	<script src="<c:url value="/resources/calendar/js/main.js"/>"></script> 
	<script src="<c:url value="/resources/calendar/js/addEvent.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/editEvent.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/etcSetting.js"/>"></script>
	
	
</body>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>


	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
<!--     <link rel=" shortcut icon" href="image/favicon.ico">-->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/css/bootstrap.min.css"> --%>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/css/fullcalendar.min.css" />
    <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/calendar/css/select2.min.css' />
    <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/calendar/css/bootstrap-datetimepicker.min.css' />
    <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/css/main.css">
    <link hef="${pageContext.request.contextPath}/resources/assets/css/mainFont.css" rel="stylesheet" type="text/css">
    	 
    <script src="<c:url value="/resources/assets/js/json.min.js"/>"></script>	 
    
    
	</head>

<body>
    <h4>session hellonoteId: "${hellonoteId}" session pw: "${pw}"</h4>
    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">★★★★</a></li>
                <li><a tabindex="-1" href="#">★★★</a></li>
                <li><a tabindex="-1" href="#">★★</a></li>
                <li><a tabindex="-1" href="#">★</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div> <!-- 여기 안에 소스 찾아가야하는데.. -->
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">★★★★</option>
                                    <option value="카테고리2">★★★</option>
                                    <option value="카테고리3">★★</option>
                                    <option value="카테고리4">★</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                        	
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label><br>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc" id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <!-- <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>  -->

             <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">★중요도 구분★</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="카테고리1">★★★★</option>
                            <option value="카테고리2">★★★</option>
                            <option value="카테고리3">★★</option>
                            <option value="카테고리4">★</option>
                        </select>
                    </div>
                </div>

				<!-- 필요없는 부분이라서 display:none을 해두었다. -->
                <div class="col-lg-6" style="display:none" > 
                    <label for="calendar_view"></label>
                    <div class="input-group">
                         <label class="checkbox-inline"><input class='filter' type="checkbox" value="나"
                                checked>정연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>다현</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사나</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>나연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>지효</label> 
                    </div>
                </div>

            </div> 
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
	<script src="<c:url value="/resources/calendar/js/moment.min.js"/>"></script>	 
	<script src="<c:url value="/resources/calendar/js/fullcalendar.min.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/ko.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/select2.min.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/bootstrap-datetimepicker.min.js"/>"></script>	
	<script src="<c:url value="/resources/calendar/js/main.js"/>"></script> 
	<script src="<c:url value="/resources/calendar/js/addEvent.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/editEvent.js"/>"></script>
	<script src="<c:url value="/resources/calendar/js/etcSetting.js"/>"></script>
	
	
</body>

>>>>>>> branch 'master' of https://github.com/Original9/HelloNote.git
</html>
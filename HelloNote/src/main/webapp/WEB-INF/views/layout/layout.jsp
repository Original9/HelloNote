<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript">
 var context_path = "${pageContext.request.contextPath}";
</script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Dashboard - Brand</title>
<!-- 메인폰트    -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/mainFont.css"/>">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/memo.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script
	src="<c:url value="/resources/assets/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/assets/pageJs/index.js"/>"></script>
<link href="<c:url value="/resources/assets/css/index.css"/>"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<%-- <script src="<c:url value="/resources/assets/js/chart.min.js"/>"></script> --%>
<!-- <script -->
<%--    src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"/>"></script> --%>
<%-- <script src="<c:url value="/resources/assets/js/theme.js"/>"></script> --%>
</head>

<body id="page-top" class="sidebar-toggled">
	<div id="wrapper">
		<nav
			class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0 toggled"
			id="navigationBar">
			<div class="container-fluid d-flex flex-column navi1">
				<a
					class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0"
					href="${pageContext.request.contextPath}/main">
					<div class="sidebar-brand-icon rotate-n-15">
						<i class="fas fa-clipboard"></i>
					</div>
					<div class="sidebar-brand-text mx-3">
						<span>Hello Note</span>
					</div>
				</a>
				<hr class="sidebar-divider my-0">
				<ul class="nav navbar-nav text-light" id="accordionSidebar">
					<!--                <li class="nav-item" role="presentation"><a -->
					<!--                   class="nav-link active" href="index.html"><i -->
					<!--                      class="fas fa-tachometer-alt"></i><span> D-DAY</span></a></li> -->
					<!--                <li class="nav-item" role="presentation"><a -->
					<!--                   class="nav-link active" -->
					<%--                   href="${pageContext.request.contextPath}/menuList/calendar"><i --%>
					<!--                      class="fas fa-tachometer-alt"></i><span> CALENDAR</span></a></li> -->
					<!--                <li class="nav-item" role="presentation"><a -->
					<!--                   class="nav-link active" href="index.html"><i -->
					<!--                      class="fas fa-tachometer-alt"></i><span> BANKACCOUNT</span></a></li> -->
					<!--                <li class="nav-item" role="presentation"><a -->
					<!--                   class="nav-link active" href="index.html"><i -->
					<!--                      class="fas fa-tachometer-alt"></i><span> CHECKLIST</span></a></li> -->
					<!--                <li class="nav-item" role="presentation"><a -->
					<!--                   class="nav-link active" -->
					<%--                   href="${pageContext.request.contextPath}/mysite/getMySiteList"><i --%>
					<!--                      class="fas fa-tachometer-alt"></i><span> MYSITELIST</span></a></li> -->
					<!--                <li class="nav-item" role="presentation"><a -->
					<!--                   class="nav-link active" href="index.html"><i -->
					<!--                      class="fas fa-tachometer-alt"></i><span> Dashboard</span></a></li> -->
					<!--                <li class="nav-item" role="presentation"><a -->
					<!--                   class="nav-link active" href="index.html"><i -->
					<!--                      class="fas fa-tachometer-alt"></i><span> Dashboard</span></a></li> -->
					<!--                <li class="nav-item" role="presentation"><a -->
					<!--                   class="nav-link active" -->
					<%--                   href="${pageContext.request.contextPath}/menuList/accountBook"><i --%>
					<!--                      class="fas fa-tachometer-alt"></i><span> AccountBook </span></a></li> -->
				</ul>
				<ul class="nav navbar-nav text-light">
					<li class="nav-item defaultMenu" role="presentation"><a
						class="nav-link active"
						href="${pageContext.request.contextPath}/translate"><i
							class="fas fa-language"></i><span id="9">번역기</span></a></li>
					<li class="nav-item defaultMenu" role="presentation"><a
						class="nav-link active"
						href="${pageContext.request.contextPath}/news"><i
							class="fas fa-newspaper"></i><span id="10">뉴스</span></a></li>
					<li class="nav-item defaultMenu" role="presentation"><a
						class="nav-link active"
						href="${pageContext.request.contextPath}/recipe"><i
							class="fas fa-utensils"></i><span id="10">레시피</span></a></li>
				</ul>
				<div class="text-center d-none d-md-inline">
					<button class="btn rounded-circle border-0" id="sidebarToggle"
						type="button"></button>
				</div>
				<div height="500px"></div>
				<br> <br> <br> <i class="fas fa-plus-square fa-3x"
					id="addMenu"></i> <i class="fas fa-trash fa-3x" id="deleteMenu"></i><i
					class="fas fa-edit fa-3x" id="editMenu"></i>
			</div>
		</nav>
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">
				<nav
					class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle mr-3"
							id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						<form
							class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
							<div class="input-group">
								<input class="bg-light form-control border-0 small" type="text"
									placeholder="Search for ...">
								<div class="input-group-append">
									<button class="btn btn-primary py-0" type="button">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</div>
						</form>
						<ul class="nav navbar-nav flex-nowrap ml-auto">
							<li class="nav-item dropdown d-sm-none no-arrow"><a
								class="dropdown-toggle nav-link" data-toggle="dropdown"
								aria-expanded="false" href="#"><i class="fas fa-search"></i></a>
								<div
									class="dropdown-menu dropdown-menu-right p-3 animated--grow-in"
									role="menu" aria-labelledby="searchDropdown">
									<form class="form-inline mr-auto navbar-search w-100">
										<div class="input-group">
											<input class="bg-light form-control border-0 small"
												type="text" placeholder="Search for ...">
											<div class="input-group-append">
												<button class="btn btn-primary py-0" type="button">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</form>
								</div></li>
							<li class="nav-item dropdown no-arrow mx-1" role="presentation">
								<div class="nav-item dropdown no-arrow">
									<button class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false" type="button">
										<span class="badge badge-danger badge-counter"></span><i
											class="fas fa-bell fa-fw"></i>
									</button>
									<div
										class="dropdown-menu dropdown-menu-right dropdown-list dropdown-menu-right animated--grow-in"
										role="menu">
										<h1 class="dropdown-header">계산기</h1>
										<a class="d-flex align-items-center dropdown-item" href="#">
											<div class="mr-3">
												<table height=250 width=250 align=center cellpadding="0">
													<tr>
														<td colspan=5 align=center><input type="textarea"
															id="showText" style="width: 100%; height: 100%;"
															onkeydown="calculateEnterkey();"></td>
													</tr>

													<tr>
														<td colspan=3 align=center><input type="button"
															id="clearBtn" onclick=clearAll() value="clr"
															style="width: 100%; height: 100%;"></td>
														<td colspan=2 align=left><input type="button"
															id="equal" onclick=getResult() value="="
															style="width: 100%; height: 100%;"></td>
													</tr>

													<tr>
														<th align=center><input type=button id=1 value=1
															onclick=selectedBtn(1) style="width: 100%; height: 100%;"></th>
														<th align=center><input type=button id=2 value=2
															onclick=selectedBtn(2) style="width: 100%; height: 100%;"></th>
														<th align=center><input type=button id=3 value=3
															onclick=selectedBtn(3) style="width: 100%; height: 100%;"></th>
														<th align=center><input type=button id=plus value=+
															onclick=selectedOp("+")
															style="width: 100%; height: 100%;"></th>
														<th align=left><input type=button id=square value=x^y
															onclick=selectedOp('^')
															style="width: 100%; height: 100%;"></th>
													</tr>

													<tr>
														<td align=center><input type=button id=4 value=4
															onclick=selectedBtn(4) style="width: 100%; height: 100%;"></td>
														<td align=center><input type=button id=5 value=5
															onclick=selectedBtn(5) style="width: 100%; height: 100%;"></td>
														<td align=center><input type=button id=6 value=6
															onclick=selectedBtn(6) style="width: 100%; height: 100%;"></td>
														<td align=center><input type=button id=minus
															value="-" onclick=selectedOp('-')
															style="width: 100%; height: 100%;"></td>
														<td align=left><input type=button id=sin value="sin"
															onclick=mathText('_sin')
															style="width: 100%; height: 100%;"></td>
													</tr>
													<tr>
														<td align=center><input type=button id=7 value=7
															onclick=selectedBtn(7) style="width: 100%; height: 100%;"></td>
														<td align=center><input type=button id=8 value=8
															onclick=selectedBtn(8) style="width: 100%; height: 100%;"></td>
														<td align=center><input type=button id=9 value=9
															onclick=selectedBtn(9) style="width: 100%; height: 100%;"></td>
														<td align=center><input type=button id=multi value=*
															onclick=selectedOp('*')
															style="width: 100%; height: 100%;"></td>
														<td align=left><input type=button id=cos value=cos
															onclick=mathText("_cos")
															style="width: 100%; height: 100%;"></td>
													</tr>
													<tr>
														<td align=center><input type=button id=0 value=0
															onclick=selectedBtn(0) style="width: 100%; height: 100%;"></td>
														<td align=center><input type=button id="plusNMinus"
															value=" " onclick=changeSign()
															style="width: 100%; height: 100%;"></td>
														<td align=center><input type=button id=dot value="."
															onclick=selectedBtn('.')
															style="width: 100%; height: 100%;"></td>
														<td align=center><input type=button id=divide
															value="/" onclick=selectedOp('/')
															style="width: 100%; height: 100%;"></td>
														<td align=left><input type=button id=tan value="tan"
															onclick=mathText('_tan')
															style="width: 100%; height: 100%;"></td>
													</tr>
												</table>
											</div>
										</a> <a class="text-center dropdown-item small text-gray-500"
											href="#">Calcuate</a>
									</div>
								</div>
							</li>
							<li class="nav-item dropdown no-arrow mx-1" role="presentation">
								<div class="nav-item dropdown no-arrow">
									<button class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false" type="button"
										onclick="chatButton()">
										<i class="fas fa-envelope fa-fw"></i><span
											class="badge badge-danger badge-counter">new</span>
									</button>
									<div
										class="dropdown-menu dropdown-menu-right dropdown-list dropdown-menu-right animated--grow-in"
										role="menu">
										<h6 class="dropdown-header">회원간 실시간 채팅</h6>
										<div>
											<div id="chatWindow" style="overflow-y: auto; height: 500px">
											</div>
											<textarea rows="2" cols="41" placeholder="메세지를 입력하세요"
												id="inputMessage" onkeyup="enterkey();"></textarea>
											<br> <input id="sendMsg" type="button"
												class="btn btn-primary" value="send" onclick="send()"
												style="width: 310px; height: 50px">

											<textarea id="messageWindow" rows="2" cols="50"
												readonly="readonly" style="display: none"></textarea>

										</div>

										<a class="text-center dropdown-item small text-gray-500"
											href="#">Show All Chatting</a>
									</div>
								</div>
								<div
									class="shadow dropdown-list dropdown-menu dropdown-menu-right"
									aria-labelledby="alertsDropdown"></div>
							</li>
							<div class="d-none d-sm-block topbar-divider"></div>
							<li class="nav-item dropdown no-arrow" role="presentation">
								<div class="nav-item dropdown no-arrow">
									<button class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false" type="button">
										<span class="d-none d-lg-inline mr-2 text-white-600 small"><sec:authentication
												property='principal.hellonoteId' /> </span><img
											class="border rounded-circle img-profile" style="width: 35px"
											src="<c:url value="/resources/assets/img/user/"/>/<sec:authentication property='principal.profileImg' />">
									</button>
									<div
										class="dropdown-menu shadow dropdown-menu-right animated--grow-in"
										role="menu">
										<a class="dropdown-item" role="presentation"
											onclick="location.href='getProfile'"><i
											class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a>
										<sec:authorize access="hasAuthority('M')">
											<a class="dropdown-item" role="presentation"
												onclick="location.href='getUserList'"> <i
												class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;UserList
											</a>
										</sec:authorize>

										<!--    <a class="dropdown-item" role="presentation" href="#"><i
                                 class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Activity
                                 log</a> -->
										<div class="dropdown-divider"></div>
										<form action="logout" method="post">
											<a class="dropdown-item" role="presentation" type="submit"
												onclick="location.href='logout'"><i
												class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a>
										</form>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</nav>
				<div class="container-fluid">
					<!-- tiles body add -->
					<tiles:insertAttribute name="body" />
				</div>
			</div>
			<footer class="bg-white sticky-footer" style="display: flex">
				<div class="container my-auto">
					<div class="text-center my-auto copyright">
						<span>Copyright © Brand 2019</span>
					</div>
				</div>
			</footer>
		</div>
		<a id="pageTop" class="border rounded d-inline scroll-to-top" href="#page-top"><i
			class="fas fa-angle-up"></i></a>
	</div>
	<div class="modal" id="addMenuModal" style="z-index: 6;">
		<div class="modal-content" id="addMenumodalConent">
			<tableborder'0'>
			<tr>
				<th><font color="black">메뉴추가</font></th>
				<th><span class="close" id="addMenuModalClose"
					style="margin-left: auto; margin-right: 0; width: 30px;">&times;</span>
				</th>
			</tr>
			</table>
			<hr>
			<div>
				<input placeholder="메뉴 이름" type="text" class="menuName"
					id="menuName" name="menuName">
			</div>
			<div>
				<select class="menuType" name="menuType" id="menuType">
					<option value="1">캘린더</option>
					<option value="2">메모</option>
					<option value="4">가계부</option>
					<option value="6">체크리스트</option>
					<option value="8">사이트관리</option>
				</select>
			</div>
			<div align="right">
				<button id="addConfirm" class="btn btn-primary addConfirm">추가</button>
			</div>
		</div>
	</div>
	<!-- 채팅 관련 script -->
	<script type="text/javascript">
      var textarea = document.getElementById("messageWindow");
      //var webSocket = new WebSocket('ws://localhost/app/BroadcastingServer');
      var webSocket = new WebSocket('wss://39.116.34.40:8443/hellonote/chat.do');
      //var webSocket = new WebSocket('ws://localhost/hellonote/chat.do');
      var inputMessage = document.getElementById('inputMessage');
      
      function enterkey() {
           if (window.event.keyCode == 13) {
    
                // 엔터키가 눌렸을 때 실행할 내용
               send();
           }
      }


      

      function chatButton() {

         textarea.value = "";
         $('#chatWindow').empty();
         msg = {

            fromId : "${hellonoteId}"

         };

         $
               .ajax({
                  type : "post",
                  url : "${pageContext.request.contextPath}/chatList",
                  dataType : "json",
                  data : msg,
                  success : function(response) {
                     var chatList = response;
                     var sessionId = "${hellonoteId}";
                     console.log(sessionId);

                     var id = "<sec:authentication property='principal.hellonoteId' />";
                     console.log(id);
                     for (var i = 0; i < chatList.length; i++) {
                        if (chatList[i].fromId == id) {// from_id 사용자 ID일시 사용자가 보낸 메세지다.

                           $('#chatWindow')
                                 .append(
                                       "<a class='d-flex align-items-center dropdown-item' >"
                                             + "<div class='font-weight-bold' style='float:right;'>"
                                             + "<div style='width:260px; word-wrap:break-word; text-align:right;'>"
                                             + chatList[i].chatContent
                                             + "\n"
                                             + "</div>"
                                             + "</div>"
                                             + "<p class='small text-gray-500 mb-0' style='text-align:right;'>"
                                             + chatList[i].chatTime
                                             + "</p>" + "</div>"
                                             + "</a>");
                        } else {
                           $('#chatWindow')
                                 .append(
                                       "<a class='d-flex align-items-center dropdown-item'>"
                                             + "<div class='dropdown-list-image mr-3' style='float:left'>"
                                             + " <img class='rounded-circle' src=<c:url value='/resources/assets/img/user/"+chatList[i].fromId+"_profileimg.png'/> "
                                             +"onerror=\"this.src=\'/hellonote/resources/assets/img/user/defaultImage.jpeg\'\">"
                                             + "<div class='bg-success status-indicator'></div>"
                                             + "</div>"
                                             + "<div class='font-weight-bold'>"
                                             + "<div style='width:280px; word-wrap:break-word;'>"
                                             + chatList[i].fromId
                                             + ": "
                                             + chatList[i].chatContent
                                             + "\n"
                                             + "</div>"
                                             + "</div style='float:left'>"
                                             + "<p class='small text-gray-500 mb-0'>"
                                             + chatList[i].chatTime
                                             + "</p>" + "</div>"
                                             + "</a>");

                        }

                     }
                     chatAreaScroll();

                  }
               });
      }
      webSocket.onerror = function(event) {
         onError(event)
      };
      webSocket.onopen = function(event) {
         onOpen(event)
      };
      webSocket.onmessage = function(event) {
         onMessage(event)
      };

      function onMessage(event) { //지금 받은 메세지는 다 왼쪽에 출력시키고 있다. 내가 보낸 메세지도 받나 
         var result = JSON.parse(event.data);
         console.log(result);
         var id = "<sec:authentication property='principal.hellonoteId' />";
         if (result.cmd == 'msg' && result.fromId != id) { // fromid 가 내가 아닐때 출력해야한다. 
            console.log(result);
            $('#chatWindow')
                  .append(
                        "<a class='d-flex align-items-center dropdown-item'>"
                              + "<div class='dropdown-list-image mr-3' style='float:left'>"
                              + " <img class='rounded-circle' src=<c:url value='/resources/assets/img/user/"+result.fromId+"_profileimg.png'/> "
                              +"onerror=\"this.src=\'/hellonote/resources/assets/img/user/defaultImage.jpeg\'\">"
                              + "<div class='bg-success status-indicator'></div>"
                              + "</div>"
                              + "<div class='font-weight-bold'>"
                              + "<div class='text-truncate'>"
                              + "<div style='width:280px; word-wrap:break-word;'>"
                              + result.fromId+": "+result.chatContent
                              + "\n"
                              + "</div>"
                              + "</div>"
                              + "<p class='small text-gray-500 mb-0'>"
                              + result.chatTime + "</p>" + "</div>"
                              + "</a>");
         }

         chatAreaScroll();
      }

      function onOpen(event) {
         textarea.value += "연결 성공\n";
      }
      function onError(event) {
         console.log(event);
         alert(event.data);
      }
      function send() { // 저장 할때는 여기서 ajax호출해서 값을 넣어줘야한다.
         let today = new Date();
         let year = today.getFullYear();
         let month = today.getMonth() + 1;
         let date = today.getDate();
         let hour = today.getHours();
         let min = today.getMinutes();
         let sec = today.getSeconds();
         var id = "<sec:authentication property='principal.hellonoteId' />";
         msg = {
            fromId : id,
            toId : "all",
            chatContent : inputMessage.value,
            chatTime : year + "-" + month + "-" + date + " " + hour + ":"
                  + min + ":" + sec,
            cmd : "msg"
         };

         $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/insertChat",
            dataType : "json",
            data : msg,
            success : function(response) {
            }
         });

         $('#chatWindow')
               .append(
                     "<a class='d-flex align-items-center dropdown-item' >"
                           + "<div class='font-weight-bold' style='float:right;'>"
                           + "<div style='width:260px; word-wrap:break-word; text-align:right;'>"
                           + msg.chatContent
                           + "\n"
                           + "</div>"
                           + "</div>"
                           + "<p class='small text-gray-500 mb-0' style='text-align:right;'>"
                           + year + "-" + month + "-" + date + " "
                           + hour + ":" + min + ":" + sec + "</p>"
                           + "</div>" + "</a>");
         webSocket.send(JSON.stringify(msg));
         inputMessage.value = "";

         chatAreaScroll();
      }

      function getBoard() {
         msg = {
            cmd : "board",
            id : "",
            msg : ""
         }
         webSocket.send(JSON.stringify(msg));

      }

      function chatAreaScroll() {
         //using jquery
         /* var textArea = $('#messageWindow');
         textArea.scrollTop( textArea[0].scrollHeight - textArea.height() );
         textArea.scrollTop( textArea[0].scrollHeight); */
         //using javascript
         var textarea = document.getElementById('messageWindow');
         textarea.scrollTop = textarea.scrollHeight;

         var chatarea = document.getElementById('chatWindow');
         chatarea.scrollTop = chatWindow.scrollHeight;
      }
   </script>



	<div class="modal" id="editMenuModal" style="z-index: 6;">
		<div class="modal-content" id="editMenuModalConent">
			<table>
				<tr>
					<th><font color="black">메뉴수정</font></th>
					<th><span class="close" id="editMenuModalClose"
						style="margin-left: auto; margin-right: 0; width: 30px;">&times;</span>
					</th>
				</tr>
			</table>
			<hr>
			<select id="editMenuSelector" class="menuType"></select> <input
				type="text" placeholder="메뉴 이름" class="menuName" id="editName">
			<div align="right">
				<button id="editConfirm" class="btn btn-primary addConfirm">수정</button>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/assets/pageJs/calculate.js"/>"></script>
</body>

</html>
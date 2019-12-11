<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Draggable - Constrain movement</title>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.draggable {
   width: 150px;
   height: 150px;
   padding: 0.5em;
   float: left;
   margin: 0 10px 10px 0;
}

#draggable, #draggable2 {
   margin-bottom: 20px;
}

#draggable {
   cursor: n-resize;
}

#draggable2 {
   cursor: e-resize;
}

#containment-wrapper {
   width: 100%;
   height: 1000px;
   border: 2px solid #ccc;
   padding: 10px;
}

h3 {
   clear: left;
}
</style>



</head>

<body>
<form action="logout" method="post">
  <button>로그아웃</button>
</form>

   <!-- 로그인 정보 print -->
   <sec:authentication property="principal.hellonoteId" />
   <br>
   <sec:authentication property="principal.pw" />
   <br>
   <sec:authentication property="principal.hGrant" />
   <br>
   <sec:authorize access="isAuthenticated()">
   로그인 중
   </sec:authorize>
   <!-- admin 권한만 보이게 -->
   <sec:authorize access="hasAuthority('M')">
      <button type="button" onclick="location.href='admin/getUserList'">버튼이보이면 ADMIN 이다~ 누르면 유저리스트로 간다</button>
   </sec:authorize>
   <!-- admin 권한만 보이게 -->
   <h2>접속 ID: "${hellonoteId}" 접속 pw: "${pw}"</h2>
   <h3>
      Widgets Moving<input type='button' id="addWidgets" value='버튼1' />
   </h3>
   <div id="containment-wrapper">

      <div id="draggable1" class="draggable ui-widget-content">
         <p>I'm contained within the box</p>
      </div>


      <div id="draggable2" class="draggable ui-widget-content">
         <p>I'm contained within the box</p>
      </div>




   </div>


</body>
<script>
   // aja로 사용자가 가지고 있는 widgets 목록에서 위젯들 불러오고 화면에 뿌려준다.

   $("#addWidgets")
         .click(
               function() { // 위젯 아이디를 div id로 넣고 script에도 id 값으로 넣는다.
                  var add = $(
                        '<div id="draggable3" class="draggable ui-widget-content" >')
                        .html('<p>test</p>');
                  add.draggable({
                     containment : "#containment-wrapper",
                     scroll : true
                  });
                  $('#containment-wrapper').append(add);
               });

   $(function() {
      $("#draggable1").draggable({
         containment : "#containment-wrapper",
         scroll : true
      });
      $("#draggable2").draggable({
         containment : "#containment-wrapper",
         scroll : true
      });

   })
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 	값 가져오는 SQL QUERY -->
<!-- 		 SELECT CHECKLIST_SEQ checklist_Seq, -->
<!-- 					CHECKLIST_STATUS , -->
<!-- 					CHECKLIST_MISSION , -->
<!-- 					MENU_ID  -->
<!-- 				FROM (SELECT CHECKLIST_SEQ, -->
<!-- 						CHECKLIST_STATUS , -->
<!-- 						CHECKLIST_MISSION , -->
<%-- 						MENU_ID  FROM ${hellonoteId}_check  --%>
<!-- 						order by CHECKLIST_SEQ DESC) -->
		 <![CDATA[ where rownum <=5]]>   
<!-- 		and CHECKLIST_STATUS = 'f'  -->
	
<!-- 			삭제쿼리 -->
<!--  		sqlquery -->
<%--  		DELETE ${hellonoteId}_check --%>
<%--  		WHERE CHECKLIST_SEQ = #{checklistSeq} --%>

<!-- 			업데이트쿼리 -->
<%-- 			 		UPDATE ${hellonoteId}_check --%>
<!--  		SET -->
<%--  		CHECKLIST_STATUS = #{checklistStatus} --%>
<%--  		WHERE checklist_seq = #{checklistSeq} --%>

<body>
	<table class="table_layout">
		<colgroup>
			<col width="50%">
			<col width="50%">
			<col width="50%">
		</colgroup>
		<thead>
			
		</thead>
		<tr>
			<td>
				<div class="card shadow mb-4" style="width: 1000">
					<div class="card-header py-3">
						<h6 class="text-primary font-weight-bold m-0">Todo List</h6>
					</div>
					<ul class="list-group list-group-flush">
<!-- 						<li class="list-group-item"><div id="checkItem1" -->
<!-- 								class="row align-items-center no-gutters"> -->
<!-- 								<div class="row align-items-center no-gutters" -->
<!-- 									style="width: 70%"> -->
<!-- 									<div class="col-auto"> -->
<!-- 										<div class="custom-control custom-checkbox"> -->
<!-- 											<input class="custom-control-input" type="checkbox" -->
<!-- 												id="formCheck-1"><label class="custom-control-label" -->
<!-- 												for="formCheck-1"> </label> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-8" id="댕댕콘"> -->
<!-- 										<strong>댕댕콘</strong> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="col-3" align="right"> -->
<!-- 									<input class="btn btn-primary" id="deleteCheckList1" -->
<!-- 										type="button" value="삭제"> -->
<!-- 								</div> -->
<!-- 							</div></li> -->


<!-- 이런식으로 들어갈 예쩡 -->
					</ul>

				</div>
			</td>


		</tr>

	</table>


	<script type="text/javascript">
		$(document).ready(function() {//시작하자마자 getCheckList5 함수 호출해서
			getCheckList() //내가 해야할것을 가져온다.
		});

		function getCheckList() {
			$.ajax({
				url : 'getCheckListT5', //맨위에 쿼리있음
				type : 'GET',
				//contentType:'application/json;charset=utf-8',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : appendCheckList
			});
		}

		//체크리스트 추가
		function appendCheckList(data) {
			//체크리스트초기화
			$(".list-group").empty();

			$.each(data,
							function(idx, name) {

								$('.list-group')
										.append(
												'<li class="list-group-item"><div id="checkItem'
							+ data[idx].checklistSeq
							+ '" class="row align-items-center no-gutters"><div class="row align-items-center no-gutters" style="width:70%">'
														+ '<div class="col-auto"><div class="custom-control custom-checkbox"><input class="custom-control-input" type="checkbox" id="formCheck-'
							+ data[idx].checklistSeq
							+ '"><label class="custom-control-label" for="formCheck-'
							+ data[idx].checklistSeq
							+'"> </label></div></div>'
														+ '<div class="col-8" id="'
							+ data[idx].checklistMission+ data[idx].checklistSeq
							+ '"><strong>'
							+ data[idx].checklistMission
							+ '</strong></h6></div>'
							+ '</div>'
							+ '<div class="col-3" align="right"><input class="btn btn-primary" id="deleteCheckList'
							+data[idx].checklistSeq
							+'" type="button" value="삭제"></div>'
														+ '</li>')

								//삭제버튼처리
								var delbutton = $('#deleteCheckList'
										+ data[idx].checklistSeq);
								delbutton.on("click", function(e) {
									deleteCheck(data[idx].checklistSeq); //삭제이벤트 발생
								});
								delbutton.hide();
								$('#checkItem'+data[idx].checklistSeq).mouseenter(function(){
									delbutton.show();
									
								});
								$('#checkItem'+data[idx].checklistSeq).mouseleave(function(){
									delbutton.hide();
								});
								
								
								//체크박스 가져오기
								var strcheckbox = $('#formCheck-'
										+ data[idx].checklistSeq);
								//체크박스 db에서의 값 넣어주기
								if (data[idx].checklistStatus != "f") {
									strcheckbox.prop("checked", true);
									var xline=$('#'+data[idx].checklistMission+ data[idx].checklistSeq);
									xline.prop('style').textDecoration="line-through wavy #24bffb";
								}
								
								//체크박스 이벤트 걸어서 클릭시 db에 업데이트 하기
								strcheckbox
										.on(
												"click",
												function(e) {
													var ischecked = strcheckbox
															.is(":checked") == true;
													updateCheck(
															data[idx].checklistSeq,
															ischecked,data[idx].checklistMission) //클릭시 체크박스 업데이트 이벤트발생.
				
												});
												
							});
		}

		function deleteCheck(seq){
			$.ajax({
				url : "deleteChecklist", //삭제쿼리 위에있음.
				method : 'DELETE',
				dataType : 'json',
				data : JSON.stringify({
					checklistSeq : seq
				}),
				contentType : 'application/json',
				success : getCheckList
			});
		}
		

		function updateCheck(seq, ischecked,checklistMission) {
			var tf; //db에 들어가는 값.
			var xline=$('#'+checklistMission+ seq);
			if (ischecked) {
				tf = "t";
				xline.prop('style').textDecoration="line-through wavy #24bffb";
			} else {
				tf = "f";
				xline.prop('style').textDecoration="";
			}

			$.ajax({
				url : "updateChecklist", //업데이트쿼리 위에있음.
				method : 'PUT',
				dataType : 'json',
				data : JSON.stringify({
					checklistSeq : seq,
					checklistStatus : tf,
				}),
				contentType : 'application/json'
			});
		}


	</script>



</body>

</html>
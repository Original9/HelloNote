<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 	값 가져오는 SQL QUERY -->
		SELECT 	CHECKLIST_SEQ checklist_Seq,
				CHECKLIST_STATUS ,
				CHECKLIST_MISSION ,
				MENU_ID 
		FROM 	(SELECT 	CHECKLIST_SEQ,
							CHECKLIST_STATUS ,
							CHECKLIST_MISSION ,
							MENU_ID  
				FROM 		${hellonoteId}_check 
				ORDER BY 	CHECKLIST_SEQ DESC)
		WHERE 	<![CDATA[ rownum <=5]]>   
		AND 	CHECKLIST_STATUS = 'f'
		AND		MENU_ID = #{menuId}
<body>
	<table class="table_layout">
		<colgroup>
			<col width="50%">
			<col width="50%">
			<col width="50%">
		</colgroup>
		<thead> 
			<tr>
				<th>
					<div class="card shadow mb-4" style="width: 1000">
						<div class="card-header py-3">
							<h6 class="text-primary font-weight-bold m-0">Todo List</h6>
						</div>
						<ul class="list-group list-group-flush">
						</ul>

					</div>

				</th>
			</tr>
		</thead>

	</table>


	<script type="text/javascript">
		$(document).ready(function() { //시작하자마자 getCheckList 함수 호출해서 ㄱ
			getCheckList() //내가 해야할것을 가져온다.
		});
		function getCheckList() { //controller에서 getCheckList url로가서 호출한다.
			$.ajax({
				url : 'getCheckListT5',
				type : 'GET',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : appendCheckList
			//성공시에 함수호출해서 .list-group에 데이터 주입한다.
			});
		}
		
		
		
		//체크리스트 추가
		function appendCheckList(data) { //data에 vo타입에 있는 seq하고 mission, 체크여부를 대입시켜줌.
			//체크리스트초기화
			$(".list-group").empty();
			$
					.each(
							data,
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
							+ data[idx].checklistMission
							+ '"><strong>'
														+ data[idx].checklistMission
														+ '</strong></h6></div>'
														+ '</div>' + '</li>')
								//체크박스 가져오기
								var strcheckbox = $('#formCheck-'
										+ data[idx].checklistSeq);
								//체크박스 db에서의 값 넣어주기
								if (data[idx].checklistStatus != "f") {
									strcheckbox.prop("checked", true);
								}
								
							});

		}
		
		function deleteCheck(seq){
			$.ajax({
				url : "deleteChecklist",
				method : 'DELETE',
				dataType : 'json',
				data : JSON.stringify({
					checklistSeq : seq
				}),
				contentType : 'application/json',
				success : getCheckList
			});
		}
		//sqlquery
// 		DELETE ${hellonoteId}_check
// 		WHERE CHECKLIST_SEQ = #{checklistSeq}
		
		
		function updateCheck(seq, ischecked) {
			var tf;
			if (ischecked) {
				tf = "t";
			} else {
				tf = "f";
			}

			$.ajax({
				url : "updateChecklist",
				method : 'PUT',
				dataType : 'json',
				data : JSON.stringify({
					checklistSeq : seq,
					checklistStatus : tf,
				}),
				contentType : 'application/json'
			});

		}
		//sqlquery
// 		UPDATE ${hellonoteId}_check
// 		SET
// 		CHECKLIST_STATUS = #{checklistStatus}
// 		WHERE checklist_seq = #{checklistSeq}

		
	</script>



</body>


</html>
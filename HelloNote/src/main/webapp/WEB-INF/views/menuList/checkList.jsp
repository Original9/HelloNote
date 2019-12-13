<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<form action="insertCheckList">
						<div class="form-row">
							<div class="col">
								<input class="form-control" id="submittext" style="width: 700px">
							</div>
							<div class="col" align="right">
								<input class="btn btn-primary" id="submitCheckList"
									type="button" value="추가">
							</div>
						</div>


						<!-- 					<p align="right"> -->
						<!-- 						<input class="btn btn-primary" id="submitCheckList" type="button" -->
						<!-- 							value="추가"> -->
						<!-- 					</p> -->
					</form>

				</th>
			</tr>
		</thead>
		<tr>
			<!-- 			<th> -->
			<!-- 				<form action="insertCheckList"> -->
			<!-- 					<p> -->
			<!-- 						<input class="form-control" id="submittext" style="width: 260px"> -->
			<!-- 						&nbsp;&nbsp;&nbsp; <input class="btn btn-primary" -->
			<!-- 							id="submitCheckList" type="button" value="추가"> -->
			<!-- 					</p> -->

			<!-- 										<p align="right"> -->
			<!-- 											<input class="btn btn-primary" id="submitCheckList" type="button" -->
			<!-- 												value="추가"> -->
			<!-- 										</p> -->
			<!-- 				</form> -->

			<!-- 			</th> -->

			<td>
				<div class="card shadow mb-4" style="width: 1000">
					<div class="card-header py-3">
						<h6 class="text-primary font-weight-bold m-0">Todo List</h6>
					</div>
					<ul class="list-group list-group-flush">
						<!-- 					<li class="list-group-item"> -->
						<!-- 							<div class="row align-items-center no-gutters"> -->
						<!-- 								<div class="col mr-2"> -->
						<!-- 									<h6 class="mb-0"> -->
						<!-- 										<strong>점심 미팅</strong> -->
						<!-- 									</h6> -->
						<!-- 									                                        <span class="text-xs">10:30 AM</span> -->
						<!-- 								</div> -->
						<!-- 								<div class="col-auto"> -->
						<!-- 									<div class="custom-control custom-checkbox"> -->
						<!-- 										<input class="custom-control-input" type="checkbox" checked="checked" -->
						<!-- 											id="formCheck-1"><label class="custom-control-label" -->
						<!-- 											for="formCheck-1"></label> -->
						<!-- 									</div> -->
						<!-- 								</div> -->
						<!-- 							</div> -->
						<!-- 						</li> -->
					</ul>

				</div>
			</td>


		</tr>

	</table>


	<script type="text/javascript">
		$(document).ready(function() {
			getCheckList() //내가 해야할것을 가져온다.
		});

		function getCheckList() {
			$.ajax({
				url : 'getCheckList',
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
							+ data[idx].checklistMission
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

									deleteCheck(data[idx].checklistSeq);

								});
								
								//체크박스 가져오기
								var strcheckbox = $('#formCheck-'
										+ data[idx].checklistSeq);
								//체크박스 db에서의 값 넣어주기
								if (data[idx].checklistStatus != "f") {
									strcheckbox.prop("checked", true);
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
															ischecked)

													alert(strcheckbox
															.is(":checked") == true);//체크되어있는지 없는지 확인				
												})

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

		$(document).on("click", "#submitCheckList", function(e) {
			var valuetext = $('#submittext').val();
			if (valuetext) {
				//db에 추가
				$.ajax({
					url : "insertList",
					method : 'post',
					dataType : 'json',
					data : JSON.stringify({
						checklistMission : valuetext,
						checklistStatus : "f",
					}),
					contentType : 'application/json',
					success : getCheckList
				});

			} else {
				alert('입력누락');
			}
		});

// 		//체크리스트 수정
// 		function mySiteUpdate() {
// 			// 수정 버튼 클릭
// 			$('#updatebutton').on('click', function() {
// 				var title = $('#UpdForm input:text[name="title"]').val();
// 				var siteAddr = $('#UpdForm input:text[name="siteAddr"]').val();
// 				var siteId = $('#UpdForm input:text[name="siteId"]').val();
// 				var sitePw = $('#UpdForm input[name="sitePw"]').val();
// 				var siteMemo = $('#UpdForm textarea[name="siteMemo"]').val();
// 				var mySiteSeq = $('#dele #mySiteSeq').val();

// 				$.ajax({
// 					url : "updateMySite",
// 					method : 'PUT',
// 					dataType : 'json',
// 					data : JSON.stringify({
// 						title : title,
// 						siteAddr : siteAddr,
// 						siteId : siteId,
// 						sitePw : sitePw,
// 						siteMemo : siteMemo,
// 						mySiteSeq : mySiteSeq
// 					}),
// 					contentType : 'application/json',
// 					success : getCheckList
// 				});
// 			});
// 		}
	</script>



</body>

</html>
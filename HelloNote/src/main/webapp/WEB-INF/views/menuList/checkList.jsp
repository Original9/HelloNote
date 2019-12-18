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
					<ul class="list-group list-group-flush" id="sortable">
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
					</ul>

				</div>
			</td>


		</tr>

	</table>


	<script type="text/javascript">
		$(document).ready(function() {
			getCheckList() //내가 해야할것을 가져온다.
			submitCheck()//추가버튼 눌렀을때 추가하는 이벤트.
			sorting(); //정렬처리.
		});

		/*------------------------------------------------
		//목록조회.
		------------------------------------------------*/
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

		/*------------------------------------------------
		//목록조회 콜백.
		------------------------------------------------*/
		function appendCheckList(data) {
			//체크리스트초기화
			$(".list-group").empty();

			$.each(data,function(idx, name) {

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
							+ '"><input type="text" class="form-control" name="updatetxt-'
							+data[idx].checklistSeq
							+'" value='
							+data[idx].checklistMission
							+' style="display: none;"> <strong>'
														+ data[idx].checklistMission
														+ '</strong></h6></div>'
														+ '</div>'
														+ '<div class="col-1" align="right"><input class="btn btn-primary" id="deleteCheckList'
							+data[idx].checklistSeq
							+'" type="button" value="삭제"></div>'
														+ '<div class="col-1" align="right"><input class="btn btn-primary" id="uptxtCheckList'
							+data[idx].checklistSeq
							+'" type="button" value="수정"></div></div>'
														+ '</li>')

							var delbutton = $('#deleteCheckList'+ data[idx].checklistSeq);
							var strcheckbox = $('#formCheck-'+ data[idx].checklistSeq);
							var uptxtbutton = $('#uptxtCheckList'+ data[idx].checklistSeq);
							var box = $('#checkItem'+ data[idx].checklistSeq);
							var inputtxt = $('[name=updatetxt-'+ data[idx].checklistSeq + ']');
							var strongStr = box.find('strong');

								//삭제버튼처리
								delbutton.on("click", function(e) {
									deleteCheck(data[idx].checklistSeq);
								});

								$('#checkItem' + data[idx].checklistSeq)
										.mouseenter(function() {
											delbutton.show();

										});
								$('#checkItem' + data[idx].checklistSeq)
										.mouseleave(function() {
											delbutton.hide();
										});

								//체크박스 db에서의 값 넣어주기
								if (data[idx].checklistStatus != "f") {
									strcheckbox.prop("checked", true);
									var xline = $('#'
											+ data[idx].checklistMission
											+ data[idx].checklistSeq);
									xline.prop('style').textDecoration = "line-through wavy #24bffb";
								}

								//체크박스 이벤트 걸어서 클릭시 db에 업데이트 하기
								strcheckbox.on("click",
										function(e) {
											var ischecked = strcheckbox.is(":checked") == true;
											updateCheck(data[idx].checklistSeq,
													ischecked,
													data[idx].checklistMission,
													data[idx].checklistMission)

										});

								//더블클릭시 input창 나오고 엔터나 수정버튼 클릭시 수정.
								box.dblclick(function() {
									inputtxt.show(); //텍스트
									strongStr.hide();
									inputtxt.focus();
									uptxtbutton.show();
									delbutton.show();	
									inputtxt.val(strongStr[0].innerText);
								});
								
								
								inputtxt.focusout(function(e) {
  									inputtxt.hide();
 									strongStr.show();
									uptxtbutton.hide();
									delbutton.hide();
								})

								box.on("click",uptxtbutton,
												function(e) {
													var ischecked = strcheckbox
															.is(":checked") == true;
													updateCheck(
															data[idx].checklistSeq,
															ischecked,
															inputtxt.val(),
															data[idx].checklistMission);
													strongStr[0].innerText = inputtxt.val();
												})
								inputtxt.keypress(function(e) {
											if (e.key == "Enter") {
												updateCheck(
														data[idx].checklistSeq,
														strcheckbox
																.is(":checked") == true,
														inputtxt.val(),
														data[idx].checklistMission); //data[idx].checklistMission locaion

												strongStr[0].innerText = inputtxt.val();
											
											}
										})

								//기본 화면설정
								inputtxt.hide();
								strongStr.show();
								uptxtbutton.hide();
								delbutton.hide();

			});//end of $.each

		}//end of function appendCheckList

		/*------------------------------------------------
		//삭제요청.
		------------------------------------------------*/
		function deleteCheck(seq) {
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
		
		
		/*------------------------------------------------
		//수정요청.
		------------------------------------------------*/
		function updateCheck(seq, ischecked, mission, loc) {
			var tf; //db에 들어가는 값.
			var xline = $('#' + loc + seq);
			if (ischecked) {
				tf = "t";
				xline.prop('style').textDecoration = "line-through wavy #24bffb";
			} else {
				tf = "f";
				xline.prop('style').textDecoration = "";
			}

			$.ajax({
				url : "updateChecklist",
				method : 'PUT',
				dataType : 'json',
				data : JSON.stringify({
					checklistSeq : seq,
					checklistStatus : tf,
					checklistMission : mission
				}),
				contentType : 'application/json'
			});
		}
		
		/*------------------------------------------------
		//등록요청.
		------------------------------------------------*/
		function submitCheck(){
			$('#submitCheckList').on("click",  function(e) {
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
		}

		
		/*------------------------------------------------
		//메모순서 정렬.
		------------------------------------------------*/
		function sorting() {
			$("#sortable").sortable(
							{

								start : function(e, ui) {
									flag = true;
									// creates a temporary attribute on the element with the old
									// index
									$(this).attr('data-previndex',
											ui.item.index() + 1);
								},
								update : function(e, ui) {
									if (flag != true)
										return;
									// gets the new and old index then removes the temporary
									// attribute
									var newIndex = ui.item.index() + 1;
									var oldIndex = $(this).attr(
											'data-previndex');
									// 					var element_id = ui.item.attr('id');
									var element_seq = ui.item.children().attr(
											'id').replace('checkItem', '')
									oldIndex = parseInt(oldIndex);
									element_seq = parseInt(element_seq);
									sortHandler(newIndex, oldIndex, element_seq);

									// console.log('id of Item moved = ' + element_id
									// + ' old position = ' + oldIndex
									// + ' new position = ' + newIndex);
									$(this).removeAttr('data-previndex');
									flag = false;
								}
							});
			$("#sortable").disableSelection();
		};

		/*------------------------------------------------
		//메모순서 핸들러.
		------------------------------------------------*/
		function sortHandler(newIndex, oldIndex, elementId) {
			$.ajax({
				url : 'checkSortHandling',
				data : {
					checklistOrder : newIndex,
					checklistSeq : elementId,
					oldOrder : oldIndex
				}
			})
		}
	</script>



</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- select title from kang_calendar where sysdate between start_date and end_date and menu_id =2;  
	title 컬럼을 list로 받아와서 아래에 오늘은 프로젝트하는 날입니가 여기에 append로 넣으면 됨 (id 값은 알아서 정하셈) -->

<body id="page-top">
	<div id="wrapper">

		<div class="row">
			<div class="col">
				<div class="card shadow mb-3">
					<div class="card-header py-3">
						<p class="text-primary m-0 font-weight-bold">오늘 일정</p>
					</div>
					<div class="card-body">
						<form>
							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="username"><strong>*오늘은 프로젝트를 하는
												날입니다 *</strong></label>
									</div>
								</div>

							</div>

							<div class="form-group">
								<button class="btn btn-primary btn-sm" type="submit">캘린더
									바로가기</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>

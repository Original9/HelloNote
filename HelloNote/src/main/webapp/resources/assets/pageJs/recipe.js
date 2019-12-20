$(function() {
	recipeSearch();
	recipeModal();
	recipeMenuInsert();
	
	// for commit
})

// 레시피 재료 체크 리스트에 담아주는 함수
function recipeMenuInsert(){
	// 버튼 클릭 시 run
	$('#recipeMenuInsert').on('click', function(){
		// 메뉴 선택 안하면 함수 안 돌아가게
		if($('#recipeMenuSelector').val() == ""){
			alert('담을 메뉴를 선택 해주세요');
			return;
		}
		// 배열 선언
		var ingredient = new Array();
		// 배열 각각 인덱스 삽입 
		$('#divConfirmedMaterialArea ul li').each(function(i){
			ingredient[i] = $(this).text();
		})
		
		// ajax로 insert
		$.ajax({
			url : 'recipeMenuInsert',
			data : {
				'ingredientList' : ingredient,
				menuId : parseInt($('#recipeMenuSelector').val())
			},
			success : function(){
				// 성공 시 alert
				alert('재료를 체크리스트 담았습니다');
			}
		})
	})
}

// 레시피 검색
function recipeSearch() {
	// 레시피 검색 ajax
	$('#recipeSearch').on(
			'click',
			function() {
				$('#recipeSearchResult').empty();
				$.ajax({
					url : 'recipeSearch',
					data : {
						// 레시피 검색어 파라미터 설정
						recipeKeyword : $('#recipeKeyword').val()
					},
					success : function(data) {
						// 레시피 검색 결과 붙이기
						$('#recipeSearchResult').append(data.list);

//						$('#recipeSearchResult').find('a')
//								.each(
//										function() {
//											// 사이트 링크 번호를 따와 div의 attribute로 설정
//											$(this).parent().attr(
//													'siteid',
//													$(this).attr('href').split(
//															'/')[2]);
//											// div에 스타일을 걸기 위해 클래스 추가
//											$(this).parent().addClass(
//													'recipeBox');
//											// 링크 제거
//											$(this).removeAttr('href');
//										})

						
						
					}
				})
			})
}

// 레시피를 모달로 띄우는 함수
function recipeModal() {
	$('#recipeSearchResult').on(
			'click',
			'.recipeBox',
			function() {
				console.log($(this).attr('siteid'));
				$.ajax({
					url : 'getRecipe',
					data : {
						siteId : $(this).attr('siteid')
					},
					success : function(data) {
						// 레시피 비움
						$('#recipeContainer').empty();
						// 레시피 넣음
						$('#recipeContainer').append(data.recipe);
						// 각 이미지 크기 동적 맞춤
						$('#recipeContainer').find('img').each(function() {
							$(this).css({
								"width" : "100%"
							});
						})

						$('.view2_summary_info').css({
							"text-align" : "center",
							"font-size" : "20px"
						});

						// 마지막 사진들 이상해서 넣은거
						$('#completeimgs').css("width", "");
						// 사진 이상 방지
						$('.view_step div').removeClass('media');
						
						$('#recipeMenuSelector').empty().append('<option value="" selected>메뉴 선택</option>');
						// 체크 리스트 메뉴들 selector에 넣기
						$('#accordionSidebar li a #6').each(
								function() {
									$('#recipeMenuSelector').append(
											'<option value="'
													+ $(this).parent().parent()
															.attr('id') + '">'
													+ $(this).text()
													+ '</option>');
								})

						// 모달 띄움
						$('#recipeModal').show();
					}
				})
			})

	// 모달 닫음
	$('#recipeModalClose').on('click', function() {
		$('#recipeModal').hide();
	})
}
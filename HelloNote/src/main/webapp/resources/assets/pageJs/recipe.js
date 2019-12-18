$(function(){
	console.log('start');
	$('#recipeSearch').on('click', function(){
		$.ajax({
			url : 'recipeSearch',
			data : {
				recipeKeyword : $('#recipeKeyword').val()
			},
			success: function(data){
				console.log(data.list);
				$('#recipeSearchResult').append(data.list);
				// 메뉴 지울때 위젯도 지워지게 변경
//				console.log($('#recipeSearchResult').find('a'));
				$('#recipeSearchResult').find('a').each(function(){
					$(this).removeAttr('href');
				})
			}
		})
	})
})
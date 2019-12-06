    	

// 모달창 스크립트
	$(function(){
    		$('#specification').on('click', function(){
    			$('#mySiteModal').show();
    		})
    		
    	})
    
        function popup(){
            var url = "idmenu.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }

		$(function(){
			console.log($('.close').children().eq(0));
    		$('.close').on('click', function(){
    			$('#mySiteModal').hide();
    		})
    		
    	})

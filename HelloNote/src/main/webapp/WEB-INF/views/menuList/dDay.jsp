<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">

</head>



<body>				   
	
    <!--  
    <div class="page-wrapper bg-color-1 p-t-395 p-b-120">    
    -->
    <br><br><br>
    <div>
        <div class="wrapper wrapper--w1070">
            <div class="card card-7">
                <div class="card-body">
                    <form class="form" method="POST" action="#">
                        <div class="input-group input--large">
                            <label class="label" id='si'>GOAL</label>
                            <input class="input--style-1" type="text" placeholder="INPUT D-DAY TITLE" name="going" id="d_day_name">
                        </div>
                        <div class="input-group input--medium">
                            <label class="label" >DATE</label>
                            <input type="date" name="checkin" placeholder="mm/dd/yyyy" id="input-start" readonly>                            
                        </div>
                        <!-- 
	                        <div class="input-group input--medium">
	                            <label class="label">Check-Out</label>
	                            <input class="input--style-1" type="text" name="checkout" placeholder="mm/dd/yyyy" id="input-end">
	                        </div>
                         -->
                        <!--  게스트 수 구하는 인터페이스 
	                        <div class="input-group input--medium">
	                            <label class="label">guests</label>
	                            <div class="input-group-icon js-number-input">
	                                <div class="icon-con">
	                                    <span class="plus">+</span>
	                                    <span class="minus">-</span>
	                                </div>
	                                <input class="input--style-1 quantity" type="text" name="guests" value="2 Guests">
	                            </div>
	                        </div>
                         -->                        
                        <p class="btn-submit" id = add_D_Day_Button>ADD</p>						
                    </form>
		                <h2>D_DAY LIST</h2>
		                <hr>
		                <ul>
					</ul>
					 <div id="d_day_list">
					  				 
					 </div>
						                
                </div>	                
                
                <p id="d_day_list"></p>
            </div>
        </div>
    </div>

	<script >	
	
	  $( function() {
	    $( "#d_day_list" ).sortable({
	    	start : function(e, ui) {
                // creates a temporary attribute on the element with the old index
                $(this).attr('data-previndex', ui.item.index());
             },
             update : function(e, ui) {
                // gets the new and old index then removes the temporary attribute
                var newIndex = ui.item.index();
                var oldIndex = $(this).attr('data-previndex');
                var element_id = ui.item.attr('id');
                console.log('id of Item moved = ' + element_id
                      + ' old position = ' + oldIndex
                      + ' new position = ' + newIndex);
                $(this).removeAttr('data-previndex');
             }

	    });
	    $( "#draggable" ).draggable({
	      connectToSortable: "#sortable",
	      helper: "clone",
	      revert: "invalid"
	    });
	    $( "ul, li" ).disableSelection();
	  } );
	
	
	$('#add_D_Day_Button').on('click',function(){
			// input-start = 입력받은 Date값 , d_day_name = 입력받은 D day 이름
			if($('#input-start').val()==null){
				console.log("input-start값이 null");  // 왜 안먹히는지 모르겟다.......
			}
			if($('#d_day_name').val()==null){
				console.log("d_day_name값이 null");
			}
			
			// 입력한 날짜 값 변수 지정
			var inputDate = new Date($('#input-start').val());
			// 현재 날짜 값 불러옴
			var todate = new Date();
			// 입력 이름 변수
			var inputName = $('#d_day_name').val();
			// 날짜 갭 가져옴
			var gap = todate.getTime() - inputDate.getTime();
			// dday 값으로 변환
			gap = Math.floor(gap / (1000 * 60 * 60 * 24));
						
			
			if(-gap < 0){
				window.alert("제대로 입력");
			} else if(gap == 0){
				gap = "DAY!";				
				$('#d_day_list').append('<div class="input-group input--medium"><label class="label" >'+inputName+'</label><p id=d_day_cover><h1>D-'+-gap+'</h1></p></div>');
			} else {
				$('#d_day_list').append('<div class="input-group input--medium"><label class="label" >'+inputName+'</label><p id=d_day_cover><h1>D-'+-gap+'</h1></p></div>');
			};			
			
			
			console.log($('#input-start').val());		
			console.log($('#d_day_name').val());
			console.log("add_D_Day_button function");		
	});
	</script>
	
	

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
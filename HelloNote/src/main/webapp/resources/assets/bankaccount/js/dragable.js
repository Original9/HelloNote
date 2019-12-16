$(document).ready(function() {
	
    $(".droppable").sortable({
      update: function( event, ui ) {
        Dropped();
      },
      connectWith: '#divMain .droppable'
    });
    
    
	
  });
    

	
    function Dropped(event, ui){
      $(".draggable").each(function(){
        //My Logic goes here
      });
      
    }
	
		
	
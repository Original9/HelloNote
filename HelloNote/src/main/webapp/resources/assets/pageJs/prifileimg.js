console.log("가져오나?");

// preview image
var imgTarget;
var tImg;
var filename;
var submitImgButton;
var ext;

$(document).ready(function() {
	
	
	imgTarget = $('#input-file');
	tImg = $('#thumbnail');
	filename = $('#hellonoteId').val() + "_profileimg";
	submitImgButton =$('#imgsubmit'); 
		//$('#input-file')[0].files;
	imgchange();
	imgSubmit();

});




// 이미지 변경시 미리보기
function imgchange() {
	imgTarget.on('change',function() {
						if (window.FileReader) {
							if (!$(this)[0].files[0].type.match(/image\//)){
								alert("이미지만 올릴수 있습니다.");
								imgTarget.val('');
								return;
							}
							
//						    var _fileLen = imgTarget.val().length;
//						    var _lastDot = imgTarget.val().lastIndexOf('.');
//						 
//						    // 확장자 명만 추출한 후 소문자로 변경
//						    var _fileExt = imgTarget.val().substring(_lastDot, _fileLen).toLowerCase();
//						    if(_fileExt==".png"){
//						    	alert("png 형식은 지원하지 않습니다.");
//						    	imgTarget.val('');
//						    	return;
//						    	
//						    }
						    


						
							
							var reader = new FileReader();
							reader.onload = function(e) {
								var targetsrc = e.target.result;
								tImg.attr("src", targetsrc);
							}
							reader.readAsDataURL($(this)[0].files[0]);

						}
						else {
							$(this)[0].select();
							$(this)[0].blur();
							var imgSrc = document.selection.createRange().text;
							tImg.attr("src", imgSrc);
							
						}
						

					})

}


//이미지 변경.
function imgSubmit(){
	submitImgButton.on('click',function(){
		if($('#input-file')[0].files.length==0){
			alert("이미지를 입력해주세요.");
			return true;
		}
		var form = $('#actForm')[0];
		var formData = new FormData(form); 
		formData.append('uploadFile',$('#input-file')[0].files[0]);
		

		 $.ajax({
             url: 'actImgSubmit',
                     processData: false,
                     contentType: false,
                     data: formData,
                     type: 'POST',
                     success: function(result){
                         alert("프로필 사진이 변경되었습니다.");
                     }
             });
	});
}

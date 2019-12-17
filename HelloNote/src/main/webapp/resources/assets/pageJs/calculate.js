/*mainpage에 있는 계산기관련 .js파일*/
    var text1 = "";
    var op = "";
    var text2 = "";
    var result = "";
    var isDotSelected = false;
    
    function calculateEnterkey(){
    	if(event.keyCode == 13){
    		getResult();    		
    	}
    	
    }
    
    function selectedBtn(id) {
        if(id==".") {
            isDotSelected = true;
        }
        if (op == "") { //첫번째 피 연산자 구분
            text1 += id;
        } else {
            text2 += id;
        } // end of if ~ else    
        
        document.getElementById('showText').value = document.getElementById('showText').value + id;
        
    } //end of selectedBtn function
    
    function selectedOp(id) {
        op = id;
        document.getElementById('showText').value = text1 + " " + op + " "; 
    } //end of selectedOp function
    
    function changeSign() {
        if(text1 == "") {
            alert("값이 없습니다.");
            return;
        } 
        
        if(parseFloat(text1) < 0) { // 값이 음수 -> 양수
            if(op == '') { //
                text1 = Math.abs(parseInt(text1));
                document.getElementById('showText').value = text1;
            } else if(parseFloat(text2) < 0) {
                text2 = Math.abs(parseInt(text2));
                document.getElementById('showText').value = text2;
            } 
        } else { //값 양수 -> 음수
            if(op == '') {
                text1 = '-' + text1;
                document.getElementById('showText').value = text1;
            } else {
                text2 = '-'+text2;
                document.getElementById('showText').value = text2;
            }
        }
    }
    
    function mathText(text) {
        if(text1 == "") {
            alert("값이 없습니다.");
        }
        switch(text) {
        case "_sin" :
            result = Math.sin(parseInt(text1));
            document.getElementById('showText').value = text1 + "의 sin 값 : " + result;
            break;
        case "_cos" :
            result = Math.cos(parseInt(text1));
            document.getElementById('showText').value = text1 + "의 cos 값 : " + result;
            break;
        case "_tan" :
            result = Math.tan(parseInt(text1));
            document.getElementById('showText').value = text1 + "의 tan 값 : " + result;
            break;
        }
    }
 
    function clearAll() {
        text1 = "";
        text2 = "";
        op = "";
        result = "";
        document.getElementById('showText').value = "";
    }
    
    function getResult() { //=
        result = text1 + op + text2;
    
        if(isDotSelected) { //실수
            document.getElementById('showText').value = document.getElementById('showText').value + " = " + eval(result).toFixed(3);    
        } else {
            document.getElementById('showText').value = document.getElementById('showText').value + " = " + eval(result);
        }
        
        text1 = eval(result);
        op="";
        text2="";
        result = "";
        
        isDotSelected = false;
        
    } //end of getResult function
    
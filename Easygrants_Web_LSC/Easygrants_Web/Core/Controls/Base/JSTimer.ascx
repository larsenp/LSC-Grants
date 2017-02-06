<SCRIPT><!--

function SetTimer(){
	var AppTime = setTimeout("TimeIsAlmostUp()",1200000);
}// function SetTimer() 
 
function showAlert(TimeOut){
	var aAlert = alert(TimeOut + " minutes from " + warnTime(0) + " your session on the server will timeout.  \n" + 
	"To prevent the session timeout and loss of unsaved data (if any) before " + warnTime(TimeOut) + ", \n" + 
	"you must save your data or refresh the page.")  
	//If you read this message after your session has timed out, you will need to log in again on the Log In page."
}// function showAlert()

function TimeIsAlmostUp(){
	alert("Ten minutes from " + warnTime(0) + " your session on the server will timeout.  \n" + 
	"To prevent the session timeout and loss of unsaved data (if any) before " + warnTime(10) + ", \n" + 
	"you must save your data or refresh the page.")  
	//If you read this message after your session has timed out, you will need to log in again on the Log In page."
}// function TimeIsAlmostUp()

function warnTime(offset){
	var AMPM
	var warnDate = new Date()
	var warnHour = warnDate.getHours()
	if(warnHour>12){
		warnHour = warnHour - 12
		AMPM = " pm"
	} else {
		if (warnHour!=12){
			AMPM = " am"
		} else {
			AMPM = " pm"
		}		
	}
	if(warnHour==0){
		warnHour=12
	}
	var warnMin = warnDate.getMinutes() + offset
	if(warnMin==60){
		warnHour=warnHour+1
		warnMin=0
	}
	if(warnMin<10){
		warnMin = "0" + warnMin
	}
	if(warnMin>60){
		warnHour=warnHour+1
		warnMin=warnMin-60
		if(warnMin<10){
			warnMin = "0" + warnMin
		}
	}
	if(warnHour>12){
		warnHour = warnHour - 12
	}
	return warnHour + ":" + warnMin + AMPM
}
 
--></SCRIPT>
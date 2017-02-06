//Related to DataListCtl
function ResetDatalistRadioBtns(id)
{
	var parentid = id.substring(0, id.lastIndexOf(":"));
	//alert(parentid);
	var controlid = id + ":"
	var aForm =  document.forms[0]

	for (var i= 0; i< aForm.elements.length; i++)
	{
		if (aForm.elements[i].type == "radio" && aForm.elements[i].name.indexOf(parentid) != -1)
		{
			if (aForm.elements[i].name != controlid)
			{
				aForm.elements[i].checked = false
			}
		}
	}
}

//Resets all radio buttons on this page irrespective of which datalist control they are contained in.
function ResetAllRadioBtns(id)
{
	var controlid = id + ":"
	var aForm =  document.forms[0]
	for (var i= 0; i< aForm.elements.length; i++)
	{
		if (aForm.elements[i].type == "radio")
		{
			if (aForm.elements[i].name == controlid)
			{
			}
			else{
				aForm.elements[i].checked = false
			}
		}
	}
}

//Related to DateTextBox
function OpenWin(URL) {
	var win;
	if(navigator.appName == 'Netscape')
		win = window.open(URL, 'Preview','top=100,left=700,height=205,width=300,scrollbars,resizable');
	else
		win = window.open(URL, 'Preview','top=100,left=700,height=180,width=250,scrollbars,resizable');
	win.focus();
}

function SetValue(UniqueID, DateValue) {
	var form = document.forms[0]
	for (i=0; i< form.elements.length; i++)
	{	
		if (form.elements[i].name == UniqueID)
		{
			form.elements[i-1].value = DateValue;
			return;
		}
	}
}

function isNumberKey(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	if (charCode > 31 && (charCode < 48 || charCode > 57))
		return false;

	return true;
}

function maskChange(objInput) {
	if (!isValid(objInput.value)) {
		objInput.value = objInput.validValue || "";
		objInput.focus();
		objInput.select(); 
	} 
	else {
		objInput.validValue = objInput.value;
	}
}

function isValid(strValue) {
	var reValidString = /^\d*$/;
	return reValidString.test(strValue) || strValue.length == 0;
}

//Related to DropDownText
function RefreshText(sUniqueID) 
{
	var form = document.forms[0];
	var ind = 0;
	var sDDName = sUniqueID + ":selDropDown";
	var sLBName = sUniqueID + ":ctlListBox";
	var sText = sUniqueID + ":spnText";
	var sElem = "";
	var sElemValue = "";
	var re, iUniqueID;
	re = /:/g;
	iUniqueID = sText.replace(re, "_");
	sText = iUniqueID;
	for (i=0; i < form.all.length; i++)
	{
		if (form.all[i].name == sDDName)
		{
			ind = form.all[i].selectedIndex;
			continue;
		}
		if (form.all[i].name == sLBName)
		{
			sElem = form.all[i].options[ind].text;
			sElemValue = form.all[i].options[ind].Value;
			continue;
		}
		if (form.all[i].id == sText)
		{
			if (sElemValue != "")
			{
				form.all[i].innerText = sElem;
				form.all[i].innerHTML = sElem;
				break;
			}
		}
	}
}

//Related TextBox and extensions controls like EmailTextBox, DateTextBox, MoneyTextBox, etc
//function next(ID) 
//{
//	var form = document.forms[0]
//	if (event.keyCode == 13)
//	{
//		for (i=0; i< form.elements.length; i++)
//		{	
//			if (form.elements[i].name == ID)
//			{
//				if (form.elements[i+1])
//					form.elements[i+1].focus();
//				else
//					if (document.anchors[1])
//						document.anchors[1].focus();
//				return;
//			}
//		}
//	}
//}

//Related to OrgSelectLauncher
function PopUp(url, value, ControlName) {
	var form = document.forms[0]
	var ctlvalue
	ctlvalue = 0;
	for (i=0; i < form.elements.length; i++)
	{
		if (form.elements[i].name == "mPageFrameCtl:ctlPageContent:" + ControlName + ":selDropDown")
		{
			ctlvalue = form.elements[i].options[form.elements[i].selectedIndex].value;
		}
	}
	PopUpWindow = window.open(url + "?type=" + value + "&EdType=" + ctlvalue,"Preview","status,height=340,width=600,scrollbars,resizable,menubar")
}

function SetValueFromPopup(ControlName, OrgID, OrgName) {
	OrgName = OrgName.replace(/&apos;/g, "'")
	//OrgName = OrgName.replace(/\''/g,"\'")
	var form = document.forms[0]
	for (i=0; i< form.elements.length; i++)
	{	
		if (form.elements[i].name == ControlName)
		{
			form.elements[i-1].value = OrgID;
			form.elements[i-2].value = OrgName;
		}
	}
}

//Related to Timeout popup warnings.
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

//Related to PopUpSelectorLauncher

function SetValuesFromPopup(ControlName,ObjValue, ObjID, ObjName) {
	//This function works with the PopupSelector2 and PopupSelectorLauncher2 controls.
	ObjName = ObjName.replace(/&apos;/g, "'")
	var form = document.forms[0]
	if(document.getElementById) {
		var x = document.getElementById(ControlName)
		var y = document.getElementById(ObjValue)
	}
	x.value = ObjName;
	y.value = ObjID;
	return;
}
	
function LaunchPopUpSelector(url, value, ControlName) {
	var form = document.forms[0]
	var ctlvalue
	
	ctlvalue = 0;
	
	for (i=0; i < form.elements.length; i++)
	{
				
		if (form.elements[i].name == "mPageFrameCtl:ctlPageContent:" + ControlName + ":selDropDown")
		{
			ctlvalue = form.elements[i].options[form.elements[i].selectedIndex].value;
		}
	}
	
	PopUpWindow = window.open(url + "&type=" + value + "&EdType=" + ctlvalue,"Preview","height=<%=Height%>,width=<%=Width%>,top=<%=Top%>,left=<%=Left%>,scrollbars,resizable")
}

//Related to PopUpSelectorLauncher2

function ClearSelectedValue(value,ObjID) {
	answer = confirm("Are you sure you wish to clear the selection?")
	if (answer != 0)
	{
	  if(document.getElementById) 
	    {
			var x = document.getElementById(value)
			var y = document.getElementById(ObjID)
		}
		
		x.innerHTML = "None";
		y.value = "";
	}
}

//Related to TextArea
function TrimValueToMaxlength(ctlTxtArea,MaxLength)
{
	var mlength=ctlTxtArea.getAttribute? parseInt(MaxLength) : ""
	if (ctlTxtArea.getAttribute && ctlTxtArea.value.length>mlength)
		ctlTxtArea.value=ctlTxtArea.value.substring(0,mlength)
	}

//This function has been added because when a page contains TextArea and when enter key is pressed in TextArea, the page is redirecting to Next Page.
//Here we are checking the Keycode when it is 13 (Enter Key) . we are cancelBubble to occur. This prevents from execting the Next Events.
function StopPropogation(e,objTextArea)
{
	if(e.keyCode == "13")
	{
		e.cancelBubble=true;
	}
}



//Related to UploadNew
function OpenFormattingInstructions(URL) {
	var win
	win = window.open(URL,'File_Formatting_Requirements','height=350,width=750,top=100,left=100,scrollbars,resizable');
	win.focus();
	win.document.title = "File Formatting Requirements"; 
}

//Related to InternalReviewResubmission and Resubmit_Content in Review module
function CheckClearAll(msg)
{
	var aForm =  document.forms[0]
	for (var i= 0; i< aForm.elements.length; i++)
	{
		if (aForm.elements[i].type == "checkbox")
		{
			aForm.elements[i].checked= msg
		}
	}
}

//Related to ImageButton
//function OpenWindow() {
//	top.consoleRef=window.open('<%=mHref%>')
//}

//function OnClick(buttonID, confirmation) {
//	if (confirmation != "")
//	{
//		if (!confirm(confirmation))
//		{
//			return false
//		}
//	}
//	
//	if (buttonID != "")
//	{
//		if (clicked > 0)
//		{
//			clicked++;		
//			document.getElementsByName(buttonID + ":ancButton").disabled = true
//			return false
//		}
//		else
//		{
//			clicked++;
//			return true
//		}	
//	}
//}

//Related to LoginModuleContent
function MainCalled()
{
	if(document.frmMain.elements[3])
	{
		if(document.frmMain.elements[3].type=="text")
		{
			document.frmMain.elements[3].focus();
		}
	}
	
}

//Related to CSSButton
function OnClick(buttonID, confirmation, DisableControl) {
   if (confirmation != "")
	{
	
	if (!confirm(confirmation))
		{
			return false
		}
	}
	
	if (buttonID != "" && DisableControl == "True")
	{
		document.getElementById(buttonID + "_ancButton").style.display = "none";
		document.getElementById(buttonID + "_inProcButton").style.display = "";
		document.getElementById(buttonID + "_inProcButton").style.cursor = "default";
	}

}

//Related to DoubleListBox and DoubleListBox2
function RemoveBlankRows(aSelList) {
	var aEmpty = false;
	if (aSelList.options.length > 0) {
		for (var i = 0; i < aSelList.options.length; i++) {			
			if (aEmpty) {
				aSelList.options[i - 1].value = aSelList.options[i].value;
				aSelList.options[i - 1].text = aSelList.options[i].text;
			}
			if (aSelList.options[i].value == "") {
				aEmpty = true;
			}
		}
		if (aEmpty) {
			aSelList.options.length = aSelList.options.length - 1;
		}
	}
}

function DeleteFromArrayID(varValue, arrArray, varText, arrArrayID){
	var intLocation = 0;
	for (var i=0; i < arrArray.length; i++) {
		if (arrArrayID[i] == varValue){
			intLocation = i;
		}
	}
	arrArrayID[intLocation] = "zzzzzzzz";
	arrArray[intLocation] = "zzzzzzzz";
	ArrayBubbleSort(arrArray, arrArrayID)
	arrArray.length = arrArray.length - 1;
	arrArrayID.length = arrArrayID.length - 1;
}

function AddToArrayID(varValue,arrArray,varText,arrArrayID,blnSort){
	if (blnSort = null){
		blnSort = true;
	}
	intarrArrayLength = arrArray.length;
	arrArray[intarrArrayLength] = varText;
	arrArrayID[intarrArrayLength] = varValue;
	if (blnSort == true)
	{
		ArrayBubbleSort(arrArray, arrArrayID);
	}
}


function PopulateSelectListID(selSelectList, arrArray, arrArrayID) {
	while (arrArray.length < selSelectList.options.length) {
		selSelectList.options[(selSelectList.options.length - 1)] = null;
	}
	for (var i=0; i < arrArray.length; i++) {
		selSelectList.options[i]= new Option (arrArray[i],arrArrayID[i]);
	}
}

function MoveFromSelectLists(selListFrom,selListTo,direction) {
	RemoveBlankRows(selListFrom);
	RemoveBlankRows(selListTo);
	if (selListFrom.selectedIndex == -1){
		var msg = "You must select an item to add or remove.";
		alert(msg);
	}else{
		var varValue;
		var varText;
		var i = 0;
		var j = 0;
		var x = 0;
		var xx = 0;
		var c = 0;
		
		for (i = 0; i < selListFrom.options.length; i++) {
			x=0;
			if (selListFrom.options[i].selected){
				varValue = selListFrom.options[i].value;
				varText = selListFrom.options[i].text;
				// add option to list
				if(direction==1){
					for(c=0; c < selListTo.options.length; c++) {
						if (selListTo.options[c].value==varValue){
							x = 1;
							xx = 1;
						}
					}
					if (x==0){
						selListTo.options[selListTo.options.length]= new Option (varText,varValue);
						this.CreateIDList(this.mSelRight);
					} 
				}
			}
		}
		if (xx==1){
			alert("A chosen item already exists in the Selected items list.");
		}

		if(direction==2){
			// remove option from list
			for (i = selListFrom.options.length - 1; i >= 0; i--) {
				if (selListFrom.options[i].selected){
					for (j = i; j < selListFrom.options.length - 1; j++) {
						selListFrom.options[j].value = selListFrom.options[j+1].value
						selListFrom.options[j].text = selListFrom.options[j+1].text
						//selListFrom.options[j].selected = selListFrom.options[j+1].selected
					}
					selListFrom.options.length = selListFrom.options.length - 1;
					this.CreateIDList(this.mSelRight);
				}
			}
		}			
	}
}


function MoveAll(selListFrom,selListTo,direction) {
	RemoveBlankRows(selListFrom);
	RemoveBlankRows(selListTo);

	var varValue;
	var varText;
	var varToValue;
	var varToText;
	if(direction==1){
		//selListTo.options.length = 0;
		for (i = 0; i < selListFrom.options.length; i++) 
		{
			var varPresent = false;
			varValue = selListFrom.options[i].value;
			varText = selListFrom.options[i].text;
			
			for (j = 0; j < selListTo.options.length; j++){
				varToValue = selListTo.options[j].value;
				varToText = selListTo.options[j].text;
				if (varToValue == varValue && varToText == varText){
					varPresent = true;
					break;
				}
			}
			if (varPresent == false)
				selListTo.options[selListTo.options.length]= new Option (varText,varValue);
		}
	}
	if(direction==2){
		selListFrom.options.length = 0;
	}
	this.CreateIDList(this.mSelRight);
}

function CreateIDList(selList) {
	var bolFirst = true;
	var i;
	var aList = "";
	
	for (i = 0; i < selList.options.length; i++) {
		if(!bolFirst) {
			aList += ",";
		}
		bolFirst = false;
		aList += selList.options[i].value.toString();
	}
	this.mHdnList.value = aList;
}


function MoveDown(){
	if ((this.mSelRight.selectedIndex < this.mSelRight.length-1) && (this.mSelRight.selectedIndex < this.mSelRight.length-1) && (this.mSelRight.selectedIndex != -1) ){
		var strText = this.mSelRight.options[this.mSelRight.selectedIndex].text;
		var checkRollUp = strText.charAt(0);
		var strText2 = this.mSelRight.options[this.mSelRight.selectedIndex+1].text;
		var checkRollUp2 = strText2.charAt(0);
		if (((checkRollUp == "*") && (checkRollUp2 == "*")) || (checkRollUp != "*") ){			
				
				var nIndex = this.mSelRight.selectedIndex;
				var s1t = this.mSelRight.options[this.mSelRight.selectedIndex].text;
				var s2t = this.mSelRight.options[this.mSelRight.selectedIndex+1].text;
				var s1v = this.mSelRight.options[this.mSelRight.selectedIndex].value;
				var s2v = this.mSelRight.options[this.mSelRight.selectedIndex+1].value;
				this.mSelRight.options[this.mSelRight.selectedIndex].text = s2t;
				this.mSelRight.options[this.mSelRight.selectedIndex].value = s2v;
				this.mSelRight.options[this.mSelRight.selectedIndex+1].text = s1t;
				this.mSelRight.options[this.mSelRight.selectedIndex+1].value = s1v;
				this.mSelRight.selectedIndex = nIndex+1;
				this.CreateIDList(this.mSelRight);
		}
	}
}


function MoveUp(){
	if ((this.mSelRight.selectedIndex > 0) && (this.mSelRight.selectedIndex < this.mSelRight.length) && (this.mSelRight.options[this.mSelRight.selectedIndex].text)){
		var strText = this.mSelRight.options[this.mSelRight.selectedIndex].text;
		var checkRollUp = strText.charAt(0);
		var strText2 = this.mSelRight.options[this.mSelRight.selectedIndex-1].text;
		var checkRollUp2 = strText2.charAt(0);
		if (((checkRollUp == "*") && (checkRollUp2 == "*")) || (checkRollUp2 != "*") ){
				var nIndex = this.mSelRight.selectedIndex;
				var s1t = this.mSelRight.options[this.mSelRight.selectedIndex].text;
				var s2t = this.mSelRight.options[this.mSelRight.selectedIndex-1].text;
				var s1v = this.mSelRight.options[this.mSelRight.selectedIndex].value;
				var s2v = this.mSelRight.options[this.mSelRight.selectedIndex-1].value;
				this.mSelRight.options[this.mSelRight.selectedIndex].text = s2t;
				this.mSelRight.options[this.mSelRight.selectedIndex].value = s2v;
				this.mSelRight.options[this.mSelRight.selectedIndex-1].text = s1t;
				this.mSelRight.options[this.mSelRight.selectedIndex-1].value = s1v;
				this.mSelRight.selectedIndex = nIndex-1;
				this.CreateIDList(this.mSelRight);
		}
	}
}


function MoveFromLeftToRight() {
	this.MoveFromSelectLists(this.mSelLeft, this.mSelRight, 1);
}

function MoveAllFromLeftToRight() {
	this.MoveAll(this.mSelLeft, this.mSelRight, 1);
}

function MoveFromRightToLeft() {
	this.MoveFromSelectLists(this.mSelRight, this.mSelLeft, 2);
}

function MoveAllFromRightToLeft() {
	this.MoveAll(this.mSelRight, this.mSelLeft, 2);
}

function  cDblListBox(aCtlFullName) {
	var form = document.forms[0];
	var aSelLeft;
	var aSelRight;
	
	this.mFullName = aCtlFullName;
	aSelLeft = form[aCtlFullName + ':selLeft'];
	aSelRight = form[aCtlFullName + ':selRight'];
	this.mSelLeft = form[aCtlFullName + ':selLeft'];
	this.mSelRight = form[aCtlFullName + ':selRight'];
	this.mHdnList = form[aCtlFullName + ':hdnList'];
	
	this.mArrLeft = new Array();
	this.mArrLeftID = new Array();
	this.mArrRight = new Array();
	this.mArrRightID = new Array();
	
	this.RemoveBlankRows = RemoveBlankRows;
	this.DeleteFromArrayID = DeleteFromArrayID;
	this.AddToArrayID = AddToArrayID;
	this.PopulateSelectListID = PopulateSelectListID;
	this.MoveFromSelectLists = MoveFromSelectLists;
	this.CreateIDList = CreateIDList;
	this.MoveDown = MoveDown;
	this.MoveUp = MoveUp;
	this.MoveFromLeftToRight = MoveFromLeftToRight;
	this.MoveFromRightToLeft = MoveFromRightToLeft;
	this.MoveAll = MoveAll;
	this.MoveAllFromLeftToRight = MoveAllFromLeftToRight;
	this.MoveAllFromRightToLeft = MoveAllFromRightToLeft;
	
	RemoveBlankRows(aSelLeft);
	RemoveBlankRows(this.mSelRight);
}

//Related to OrgSelectLauncherNotInList
function PopUp(url, value) {
	PopUpWindow = window.open(url + "?type=" + value,"Preview","status,height=340,width=600,scrollbars,resizable,menubar")
}

function ViewSharepointDocument(aSPFileURL) {
	var OpenDocumentsObject=null;
	try {
//			try {
//				try {//Office 2002 and previous versions
//					OpenDocumentsObject = new ActiveXObject("SharePoint.OpenDocuments.1"); 
//				}
//				catch(exOff2007) {//Office 2003
//					OpenDocumentsObject = new ActiveXObject("SharePoint.OpenDocuments.2"); 
//				}
//			}
//			catch(exOff2003) {
//				OpenDocumentsObject = new ActiveXObject("SharePoint.OpenDocuments.3"); 
//			}
			//Office 2007 uses SharePoint.OpenDocuments.3 COM object in OWSSUPP.DLL 
			//located usually at \Program Files\Microsoft Office\Office12 in client workstations
			OpenDocumentsObject = new ActiveXObject("SharePoint.OpenDocuments.3"); 
			if (OpenDocumentsObject) { 
				OpenDocumentsObject.ViewDocument3(window,aSPFileURL,2,'');
			} 
	}
	catch(ex) {	
//		alert("Error finding Office 2007.");
		return; 
	}
}

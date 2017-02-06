/*=====================================================*/

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

/*------------------------------------------------------------*/

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
		//ASCIISortID(arrArray);
		//ASCIISortID(arrArrayID);
		arrArray.length = arrArray.length - 1;
		arrArrayID.length = arrArrayID.length - 1;
	}		

/*------------------------------------------------------------*/

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

/*------------------------------------------------------------*/

	function PopulateSelectListID(selSelectList, arrArray, arrArrayID) {
		while (arrArray.length < selSelectList.options.length) {
			selSelectList.options[(selSelectList.options.length - 1)] = null;
		}
		for (var i=0; i < arrArray.length; i++) {
			selSelectList.options[i]= new Option (arrArray[i],arrArrayID[i]);
		}
	}

/*------------------------------------------------------------*/

	function MoveFromSelectLists(selListFrom,selListTo,direction) {
		RemoveBlankRows(selListFrom);
		RemoveBlankRows(selListTo);
		if (selListFrom.selectedIndex == -1){
			var msg = "You must select an item to add or remove.";
			alert(msg);
		}else{
			/*
			var varValue = selListFrom.options[selListFrom.selectedIndex].value;
			var varText = selListFrom.options[selListFrom.selectedIndex].text;
			// add option to list
			selListTo.options[selListTo.options.length]= new Option (varText,varValue);
			
			// remove option from list
			for (var i = 0; i < selListFrom.options.length; i++) {
				if (i > selListFrom.selectedIndex) {
					selListFrom.options[i-1].value = selListFrom.options[i].value
					selListFrom.options[i-1].text = selListFrom.options[i].text
				}
			}
			selListFrom.options.length = selListFrom.options.length - 1;
			this.CreateIDList(this.mSelRight);
			*/
			
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
						// The next four lines are commented out to disable the selected item count limit.  K. Sopher, 8/2/06
						//if(selListTo.options.length==32){
						//	alert("The maximum of 32 items are selected already.");
						//	break;
						//}
						//alert(selListTo.options.length);
						for(c=0; c < selListTo.options.length; c++) {
							if (selListTo.options[c].value==varValue){
								//alert(selListTo.options[c].value);
								//alert(varValue);
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

/*------------------------------------------------------------*/

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
	
/*------------------------------------------------------------*/

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

/*------------------------------------------------------------*/

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

/*------------------------------------------------------------*/

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

/*------------------------------------------------------------*/

	function MoveFromLeftToRight() {
		this.MoveFromSelectLists(this.mSelLeft, this.mSelRight, 1);
	}

/*------------------------------------------------------------*/

	function MoveAllFromLeftToRight() {
		this.MoveAll(this.mSelLeft, this.mSelRight, 1);
	}

/*------------------------------------------------------------*/

	function MoveFromRightToLeft() {
		this.MoveFromSelectLists(this.mSelRight, this.mSelLeft, 2);
	}

/*------------------------------------------------------------*/

	function MoveAllFromRightToLeft() {
		this.MoveAll(this.mSelRight, this.mSelLeft, 2);
	}

/*------------------------------------------------------------*/

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

/*=====================================================*/
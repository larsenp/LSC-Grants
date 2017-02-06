/*=====================================================*/

	function LaunchPopUpSelector(url, value, ControlName) {
		var form = document.forms[0]
		var ctlvalue
		
		ctlvalue = 0;
		
		for (i=0; i < form.elements.length; i++)
		{
					
			if (form.elements[i].name == "mPageFrameCtl:ctlPageContent:" + ControlName + ":selDropDown")
			{
				ctlvalue = form.elements[i].options[form.elements[i].selectedIndex].value;
				//ctlvalue = form.elements[i].selectedIndex.value
			}
		}
		
		PopUpWindow = window.open(url + "&type=" + value + "&EdType=" + ctlvalue,"Preview","status,height=180,width=500,scrollbars,resizable,menubar")
	}
	
/*------------------------------------------------------------*/
	
		function SetValueFromPopup(ControlName, ObjID, ObjName) {
	
		ObjName = ObjName.replace(/&apos;/g, "'")
		var form = document.forms[0]
		for (i=0; i< form.elements.length; i++)
		{	
			if (form.elements[i].name == ControlName)
			{
				form.elements[i-1].value = ObjID;
				form.elements[i-2].value = ObjName;
				return;
				//__doPostBack('ctlModuleContent:ctlPageContent:ctlSave:btnSave:ancButton','');
			}
		}
	}

	
/*----------------------------------------------------------------*/

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

/*=====================================================*/
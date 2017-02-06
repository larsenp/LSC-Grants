/*=====================================================*/

	function PopUp(url, value) {
			/*
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
			*/
			PopUpWindow = window.open(url + "?type=" + value,"Preview","status,height=340,width=600,scrollbars,resizable,menubar")
	}
	
/*------------------------------------------------------------*/
	
	function SetValueFromPopup(ControlName, OrgID, OrgName) {
		
		OrgName = OrgName.replace(/&apos;/g, "'")

		var form = document.forms[0]
		for (i=0; i< form.elements.length; i++)
		{	
			if (form.elements[i].name == ControlName)
			{
				form.elements[i-1].value = OrgID;
				form.elements[i-2].value = OrgName;
				return;
				//__doPostBack('ctlModuleContent:ctlPageContent:ctlSave:btnSave:ancButton','');
			}
		}
	}

/*=====================================================*/
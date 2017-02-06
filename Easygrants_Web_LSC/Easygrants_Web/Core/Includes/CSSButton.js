/*=====================================================*/

function OnClick(buttonID, confirmation) {
   if (confirmation != "")
	{
	
	if (!confirm(confirmation))
		{
			return false
		}
	}
	
	if (buttonID != "")
	{
		document.getElementById(buttonID + "_ancButton").style.display = "none";
		document.getElementById(buttonID + "_inProcButton").style.display = "";
		document.getElementById(buttonID + "_inProcButton").style.cursor = "default";
	}

}

/*------------------------------------------------------------*/

//if("<%=AcceptEnterKey%>" == "True" || "<%=GoToNextPage%>" == "True")
//{
//	document.body.onkeypress = enterKey;
//}

/*------------------------------------------------------------*/

//function enterKey(evt) { 
//  var evt = (evt) ? evt : event 
//  var charCode = (evt.which) ? evt.which : evt.keyCode 
//  if (charCode == 13) 
//	{ 
//    
//   	     document.getElementById("<%=ButtonClientID%>" + "_ancButton").click()
//  	} 
//  }

/*=====================================================*/

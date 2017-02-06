<%@ Control Language="vb" AutoEventWireup="true" Codebehind="CSSButton.ascx.vb" Inherits="Core_Web.Controls.Base.cCSSButton" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<a style="vertical-align:top" id="ancButton" class="CSSButtonStyle" runat="server" visible="true" ></a><a id="inProcButton" class="CSSButtonStyle" style="display:none;vertical-align:top" runat="server"></a> 
<script language="JavaScript">

if("<%=AcceptEnterKey%>" == "True" || "<%=GoToNextPage%>" == "True")
{
document.body.onkeypress = enterKey;
}

//the id of the button control will always be in this format - mPageFrameCtl_ctlPageContent_btnSave_ancButton (with the last word being ancButton)
function enterKey(evt) { 
  var evt = (evt) ? evt : event 
  var charCode = (evt.which) ? evt.which : evt.keyCode 
  var evtSrcElementID = evt.srcElement.id
  var evtSrcElementLastIndex = evtSrcElementID.lastIndexOf("_")
  var firstPos
  var lastPos
  var srcElementType = ""
  if (evtSrcElementLastIndex != -1)
  {
	firstPos = evtSrcElementLastIndex + 1
	lastPos = evt.srcElement.id.length
	srcElementType = evtSrcElementID.substring(firstPos,lastPos)
  }
   
  if (charCode == 13 & srcElementType != "ancButton") { 
    
    document.getElementById("<%=ButtonClientID%>" + "_ancButton").click()
	} 
  }

</script>

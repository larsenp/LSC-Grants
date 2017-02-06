<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Upload1.ascx.vb" Inherits="Core_Web.Controls.Sharepoint.cUpload1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../Base/CSSButton.ascx' %>
<%@ Register Tagprefix='Core' tagname='cTextBox' src='../Base/TextBox.ascx' %>
<%@ Register Tagprefix='Core' tagname='cstaffUpload' src='../Sharepoint/staffUpload.ascx' %>
<table id='tabUpload' width='100%' cellpadding='0' cellspacing='0' runat='server'>
	<tr>
		<td id='tdFileTypeName' colspan='4' class="SeparatorHdg">
			<b><%=FileTypeName%></b>
		</td>
	</tr>
	<tr visible='false' id='trRequired'>
		<td><br><b><font color='red'>&nbsp;&nbsp;Upload Required</font></b>
		</td>
	</tr>
	<tr><td colspan='4'>&nbsp;</td></tr>
	<tr visible='true' id='trInstructions' runat='server'>
		<td colspan='4' id='tdInstructions' runat='server'>Click the <b>Browse…</b> button to select your 
		document from your computer.  From the dialog box that opens, select the file and click 
		the <b>Open</b> button.  When you return to this page, click the <b>Upload</b> button to complete the 
		file upload.  (The <b>Upload</b> button will save any unsaved data entered on the page.)  The 
		page will refresh with the name of the file you have selected to upload.  Click the <b>View</b> 
		button in the Upload Details section to review the document and ensure that it uploaded 
		successfully. </td>
	</tr>
	<tr><td colspan='4'>&nbsp;</td></tr>
	<tr id='trUploadControl'>
		<td width='25%'>
			<asp:FileUpload id='upl1' runat='server'/>			
		</td>
		<td width='5%'>&nbsp;</td>
		<td align='left' width='70%' id='tdUploadNoConfirm'>
			<Core:cButton id='btnUploadNoConfirm' Caption='Upload' runat='server' />
		</td>
		<td align='left' width='70%' id='tdUploadConfirm' visible='false'>
			<Core:cButton id='btnUploadConfirm' Caption='Upload' runat='server' Confirmation='WARNING: Any unsaved Text Entry changes on this page will be lost.' />
		</td>
	</tr>
</table>
<table cellpadding='0' cellspacing='0' border='0' runat='server' ID="Table1">
	<tr visible='False' runat='server' id='trDescription'>
		<td align='left' valign='top'>
			<b>Description&nbsp;&nbsp;&nbsp;<Core:cTextBox id='txtDescription' runat='server' Size='35'
						MaxLength='100'/></b>
		</td>		
		<td valign='bottom' align='center' >
			&nbsp;<span runat='server' id='spnSave'/>&nbsp;
		</td>
	</tr>
	<tr><td colspan='4'>&nbsp;</td></tr>	
</table>
<table cellpadding='0' cellspacing='0' border='0' runat='server' ID="Table2">	
	<tr visible='False' runat='server' id='trMessage'>
		<td colspan='4' id='tdMessage' runat='server' >
		</td>	
	</tr>		
</table>
<table id='tabUploadHistory' cellpadding='0' cellspacing='0' border='0' runat='server' width='100%'>
	<tr><td colspan='4'>&nbsp;</td></tr>
	<tr>
		<td align='center' colspan='5' class='ModuleHdg'>
			<b><%=FileTypeName%> Details</b>
		</td>
	</tr>
	<tr><td colspan='5'>&nbsp;</td></tr>
	<tr>
		<td align='left' width='40%' valign='bottom'>
			<b>File Uploaded</b>
		</td>
		<td align='left' width='30%' valign='bottom'>
			<b>Date Uploaded</b>
		</td>
		<td align='center' valign='bottom' width='30%'>
			<b>Options</b>
		</td>
	</tr>
	<tr><td colspan='5'>&nbsp;</td></tr>
	<tr><td colspan='4' id='tdLine1' visible='false'>&nbsp;</td></tr>	
	<tr>
		<td runat='server' id='tdFileName'><span runat='server' id='spnView' /></td>	
		<td runat='server' id='tdSubmitDate'/>
		<td align='center'>
			<span runat='server' id='spnDelete' visible='false'/>
		</td>
	</tr>
	<tr><td colspan='4' id='tdLine2' visible='false'>&nbsp;</td></tr>	
</table>
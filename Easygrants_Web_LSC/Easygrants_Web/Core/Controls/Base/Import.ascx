<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Import.ascx.vb" Inherits="Core_Web.Controls.Base.cImport" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>
<%@ Register Tagprefix='Core' tagname='cTextBox' src='TextBox.ascx' %>
<%@ Register Tagprefix='Core' tagname='cstaffImport' src='staffImport.ascx' %>




<table id='tabUpload' width='100%' cellpadding='0' cellspacing='0' runat='server'>
	<tr visible='false' id='trInstructions' runat='server'>
		<td colspan='4' id='tdInstructions' runat='server'></td>
	</tr>
	<tr><td colspan='4'>&nbsp;</td></tr>
	<tr visible='false' id='trNoFileMessage'>
		<td colspan='4'><br>
			<b><font color='red'><span runat='server' id="spnNoFileMessage" /></font></b>
		</td>
	</tr>
	<tr>
		<td width='25%'>
			<%--<input type='file' id='upl1' runat='server' />--%>
			<asp:FileUpload id='upl1' runat='server'/>
		</td>
		<td width='5%'>&nbsp;</td>
		<td align='left' width='70%' id='tdUploadNoConfirm'>
			<Core:cButton id='btnUploadNoConfirm' Caption='Upload' runat='server' />
			<asp:CustomValidator id='valUpload' runat='server'
				ErrorMessage=''
				Enabled='true'
				Display='none'/>
		</td>
	</tr>
</table>
<table cellpadding='0' cellspacing='0' border='0' runat='server'>	
	<tr visible='False' runat='server' id='trMessage'>
		<td colspan='4' id='tdMessage' runat='server' >
		</td>	
	</tr>		
</table>
<table id='tabUploadHistory' visible='false' cellpadding='0' cellspacing='0' border='0' runat='server' width='100%'>
	<tr><td colspan='4'>&nbsp;</td></tr>
	<tr>
		<td align='center' colspan='5' class='ModuleHdg'>
			<b><%=FileTypeName%> File Upload History</b>
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
	<tr><td colspan='4' id='tdLine1'>&nbsp;</td></tr>	
	<tr>
		<td runat='server' id='tdFileName'><span runat='server' id='spnView'/></td>
		<td runat='server' id='tdSubmitDate'/>
		<td align='center'>
			<span runat='server' id='spnDelete'/>
		</td>
	</tr>
	<tr><td colspan='4' id='tdLine2'>&nbsp;</td></tr>	
</table>
<span id='spnSetFocus' visible='false' runat='server'>
	<script language="Javascript">
			var aForm =  document.forms[0];
			var anchorID = new String('<%=Anchor%>');
			var url = new String(window.location);
			if (anchorID != "")
			{
				var urlWithoutAnchor = url.substring(0, url.indexOf("#"))
				window.location = urlWithoutAnchor + "#" + anchorID;
			}
	</script>
</span>
<Core:cstaffImport id='ctlStaffImport' visible='false' runat='server'/>
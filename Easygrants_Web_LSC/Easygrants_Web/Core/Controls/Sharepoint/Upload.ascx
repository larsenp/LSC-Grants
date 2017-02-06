<%@ Register Tagprefix='Core' tagname='cstaffUpload' src='../Sharepoint/staffUpload.ascx' %>
<%@ Register Tagprefix='Core' tagname='cTextBox' src='../Base/TextBox.ascx' %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../Base/CSSButton.ascx' %>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Upload.ascx.vb" Inherits="Core_Web.Controls.Sharepoint.cUpload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<table id='tabUpload' width='100%' cellpadding='2' cellspacing='0' runat='server'>
	<tr>
		<td id='tdFileTypeName' colspan='4' class="SeparatorHdg">
			<b>
				<%=FileTypeName%>
			</b>
		</td>
	</tr>
	<tr visible='false' id='trNoFileMessage'>
		<td colspan='4'><br>
			<b><font color='red'><span runat='server' id="spnNoFileMessage" /></font></b>
		</td>
	</tr>
	<tr visible='false' id='trRequired'>
		<td><BR>
			<b><font color='red'>Upload Required</font></b>
		</td>
	</tr>
	<tr visible='false' id='trInstructions' runat='server'>
		<td colspan='4' id='tdInstructions' runat='server'></td>
	</tr>
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr id='trUploadControl'>
		<td width='25%'>
			<asp:FileUpload ID='upl1' runat="server" />
		</td>
		<td width='5%'>&nbsp;</td>
		<td align='left' width='70%' id='tdUpload'>
			<Core:cButton id='btnUpload' Caption='Upload' runat='server' />
			<asp:CustomValidator id='valUpload' runat='server'
				ErrorMessage=''
				Enabled='true'
				Display='none'/>
		</td>
	</tr>
</table>
<table cellpadding='0' cellspacing='0' border='0' runat='server'>
	<tr visible='False' runat='server' id='trDescription'>
		<td align='left' valign='top'>
			<b>Description&nbsp;&nbsp;&nbsp;<Core:cTextBox id='txtDescription' runat='server' Size='35' MaxLength='100' /></b>
		</td>
		<td valign='bottom' align='center'>
			&nbsp;<span runat='server' id='spnSave' />&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
</table>
<table cellpadding='0' cellspacing='0' border='0' runat='server'>
	<tr visible='False' runat='server' id='trMessage'>
		<td colspan='4' id='tdMessage' runat='server'>
		</td>
	</tr>
</table>
<table id='tabUploadHistory' cellpadding='0' cellspacing='0' border='0' runat='server'
	width='100%'>
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
		<td align='Left' colspan='5' class='ModuleHdg'>
			<b>
				Attachment Details</b>
		</td>
	</tr>
	<tr>
		<td colspan='5'>&nbsp;</td>
	</tr>
	<tr>
		<td align='left' width='30%' valign='bottom'>
			<b>File/Document Name</b>
		</td>
		<td align='left' width='20%' valign='bottom'>
			<b>Uploaded By</b>
		</td>
		<td align='left' width='30%' valign='bottom'>
			<b>Uploaded Date</b>
		</td>
		<td align='center' valign='bottom' width='20%'>
			<b>Options</b>
		</td>
	</tr>
	<tr>
		<td colspan='4' id='tdLine1'>&nbsp;</td>
	</tr>
	<tr>
		<td runat='server' id='tdFileName'><span runat='server' id='spnView' /></td>
		<td runat='server' id='tdUploadedName'/>
		<td runat='server' id='tdSubmitDate'/>
		<td align='center'>
			<span runat='server' id='spnDelete' />
		</td>
	</tr>
	<tr>
		<td colspan='4' id='tdLine2'>&nbsp;</td>
	</tr>
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
<Core:cstaffUpload id='ctlStaffUpload' visible='true' runat='server' />

<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="UploadTemplate.ascx.vb" Inherits="Core_Web.Controls.Base.cUploadTemplate" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>

<%@ Register Tagprefix='Core' tagname='cTextBox' src='TextBox.ascx' %>
<%@ Register Tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>

<table id="Table3"  width='100%' cellpadding='2' cellspacing='0' runat="server" >
	<tr><td class="SeparatorHdg" colspan='2'>Upload Template</td></tr>
	<tr visible='false' id='trNoFileMessage'>
		<td colspan='2'><br>
			<b><font color='red'><span runat='server' id="spnNoFileMessage" /></font></b>
		</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
			<td width='20%'>
				<asp:FileUpload id='upl' runat='server' EnableViewState="true"/>
			</td>
		
			<td align='left' width='70%' id='tdUpload'>
				<Core:cButton id='btnUpload' Caption='Upload' runat='server' CausesValidation="False"/>
				<%--<asp:CustomValidator id='valUpload' runat='server'
					ErrorMessage=''
					Enabled='true'
					Display='none'/>--%>
			</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr visible='true' runat='server' id='trDescription'>
		<td align='left' valign='top'>
			<b>Name&nbsp;</b><%=kDenoteRequiredField%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<Core:cTextBox id='txtTemplateName' runat='server' Size='35' MaxLength='100' />
		</td>
		<td valign='bottom'>
			&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnSave' />&nbsp;
		</td>
	</tr>
	
	<tr>
		<td colspan='2'>&nbsp;</td>
	</tr>
</table>
<table id='tabUploadDetails' cellpadding='0' cellspacing='0' border='0' runat='server'
	width='100%'>
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
		<td align='Left' colspan='5' class='ModuleHdg'>
			<b>
				Upload Details</b>
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
		<td align='left' width='20%' valign='bottom'>
			<b>Uploaded Date</b>
		</td>
		<td align='center' valign='bottom' width='30%'>
			<b>Options</b>
		</td>
	</tr>
	<tr>
		<td colspan='4' id='tdLine1'>&nbsp;</td>
	</tr>
	<tr>
		<td runat='server' id='tdFileName'><span runat='server' id='spnView' /></td>
		<td runat='server' id='tdUploadedBy'/>
		<td runat='server' id='tdUploadedDate'/>
		<td align='center'>
			<span runat='server' id='spnDelete' />
		</td>
	</tr>
	<tr>
		<td colspan='4' id='tdLine2'>&nbsp;</td>
	</tr>
</table>

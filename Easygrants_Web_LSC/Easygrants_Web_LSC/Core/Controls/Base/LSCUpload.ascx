<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="LSCUpload.ascx.vb" Inherits="Core_Web.Controls.Base.cLSCUpload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>
<%@ Register Tagprefix='Core' tagname='cLink' src='Link.ascx' %>
<div id='DivUploadTemplate' runat="Server"><Core:cLink id='ctlTemplateLink' runat='server' /></div>
<br />
<asp:FileUpload id='upl' runat='server'/>
<Core:cButton id='btnUpload' Caption='Upload' runat='server' />

<asp:CustomValidator id='valUpload' runat='server'
	ErrorMessage=''
	Enabled='true'
	Display='none'/>

<table id="Table3"  width='100%' cellpadding='2' cellspacing='0' runat="server" >
	<tr visible='false' id='trNoFileMessage'>
		<td colspan='3'><br>
			<b><font color='red'><span runat='server' id="spnNoFileMessage" /></font></b>
		</td>
	</tr>
</table>

<%@ Control Language="vb" AutoEventWireup="true" Codebehind="RadioButtonList.ascx.vb" Inherits="Core_Web.Controls.Base.cRadioButtonList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<table runat='server' border='0' cellspacing='0' cellpadding='0'>
	<tr>
		<td>
			<ASP:RadioButtonList id='rdoRadioButtonList' runat='server' />
            <ASP:RequiredFieldValidator id='valReqListBox' runat='server'
				RepeatDirection='Vertical'
				ControlToValidate='rdoRadioButtonList'
				Enabled='False'
				Display='None'/>
		</td>
	</tr>
</table>	

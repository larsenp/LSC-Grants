<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ViewMyGrantsList.ascx.vb" Inherits="Implementation.Modules.Home.Controls.Page.cViewMyGrantsList"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr  class='SeparatorHdg'>
		<td width='15%'><b><%=GetLabel("GrantId")%></b>
		&nbsp;<span runat='server' id='spnGrantsID'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><span runat='server' id='spnGrantsDetails'/></td></tr>
	<tr><td>
        <table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	        <tr>
	            <td width='15%'><b><%=GetLabel("GrantId")%></b></td>
                <td colspan='3'><span runat='server' id='spnEasyGrantsID'/></td>	        
	        </tr>
	        <tr>
	            <td width='15%'><b>Grantee <%=GetLabel("Organization")%></b></td>
                <td width='35%'><span runat='server' id='spnOrganization'/></td>	        
	            <td width='15%'><b>Primary Contact/PI</b></td>
                <td width='35%'><span runat='server' id='spnPI'/></td>	        
	        </tr>
	        <tr>
	            <td width='15%'><b>Status</b></td>
                <td width='35%'><span runat='server' id='spnStatus'/></td>	        
	            <td width='15%'><b>Program</b></td>
                <td width='35%'><span runat='server' id='spnProgram'/></td>	        
	        </tr>
	        <tr>
	            <td width='15%'><b>Award Amount</b></td>
                <td width='35%'><span runat='server' id='spnAwardAmount'/></td>	        
	            <td width='15%'><b>Award Date</b></td>
                <td width='35%'><span runat='server' id='spnAwardDate'/></td>	        
	        </tr>
        </table>
	</td></tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='MyGrantsList' Key='MyGrantsList1'>
			<DisplayProperties>
			    <DisplayProperty PropertyKey=''>
				    <Control ID='ctlGrantsDetails' Container='spnGrantsDetails' Type='cButton' Caption='View Grant'>
					    <Action PostBack='True' Object='EventController'
						    Method='EventController_NavigateToModulePageKey'>
						    <Parameters>
							    <Argument AttributeName='PageKey' Value='MyGrantDetails'/>
                                <Argument Type='DataObjectCollection' TypeKey='MyGrantsList1' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
						    </Parameters>
					    </Action>
				    </Control>
			    </DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjectID'><Control ID='spnGrantsID' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='GranteeProjectID'><Control ID='spnEasyGrantsID' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'><Control ID='spnOrganization' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='LastNameFirstName'><Control ID='spnPI' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='ProgramName'><Control ID='spnProgram' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='GrantStatus'><Control ID='spnStatus' Type='HtmlGenericControl' /> </DisplayProperty>	
    			<DisplayProperty PropertyKey='AwardAmount' Format='$#,##0.00'><Control ID='spnAwardAmount' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='AwardDate' Format='MM/dd/yyyy'><Control ID='spnAwardDate' Type='HtmlGenericControl' /> </DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>




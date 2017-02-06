<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantsPortfolioDetails.ascx.vb" Inherits="Easygrants_Web.Implementation.Modules.Staff.Controls.Page.Grants.cGrantPortfolioDetails"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
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
                <td width='35%'><span runat='server' id='spnEasyGrantsID'/></td>	        
	            <td width='15%'><b><%=GetLabel("LegacyGrantId")%></b></td>
                <td width='35%'><span runat='server' id='spnLegacyGrantsID'/></td>	        
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
	            <td width='15%'><b><%=GetLabel("ProgramName")%></b></td>
                <td width='35%'><span runat='server' id='spnProgram'/></td>	        
	        </tr>
	        <tr>
	            <td width='15%'><b>Outcome</b></td>
                <td width='35%'><span runat='server' id='spnOutcome'/></td>	        
	            <td width='15%'><b><%=GetLabel("FundingOpportunity")%></b></td>
                <td width='35%'><span runat='server' id='spnCompetetion'/></td>	        
	        </tr>
	        <tr>
	            <td width='15%'>&nbsp;</td>
                <td width='35%'>&nbsp;</td>	        
	            <td width='15%'><b><%=GetLabel("FundingCycleName")%></b></td>
                <td width='35%'><span runat='server' id='spnCycle'/></td>	        
	        </tr>
	        <tr>
	            <td width='15%'><b><%=GetLabel("ProjectTitle")%></b></td>
                <td colspan='3'><span runat='server' id='spnProjectTitle'/></td>	        
	        </tr>
        </table>
	</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='GrantPortfolioList' Key='GrantPortfolioList1'>
			<DisplayProperties>		
			    <DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
				    <Control ID='ctlGrantsDetails' Container='spnGrantsDetails' Type='cButton' Caption='Grants Details'>
					    <Action PostBack='True' Object='EventController'
						    Method='EventController_NavigateToModulePageKey'>
						    <Parameters>
							    <Argument AttributeName='PageKey' Value='GrantsEditor'/>
                                <Argument Type='DataObjectCollection' TypeKey='GrantPortfolioList1' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
						    </Parameters>
					    </Action>
				    </Control>
			    </DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjectID'> 
					<Control ID='ctlGrantID1' Container='spnGrantsID'
						ToolTipPropertyKey='ProjectTitle'
						Type='cLink'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantsEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='GrantPortfolioList1' DataObjectPropertyKey='GranteeProjectID'  BaseValue='GranteeProjectID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='ctlGrantID' Container='spnEasyGrantsID'
							ToolTipPropertyKey='ProjectTitle'
							Type='cLink'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='GrantsEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='GrantPortfolioList1' DataObjectPropertyKey='GranteeProjectID'  BaseValue='GranteeProjectID='/>
								</Parameters>
							</Action>
						</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LegacyProjectID'><Control ID='spnLegacyGrantsID' Type='HtmlGenericControl' /> </DisplayProperty>	
			    <DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
				    <Control ID='ctlLinkOrganizationName' Container='spnOrganization' Type='cLink'>
					    <Action PostBack='True' Object='EventController'
						    Method='EventController_NavigateToModulePageKey'>
						    <Parameters>
							    <Argument AttributeName='PageKey' Value='OrganizationContact'/>
                                <Argument Type='DataObjectCollection' TypeKey='GrantPortfolioList1' DataObjectPropertyKey='OrganizationID' BaseValue='OrganizationID='/>
						    </Parameters>
					    </Action>
				    </Control>
			    </DisplayProperty>
				<DisplayProperty PropertyKey='LastNameFirstName' >
					<Control ID='ctlLinkLastNameFirstName' Container='spnPI' Type='cLink'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PersonContact'/>
                                <Argument Type='DataObjectCollection' TypeKey='GrantPortfolioList1' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramName'><Control ID='spnProgram' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='GrantStatus'><Control ID='spnStatus' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='CompetitionName'><Control ID='spnCompetetion' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='ProjectOutcome'><Control ID='spnOutcome' Type='HtmlGenericControl' /> </DisplayProperty>	
    			<DisplayProperty PropertyKey='ProjectName'><Control ID='spnCycle' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='ProjectTitle'><Control ID='spnProjectTitle' Type='HtmlGenericControl' /> </DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

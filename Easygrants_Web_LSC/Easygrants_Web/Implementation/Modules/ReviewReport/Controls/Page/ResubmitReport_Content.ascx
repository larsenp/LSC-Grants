<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ResubmitReport_Content.ascx.vb" Inherits="Implementation.Modules.ReviewReport.Controls.Page.cResubmitReport_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Implementation/Controls/Base/ValidationContent.ascx' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
	    <td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grant Summary</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table  cellspacing='0' cellpadding='0' runat='server' border='0' width='70%'>
    <tr>
        <td valign="top"><b><%=GetLabel("GrantId")%></b></td>
        <td><span id='spnNumber' runat='server'/></td>
        <td></td>
        <td><b><%=GetLabel("LegacyGrantId")%></b></td>
        <td><span id='spnLegacyGrantID' runat='server'/></td>
    </tr>
    <tr>
        <td valign="top"><b>Grantee <%=GetLabel("Organization")%></b></td>
        <td><span id='spnPrimaryOrganization' runat='server'/></td>
        <td></td>
        <td><b>Primary Contact/PI</b></td>
        <td><span id='spnPrimaryPerson' runat='server'/></td>
    </tr>
     <tr>
        <td valign="top"><b>Status</b></td>
        <td><span id='SpnStatus' runat='server'/></td>
        <td></td>
        <td><b><%=GetLabel("ProgramName")%></b></td>
        <td><span id='spnProgram' runat='server'/></td>
    </tr>
     <tr>
        <td valign="top"><b><%=GetLabel("FundingOpportunity")%></b></td>
        <td><span id='spnCompetition' runat='server'/></td>
        <td></td>
        <td><b><%=GetLabel("FundingCycleName")%></b></td>
        <td><span id='spnProject' runat='server'/></td>
    </tr>
    <tr>
        <td colspan='5'>&nbsp;</td>
    </tr>
     <tr>
        <td valign="top"><b>Created on</b>&nbsp; <span id='SpnCreatedDate' runat='server'/></td>
        <td align="center"><b>Modified on</b></td>
        <td><span id='spnModifyDate' runat='server'/>&nbsp;&nbsp;&nbsp;</td>
        <td><b>Modified by</b></td>
        <td><span id='spnModifyUser' runat='server'/></td>
    </tr>
	<tr>
	    <td>&nbsp;</td>
	</tr>
</table>
<table id='tbPDF' border='0' cellspacing='0' cellpadding='0' runat='server' visible='false'>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlGrantReportLink' Type='cReportOutputLink' runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Resubmission Requirements</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Click the checkbox next to the pages that need to be resubmitted by the primary contact for the grantee <%=GetLabel("Organization")%>. 
			To check all items, click on the <b>Check All</b> link at the top of the list.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a href='javascript:CheckClearAll(true)'>Check All </a> &nbsp;&nbsp;<a href='javascript:CheckClearAll(false)'>Clear All</a> 
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnReopen'/>
			<asp:CustomValidator 
				id='valReopenCBList'
				runat='server'
				OnServerValidate='ValidateReopenCBList'
				Display='none'/>
		</td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Review and Invite for Resubmission</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			Review the information for the resubmission invitation. To complete the resubmission invitation, click on 
			the <B>Continue</B> button and you will be directed to the Invite for Resubmission page. To cancel the resubmission 
			request and return to the review page, click on the <B>Cancel</B> button.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='1%'>&nbsp;</td>
		<td	width='20%'><b>Primary Contact Name</b></td>
		<td>
			<span id='spnName' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><b>Primary Contact Email</b></td>
		<td>
			<span id='spnEmail' runat='server'/>
		</td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
		<td>
			This is the email address to which the resubmission request will be sent.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' align='center'>
		<span runat='server' id='spnCancel'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnInvite'/>
	</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='spnNumber'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName' >
							<Control ID='ctlLink1' Container='spnPrimaryOrganization'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
									   <Argument AttributeName='PageKey' Value='OrganizationContact'/>
									    <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>							
						</DisplayProperty> 
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName' >
							<Control ID='ctlLink' Container='spnPrimaryPerson'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
									    <Argument AttributeName='PageKey' Value='PersonContact'/>
									    <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' BaseValue='PersonID='/>
									
									</Parameters>
								</Action>
							</Control>							
						</DisplayProperty> 
				
				<DisplayProperty PropertyKey='GrantStatus.Abbr'>
					<Control ID='spnStatus'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnLegacyGrantID'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.WfProgram.ProgramDisplayName'>
					<Control ID='spnProgram'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnProject'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreateDate' Format='MM/dd/yyyy'>
					<Control ID='spnCreatedDate'
						Type='HtmlGenericControl' >
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName'>
					<Control ID='spnModifyUser'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='MM/dd/yyyy'>
					<Control ID='spnModifyDate'
						Type='HtmlGenericControl' >
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPerson.FirstNameLastName'> 
					<Control ID='spnName'
							Type='HtmlGenericControl'/>								
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPerson.Email.ContactValue1'> 
					<Control ID='spnEmail'
							Type='HtmlGenericControl'/>								
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID' Value='' bool=''/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskRoleID'
					Value='1' bool='And'/>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='PrimaryPersonID'
					PropertyKey='PersonID' Value='' bool='And'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantReportLink'
						Type='cReportOutputLink'
						DisplayText=''>
						<Parameters>
							<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' Value=''/>
							<Argument Type='DataObjectCollection' TypeKey='ReportOutputDefinition' DataObjectPropertyKey='ReportOutputDefinitionID' PropertyKey='DefinitionID' Value=''/> 
							<!-- 
							<Argument Type='DataObjectCollection' TypeKey='WfProject' DataObjectPropertyKey='FinalPDFReportKey' PropertyKey='Key' Value=''/>
							-->
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='AppWfTA' -->
		
		<DataObject Key='InterimWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignmentExt' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='ReportWfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='ReviewWfTaskAssignmentExt' DataObjectDefinitionKey='WfTaskAssignmentExt'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='ReportWfta' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTaskAssignmentExt' DataObjectPropertyKey='ReportWfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<!--If the WftaReopen data object does not already exist, it must be created by a DataObject element separate
		from the one containing the checkbox list representing the WftaReopenSection data objects. This is the only way
		that the section items represented by the checked checkboxes will be able to access the ID of the new 
		WftaReopenRequest object.-->
		<DataObject Key='WftaReopenRequestNew' DataObjectDefinitionKey='WftaReopenRequest' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='RequestingWfTaskAssignmentID'/>
				<Argument PropertyKey='Active' Value='True'/>
				<Argument Type='DataObjectCollection' TypeKey='ReportWfta' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='ReopenWfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='RequestingWfTaskAssignmentID'/>
				<Argument PropertyKey='Active' Value='True'/>
				<Argument Type='DataObjectCollection' TypeKey='ReportWfta' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='ReopenWfTaskAssignmentID'/>
				<!-- <Argument Type='DataObjectCollection' TypeKey='ReportWfta' DataObjectPropertyKey='PersonID' PropertyKey='ReopenedTaskPersonID'/> -->
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' PropertyKey='ReopenedTaskPersonID' Update='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate'/>
			</DefaultValues>
		</DataObject>
		<DataObject Key='WftaReopenRequest' DataObjectDefinitionKey='WftaReopenRequest' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WftaReopenRequestNew' DataObjectPropertyKey='WftaReopenRequestID' PropertyKey='WftaReopenRequestID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WftaReopenSections'>
					<Control ID='ctlReopen'
						Container='spnReopen'
						Type='cWftaReopenCheckboxlist'
						StoredValue='SectionKey'>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='WftaReopenRequestNew' DataObjectPropertyKey='WftaReopenRequestID' PropertyKey='WftaReopenRequestID'/>
							<Argument PropertyKey='SavedAfterReopen' Value='False'/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
						
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'  CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnInvite'
						Container='spnInvite'
						Type='cButton'
						Image='Continue'>
						<Action
							AutoSave='True'							
							PostBack='True'
							Object='DataPresenter'
							Method='Invite'>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		

	</ModuleSection>
</span>
<!-- End Embedded XML -->
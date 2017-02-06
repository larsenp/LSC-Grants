<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Home.Controls.Page.cInitiateSubgrantStep2" TargetSchema=
"http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<div style='width:800px'>
	<div class='SeparatorHdg'>
		Initiate Subgrant Approval Request Step 2
	</div>
	<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/><br />
	<span runat='server' id='spnModifyRequest'/><br /><br />
	<span runat='server' visible='false' id='spnSubmitRequest'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID'/>
			</Filters>
		</DataObject>
		<DataObject Key='Step1RequestWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='WfTaskID' Value='101'/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Step 1 Information~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='Step1RequestWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='Step1RequestWfTA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskModule' DataObjectKey='WfTaskModule' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument PropertyKey='WfTaskID' Value='116'/>
				<Argument PropertyKey='WfTaskRoleID' Value='1'/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnModifyRequest'
						Type='cButton'
						Container='spnModifyRequest'
						Caption='Initiate Step 2'>
						<Action PostBack='True'
							Object='EventController'
							Method='CreateWfTAAndRedirect'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Step1RequestWfTA' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
								<Argument Type='ModuleUser' TypeKey='PersonID'/>
								<Argument Type='ModuleUser' TypeKey='UserID'/>
								<Argument Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmitRequest'
						Type='cButton'
						Container='spnSubmitRequest'
						Caption='Submit Request as is'>
						<Action PostBack='True'
							Object='EventController'
							Method='CreateWfTAAndRedirect'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Step1RequestWfTA' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
								<Argument Type='ModuleUser' TypeKey='PersonID'/>
								<Argument Type='ModuleUser' TypeKey='UserID'/>
								<Argument Value='AutoSubmit'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>				
		</DataObject>
	</ModuleSection>
</span>

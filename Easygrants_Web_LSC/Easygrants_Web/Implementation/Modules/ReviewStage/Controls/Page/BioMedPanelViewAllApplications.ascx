<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<span id='spnPageContent' runat='server' />
<p>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='90%'>
	<tr><td width=1%></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />
		<DataObject Key='BioMedAllApplicationsList' DataObjectDefinitionKey='BioMedAllApplicationsList'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ApplicantName'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GradAllApplicationsList'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='500'
						ShowSubColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Name' NoWrap='true' Width='25%'>
							<Sortable>
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CurrentMedInst' ColumnHeader='Medical/Dental School' NoWrap='true' >
							<Sortable>
								<Argument PropertyKey='CurrentMedInst'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ViewApplicationURL' ColumnHeader='Application PDF' NoWrap='True'>
							<Control ID='btnProjSum'
								Type='cLink'
								Caption='View Application'>
									<Action
										PostBack='False'
										Target='_blank'
										URL='WebRelative'/>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Unattributed Comments' NoWrap='True'>
							<Control ID='ctlRegister'
								Type='cLink'
								Caption='View Comments'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='UnattributedCommentsDetail'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID=' Value=''/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

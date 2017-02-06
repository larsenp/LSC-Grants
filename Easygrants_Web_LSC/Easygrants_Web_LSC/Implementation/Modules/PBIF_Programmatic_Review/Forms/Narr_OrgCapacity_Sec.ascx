<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<div style="width:600px;">
	<br />
	<Core:cUserCtlLoader ID="ldrAppInfo" CtlID='ctlAppInfo' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	<div class='SeparatorHdg'>
		Narrative - <span runat='server' id='spnCategory'/> (<span runat='server' id='spnWeighting'/>%)
	</div>
	<br />
	<p><strong>Instructions</strong></p>
	<p>Provide a score and comments for the Organizational Capacity, Project Partners, and Sustainability components of the application. Please consider all components of the application, including the appendices. For additional scoring guidance, see the <a href='http://www.lsc.gov/sites/lsc.gov/files/LSCProBonoInnovationFund2014NOFA.pdf' target="_blank">Notice of Funds Availability</a> and the supplemental material provided via email.   </p>
	<span runat='server' id='spnProjectNarrative'/>
	<br /><br />

	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatStmt1" CtlID='ctlSubcatStmt1' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryStatement.ascx'
		runat='server'
		Properties='CategoryNum=2&SubcategoryNum=1'/>
	<br /><br />
	<strong>Criteria:</strong>
	<br />
	<Core:cUserCtlLoader ID="ldrTrackRecord" CtlID='ctlTrackRecord' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/TrackRecordOnProBonoCriteria.ascx'
		runat='server'/>
	<br /><br />
	<strong>Resumes of Key Staff</strong>
	<br /><br />
	<span runat='server' id='spnResumes'/>
	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatStmt2" CtlID='ctlSubcatStmt2' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryStatement.ascx'
		runat='server'
		Properties='CategoryNum=2&SubcategoryNum=2'/>
    <br /><br />
	<strong>Criteria:</strong>
	<br />
	<Core:cUserCtlLoader ID="ldrSupport" CtlID='ctlSupport' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/AbilityProvideSupportCriteria.ascx'
		runat='server'/>
	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatStmt3" CtlID='ctlSubcatStmt3' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryStatement.ascx'
		runat='server'
		Properties='CategoryNum=2&SubcategoryNum=3'/>
	<br /><br />
	<strong>Criteria:</strong>
	<br />
	<Core:cUserCtlLoader ID="ldrPlans" CtlID='ctlPlans' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/PlansAndPotentialCriteria.ascx'
		runat='server'/>
	<br /><br />
	<Core:cUserCtlLoader ID="ldrCatScore" CtlID='ctlCatScore'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/CategoryScoreComment.ascx'
		runat='server'
		Properties='CategoryNum=2'/>

	<div style="width:100%; text-align:center">
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;
		<span runat='server' id='spnSaveContinue'/>
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnProjectNarrative'
						Type='cButton'
						Container='spnProjectNarrative'
						Caption='View Project Narrative'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
							<Parameters>
								<Argument Value='ProjectNarrative'/>
								<Argument Value='PageFrame=Print'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCatScore'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Save and Continue'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='WfTaskAssignmentApp' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='WfTaskID' Value='100'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='LscProBonoCategory' DataObjectDefinitionKey='LscProBonoCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="WfTaskAssignmentApp" DataObjectPropertyKey='GranteeProject.WfProject.TimePeriodID' PropertyKey="TimePeriodID"/>
				<Argument PropertyKey="SortOrder" Value='2'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnCategory'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Weighting'>
					<Control ID='spnWeighting'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignmentApp' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID'/>
				<Argument PropertyKey='UploadId' Value='62'>
					<RelatedProperty PropertyKey='TaskUploadType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstResumes'
						Type='cDataListCtl'
						Container='spnResumes'
						DataObjectDefinitionKey='SubmittedFile'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader=''/>
						<DisplayProperty PropertyKey='' ColumnHeader=''>
							<Control ID='btnView'
								Type='cButton'
								Image='View'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
									<Parameters>
										<Argument AttributeName='URL' Value='/EasyGrants_Web_LSC/Core/Controls/Base/pgUploadReader.aspx'/>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID='/>
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

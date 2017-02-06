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
	<p>Provide a score and comments for the Project Design components of the application. Please consider all components of the application, including the appendices. For additional scoring guidance, see the <a href='http://www.lsc.gov/sites/lsc.gov/files/LSCProBonoInnovationFund2014NOFA.pdf' target="_blank">Notice of Funds Availability</a> and the supplemental material provided via email.   </p>
	<span runat='server' id='spnProjectNarrative'/>

	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatStmt1" CtlID='ctlSubcatStmt1' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryStatement.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=1'/>
	<br /><p>If a Current Pro Bono Innovation Fund Grantee: In addition to Question 1 above, the need statement should provide a summary highlighting the need and challenges being addressed in the current Pro Bono Innovation Fund project and the most important lesson and/or result achieved to date for the targeted clients and volunteers. 
	</p><br />
	<strong>Criteria:</strong>
	<br />
	<Core:cUserCtlLoader ID="ldrNeedStmtCriteria" CtlID='ctlNeedStmtCriteria' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/NeedStatementCriteria.ascx'
		runat='server'/>
	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatScore1" CtlID='ctlSubcatScore1' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryScoreComment.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=1'/>

	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatStmt2" CtlID='ctlSubcatStmt2'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryStatement.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=2'/>
	<br /><p>If a Current Pro Bono Innovation Fund Grantee: In addition to Question 2 above, this section should describe how the proposed project is different from the current project and plans to advance knowledge-sharing and effective replication of proven or promising pro bono practices from the currently-funded efforts.</p><br />
	<strong>Criteria:</strong>
	<br />
	<Core:cUserCtlLoader ID="ldrGoals" CtlID='ctlGoals' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/GoalsObjectivesActivitiesCriteria.ascx'
		runat='server'/>
	<br />
	<p>In addition to the response in the Narrative, reviewers should consider the role of any contracts and subgrants when scoring this section.</p>
	<span runat='server' id='spnContractSubgrantDocs'/>
	
	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatScore2" CtlID='ctlSubcatScore2'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryScoreComment.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=2'/>
	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatStmt3" CtlID='ctlSubcatStmt3'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryStatement.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=3'/>	
	<br /><br />
	<strong>Criteria:</strong>
	<br />
	<Core:cUserCtlLoader ID="ldrResourcesCriteria" CtlID='ctlResourcesCriteria' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/AvailableProBonoResourcesCriteria.ascx'
		runat='server'/>
	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatScore3" CtlID='ctlSubcatScore3'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryScoreComment.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=3'/>

	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatStmt4" CtlID='ctlSubcatStmt4'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryStatement.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=4'/>
	<br />
	<p>If Current Pro Bono Innovation Fund Grantees: In addition to responding to Question 4a and 4b above, this section should also describe the efforts the program has made to advance understanding and knowledge-sharing about their project’s efforts in the justice community, including any technical assistance they have provided to other LSC grantees, sessions they have hosted at national conferences and other events, etc.</p>
	<br />
	<strong>Criteria:</strong>
	<br />
	<Core:cUserCtlLoader ID="ldrInnovations" CtlID='ctlInnovations' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/InnovationsProposedCriteria.ascx'
		runat='server'/>
	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatScore4" CtlID='ctlSubcatScore4'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryScoreComment.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=4'/>

	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatStmt5" CtlID='ctlSubcatStmt5'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryStatement.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=5'/>
	<br /><br />
	<strong>Criteria:</strong>
	<br />
	<Core:cUserCtlLoader ID="ldrMeasures" CtlID='ctlMeasures' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/ProposedPerformanceMeasuresCriteria.ascx'
		runat='server'/>
	<br /><br />
	<Core:cUserCtlLoader ID="ldrSubcatScore5" CtlID='ctlSubcatScore5'
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/SubcategoryScoreComment.ascx'
		runat='server'
		Properties='CategoryNum=1&SubcategoryNum=5'/>

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
					<Control ID='ctlSubcatScore1'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSubcatScore2'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSubcatScore3'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSubcatScore4'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSubcatScore5'
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
				<Argument PropertyKey="SortOrder" Value='1'/>
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
				<Argument Group='('/>
					<Argument PropertyKey='UploadId' Value='64' Bool=''>
						<RelatedProperty PropertyKey='TaskUploadType'/>
					</Argument>
					<Argument PropertyKey='UploadId' Value='65' Bool='Or'>
						<RelatedProperty PropertyKey='TaskUploadType'/>
					</Argument>
				<Argument Group=')' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstContractSubgrantDocs'
						Type='cDataListCtl'
						Container='spnContractSubgrantDocs'
						DataObjectDefinitionKey='SubmittedFile'>
						<DisplayProperty PropertyKey='TaskUploadType.Upload.UploadName' ColumnHeader='File Type'/>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File Name'/>
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

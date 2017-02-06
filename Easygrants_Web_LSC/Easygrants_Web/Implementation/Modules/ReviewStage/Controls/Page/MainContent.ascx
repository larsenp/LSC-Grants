<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cReviewStageMainContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
      <span id='spnPageContent' runat='server' />
<br><br>
<table  border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'  id='TblIncomplete'>
	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg"><b>Validation Summary</b>
		</td>
	</tr>
	<tr>
		<td><Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>
		</td>
	</tr>
</table>	

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='TblComplete'>
	<tr>
		<td class="SeparatorHdg"><b>Review</b></td>
	</tr>
	<tr>
		<td>
		 <span runat='server' id='spnExternalReviewApplicationsList'></span>
		</td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'  >
	<tr><td></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='ExternalReviewApplicationsList' DataObjectDefinitionKey='ExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' />				
			</Filters>
			<Sort>
				<Argument PropertyKey='ApplicantName'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlExternalReviewApplicationsList'
						Container='spnExternalReviewApplicationsList'
						Type='cDataListCtl'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='25'
						IsSaveOnSort='False'
						ShowSubColumnHeaderRow='False'>		
						<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>															
							<Control ID='btnView'
								Type='cButton'
								Container='spnViewApp'
								Caption='View PDF'
								Image='view_pdf'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewPDF'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='WfTaskAssignmentID='/>												
									</Parameters>
								</Action>
							</Control>											
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='10%'>	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'>
									<RelatedProperty PropertyKey='AppWfta.GranteeProject' />
								</Argument>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.GrantTitle' ColumnHeader='ProjectTitle' Width='20%' ConfigurableHeader='True'>
							<Sortable>
									<Argument PropertyKey='GrantTitle'>	
										<RelatedProperty PropertyKey='AppWfta.GranteeProject'/>
									</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='15%'>
							<Sortable>
									<Argument PropertyKey='CommonOrganizationName'>	
										<RelatedProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization'/>
									</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Primary Contact' Width='14%'>
							<Sortable>	
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>
						</DisplayProperty>							
						<DisplayProperty PropertyKey='ReviewRating' ColumnHeader='Scores' Width='11%'>
							<Sortable>	
								<Argument PropertyKey='ReviewRating'/>
							</Sortable>	
						</DisplayProperty>							
						<DisplayProperty PropertyKey='' ColumnHeader=' ' HeaderAlign='Center' DataAlign='Center' Width='20%'>
							<Control ID='btnAddComment'
								Type='cButton' Caption='View Scores and Critiques'
								Image='Add'>
								<Action
								PostBack='True'
								Object='DataPresenter'
								Method='RedirectToModule'>
									<Parameters>																															
										<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='AppWftaID' BaseValue='AppWftaID='/>										
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>														
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

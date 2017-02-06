<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewStage.Controls.Page.cScoresandCritique" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->


<!-- Control Label (for Publication upload) -->

<!-- Page Content - Controls -->
<br>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td class="SeparatorHdg"><b>Instructions</b></td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<td><span id='spnPageContent' runat='server' /></td>
</tr>
</table>
<br>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td class="SeparatorHdg"><b>Review</b></td>
</tr>

</table>
<br>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<table id="Table4"  border='0' cellspacing='0' cellpadding='2' runat='server' width='90%'>	
	<tr>
		<td align='Center'>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />
					
		<DataObject Key='ExternalReviewApplicationsList' DataObjectDefinitionKey='ExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' />				
			</Filters>
			<Sort>
				<Argument PropertyKey='LegacyGrantID'>
					<RelatedProperty PropertyKey='AppWfta.GranteeProject' />
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='25'
						IsSaveOnSort='True'
						ShowSubColumnHeaderRow='False'>							
						<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>
							<Control ID='btnView'
								Type='cButton'
								Container='spnViewApp'
								Caption='View LOI PDF'
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
						
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.LegacyGrantID' ColumnHeader='TIG' Width='10%'>	
							<Sortable>
								<Argument PropertyKey='LegacyGrantID'>
									<RelatedProperty PropertyKey='AppWfta.GranteeProject' />
								</Argument>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='AppWfta.WfProjectTask.Description' ColumnHeader='Task' Width='19%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='AppWfta.WfProjectTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description' ColumnHeader='Assignment Type' Width='19%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
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
						<DisplayProperty PropertyKey='AppWfta.LSCTIGLOI.RequestedAmount' ColumnHeader='Amount Requested' Width='15%' Format='$#,0'>
							<Sortable>
									<Argument PropertyKey='RequestedAmount'>	
										<RelatedProperty PropertyKey='AppWfta.LSCTIGLOI'/>
									</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Primary Contact' Width='10%'>
							<Sortable>	
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>								
						</DisplayProperty>							
						<DisplayProperty PropertyKey='' ColumnHeader='Scores and Critiques' HeaderAlign='Center' DataAlign='Center' Width='10%'>
							<Control ID='btnAddComment'
								Type='cButton'
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
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnEditComment'
								Type='cButton'
								Image='Edit'>
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
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' Image='Continue' GoToNextPage='True' >
						</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>		
	</ModuleSection>
</span>

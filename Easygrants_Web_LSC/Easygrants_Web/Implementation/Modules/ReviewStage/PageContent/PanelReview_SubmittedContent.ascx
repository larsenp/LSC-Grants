<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.PageContent.cPanelReview_SubmittedContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

	
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>


<!-- USER MODIFIABLE CONTENT AREA -->
<br> 
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			<b>You have successfully submitted your panel review scores and critiques - Thank you.</b>     
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			This page lists all applications for which you have submitted scores and critiques.  The 
			columns show the name of the applicant, your score, whether or not you indicated streamline, 
			a link to view critique narratives submitted for this applicant, and a link to view the 
			applicant's full application PDF.  All of this information is being provided to you in read-only 
			format for your reference.
		</td>
	</tr> 
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span id='spnHelp' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Panel Review</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='90%'>
	<tr><td width=1%></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>
	<tr>
		<td>
			<span runat='server' id='spnClose' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>


		<DataObject Key='ReviewCommittee' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Group='('/>
					<Argument Type='Data' 
						TypeKey='ReviewAssignmentTypeID' 
						PropertyKey='ReviewAssignmentTypeID' 
						Value='1' 
						Bool=''/>
					<Argument Type='Data' 
						TypeKey='ReviewAssignmentTypeID' 
						PropertyKey='ReviewAssignmentTypeID' 
						Value='2' 
						Bool='Or'/>
					<Argument Type='Data' 
						TypeKey='ReviewAssignmentTypeID' 
						PropertyKey='ReviewAssignmentTypeID' 
						Value='3' 
						Bool='Or'/>
				<Argument Group=')' Bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' 
					Value='' 
					Bool='And'/>				
			</Filters>
		</DataObject>	
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>			
			</Filters>
		</DataObject>
	  
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>	
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />

			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='' ColumnHeader='Application'>
							<Control ID='btnView'
								Type='cButton'
								Image='view_pdf'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewAppPDF'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='EntityID='/>
											<Argument Type='DataObjectCollection'
												TypeKey='WfTaskAssignmentList'
												DataObjectPropertyKey='WfTask.WfTaskModule.ReportOutputDefinitionID'
												PropertyKey='DefinitionID'
												BaseValue=''/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName' ColumnHeader='Applicant Name'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='MiddleName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewRating' ColumnHeader='Score'>
							<Control ID='ctlScore'
								Type='cLabel'>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Streamlined' Format='YesNo' ColumnHeader='Streamline?'>
							<Control ID='ctlStreamlined'
								Type='cLabel'>
							</Control>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Comment'>
							<Control ID='btnViewComment'
								Type='cButton'
								Image='View'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='ViewComment'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue=''/>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue=''/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue=''/>
										<Argument Type='DataObjectRelated' TypeKey='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' AttributeName='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' BaseValue=''/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<!--
						<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WFTAID' />
						-->
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control Container='spnHelp' 
						ID='ctlHelp'
						Type='cLink'
						Caption='Click here to view Guidelines for Review.'>
						<Action
							PostBack='False'
							Target='_blank'
							URL='/Easygrants_v4_AHA_r1/Implementation/Modules/Application/Help/Guidelines Placeholder Page.pdf'> 
						</Action>		
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Home' />
								<Argument Value='HomeModuleConfig' />
								<Argument Value='Home' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>							
			</DisplayProperties>
		</DataObject>	
	
	
	</ModuleSection>
</span>



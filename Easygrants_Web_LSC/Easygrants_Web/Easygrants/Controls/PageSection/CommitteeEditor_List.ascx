<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cEGDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnReviewCommitteeMember'/>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAddNewReviewer' visible='false'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave' visible='false'/>	
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel' visible='false'/>	
	</td>
</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCommittee' DataObjectDefinitionKey='ReviewCommittee' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCommitteeID'
					PropertyKey='ReviewCommitteeID' 
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCommitteeMembers'>
					<Control ID='ctlReviewCommitteeMember'
						Container='spnReviewCommitteeMember'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='Person'
						DisplayValue='LastNameFirstName'
						StoredValue='PersonID'
						StoredDisplayValue='Person.LastNameFirstName' 
						Height='9'
						DisplayNone='False'
						DisplayMoveAll='True'>
						<Filters>
							<Argument Type='Data' TypeKey='' PropertyKey='IsReviewer' Value='1'/>
						</Filters>
						<Sort>
	                        <Argument PropertyKey='LastName' Direction='Ascending'/>   
	                    </Sort>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' Value=''/>
							<Argument PropertyKey='ReviewerRoleID' Value='1'/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddReviewer' Container='spnAddNewReviewer' Type='cLink' Caption='Add New Reviewer'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PersonEditor' />
								<Argument Type='' TypeKey='' AttributeName='' Value='PersonID=0' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Committees'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Committees'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>

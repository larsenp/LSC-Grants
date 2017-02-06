<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cEGDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="True" %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<!--Instructions-->
<table border='0' width='100%' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td>
			When you are finished viewing your comments, you can click <B>Close</B> 
			to return to the Assigned Applications list page.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg"><b>Comments</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<B>Institution:</B> <span id='spnInstitution' runat='server'/>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span id='spnComments' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!--Close-->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' >	
			<Filters>	
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>	
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnInstitution' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' >	
			<Filters>	
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>	
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='spnComments' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<!-- Save, Close buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							AutoSave='False'
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURLWithAnchor'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
								<Argument Type='Data' BaseValue='List'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
</span>
<!-- End Embedded XML -->
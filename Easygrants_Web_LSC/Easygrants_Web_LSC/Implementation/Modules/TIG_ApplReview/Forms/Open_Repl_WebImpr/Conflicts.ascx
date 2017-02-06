<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
	Src='Implementation/Modules/TIG_ApplReview/Forms/ReviewInfo.ascx'
	runat='server'/>
	
<div class='SeparatorHdg'>Conflicts</div>
<br />
	<b>Disclosure of Potential Conflicts and Acknowledgement of Necessary Conflicts Controls</b>
<br /><br />
<table cellpadding='1' width='700'>
	<tr>
		<td><p>Applicants must disclose any actual or potential conflicts for their proposed projects. Please view the <a href='http://www.lsc.gov/sites/default/files/TIG_2013_Conflicts_Policy_FINAL.pdf' target="_blank">TIG program's current conflicts policy</a> for guidance on whether a potential conflict exists. </p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>1. Indicate whether any actual or potential conflicts exist for this proposed project.<font color='red'>*</font></b></td></tr>
	<tr><td><span runat='server' id='spnConflictsExist' /></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>If there are potential conflicts, discuss how your program will address them if awarded funding.</b></td></tr>
	<tr><td><span runat='server' id='spnAddressConflicts' /></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>2. Describe your program’s capacity to protect against any conflicts that may arise during the grant.<font color='red'>*</font></b></td></tr>
	<tr><td><span runat='server' id='spnCapacityProtectConflicts' /></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>All TIG grantees are required to comply with the <a href='http://www.lsc.gov/sites/default/files/TIG_2013_Conflicts_Policy_FINAL.pdf' target="_blank">TIG program's Disclosure of Interests for Determination of Conflicts Policy</a> throughout the grant term if awarded TIG funds (please <a href='http://tig.lsc.gov/grants/compliance' target=_blank> see the TIG Compliance page</a> for more information about the conflicts policy). Click the box below if you agree to comply.</td></tr>
	<tr><td>&nbsp;</td></tr>
	<%--<tr><td><span runat='server' id='spnComplyConflictsPolicy' />&nbsp;&nbsp;&nbsp;<b>Our program has reviewed and will comply with the TIG program's Disclosure of Interests for Determination of Conflicts Policy throughout the grant term if awarded TIG funds.<font color='red'>*</font></b></td></tr>--%>
</table>
<br />
<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
<br />
<span runat='server' id='spnConflictsCommentOther' />
<br />
<div class='MinorSeparatorHdg'>Your Comments</div>
<br />
<span runat='server' id='spnStmtConflictsComment' />
<br /><br />
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='ConflictsExist' Format='YesNo'>
					<Control ID='spnConflictsExist' 
					         Type='HtmlGenericControl' />
				</DisplayProperty>
				 <DisplayProperty PropertyKey='AddressConflicts' >
					<Control ID='spnAddressConflicts' 
					         Type='HtmlGenericControl' />
				</DisplayProperty>
				 <DisplayProperty PropertyKey='CapacityProtectConflicts' >
					<Control ID='spnCapacityProtectConflicts' 
					         Type='HtmlGenericControl' />
				</DisplayProperty>
				 <%--<DisplayProperty PropertyKey='ComplyConflictsPolicy' Format='YesNo' >
					<Control ID='spnComplyConflictsPolicy' 
					         Type='HtmlGenericControl' />
				</DisplayProperty>--%>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImpr' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ConflictsComment'>
					<Control ID='txtStmtConflictsComment'
						Type='cTextArea'
						Container='spnStmtConflictsComment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImprOther' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Operator='NotEqual'/>
				<Argument Type='Data' PropertyKey='WfTaskID' Value='43' >
				   <RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlConflictsCommentOther'
						Type='cDataListCtl'
						Container='spnConflictsCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='ConflictsComment' ColumnHeader='Comment' >
							<Control ID='lblConflictsComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>

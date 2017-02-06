<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ScoreEditor.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cScoreEditorImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br />
<br />
<Core:cUserCtlLoader CtlID='ReviewStageInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ReviewInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewInfo.ascx'
	runat='server'/>

 <asp:CustomValidator 
				id='valOptionConflict'
				runat='server'
				Enabled='False'
				ErrorMessage=''
				Display='Dynamic'/>	
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2' class='SeparatorHdg'><b>Conflict and Preference Editor</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			To modify an <i>external</i> Conflict/Preference, select the Type and then select 
			the appropriate Conflict/Preference Type from the drop-down.
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Type</b></td>
		<td><span runat='server' id='spnRC'></span></td>
	</tr>	
	<tr>
		<td><b>Conflict Type</b>&nbsp;&nbsp;</td>
		<td><span runat='server' id='spnReviewConflictType'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center' colspan='2'>
			<span runat='server' id='spnSave2'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class='SeparatorHdg'><b>Edit Score and Comments</b></td>
	</tr>
	<tr><td>Use the following scoring system to rate:</td></tr>
	<tr><td>&nbsp;</td></tr>
	<%--<tr>
		<td colspan='2'>
			HHMI uses the following scoring system to rate applications:  
			A = 1, B = 2, C = 3, D = 4, F = 5.
		</td>
	</tr>	--%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Scoring Scale</b></td>
		<td>5 (best) to 1 (worst)</td>
	</tr>
	<tr><td height='6px'>&nbsp;</td></tr>
	<tr>
		<td><b>Score</b></td>
		<td><span runat='server' id='spnScore'></span></td>
	</tr>	
	<tr>
		<td valign='top'>
			<b>Reviewer Comments</b>
		</td>
		<td>
			<span runat='server' id='spnPrivateCritique'></span>
		</td>
	</tr>	
	<tr>
		<td valign='top' class='FieldLabel'></td>
		<td>
			Limit: 5000 characters
		</td>
	</tr>	
	<tr>
		<td valign='top'>
			<b>Staff Edited Comments</b>
		</td>
		<td>
			<span runat='server' id='spnPublicCritique'></span>
		</td>
	</tr>	
	<tr>
		<td valign='top' class='FieldLabel'></td>
		<td>
			Limit: 5000 characters
		</td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewPreferenceTypeID'>
					<Control ID='ctlRC'
						Container='spnRC'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RequiredField='False'
						RepeatColumns='0'>
						<Validation Type='Custom' Object='EventController' Method='ValidatePreferenceType' ErrorMessage='You indicated a conflict. Conflict Type is required.' />
						<Parameters>
					        <Parameter StoredValue='1' DisplayValue='Able'/>
					        <Parameter StoredValue='2' DisplayValue='Not Able'/>
					        <Parameter StoredValue='3' DisplayValue='Preferred'/>
					        <Parameter StoredValue='4' DisplayValue='Conflict'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewConflictTypeID'>
					<Control ID='ctlReviewConflictType'
						Container='spnReviewConflictType'
						Type='cDropDown'
						DataObjectDefinitionKey='ConflictType'
						StoredValue='ConflictTypeID'
						DisplayValue='Description'
						RequiredField='False'
						DisplayNone='True'>
						<Validation Type='Custom' Object='EventController' Method='ValidateConflictType' ErrorMessage='You did not indicate a conflict but entered a conflict type. Remove the Conflict Type.' />
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ReviewRating'>
					<Control ID='ctlScore'
						Container='spnScore'
						Type='cTextBox'
						Size='4'
						MaxLength='4'>
						<Validation Type='RegularExpression' ValidationExpression='^([1-4](\.\d{0,2})?)|(5(\.0{0,2})?)$' ErrorMessage='Enter a valid Score (e.g., 1.0, 2.0, 3.0, 4.0 or 5.0). Your score may not exceed two decimal places.'/>
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
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
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
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave2'
						Container='spnSave2'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlPrivateCritique'
						Container='spnPrivateCritique'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='5000'
						TooLongMessage='The text length in the text area is too long.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PublicCritique'>
					<Control ID='ctlPublicCritique'
						Container='spnPublicCritique'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='5000'
						TooLongMessage='The text length in the text area is too long.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

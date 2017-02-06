<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Contact_ReviewerInfo_EditorImpl.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cContact_ReviewerInfo_EditorImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"  %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!--To add this contact to the reviewer database, click on the checkbox.  Add/Enter information specific to 
this reviewer.  To Save the information, click on the <b>Save</b> button.  To close this page and return 
to the Reviewer Information page, click on the <b>Close</b> button. <b>IMPORTANT:</b> If you close or 
navigate off this page before you save, you will lose unsaved information. -->
<br><br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Reviewer Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Person:&nbsp;&nbsp;</b><span runat='server' id='spnPerson'/></td></tr>
</table>


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
		Add this person to the reviewer list?&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnIsReviewer' runat='server'></span>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='150'><b>Status</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnReviewerStatus' runat='server'></span>
		</td>
	</tr>
	<tr>
		<td><b>Start Date</b></td>
		<td><span id='spnStartDate' runat='server'></span>
		</td>
	</tr>
	<tr>
		<td width='10'>&nbsp;</td>
		<td>mm/dd/yyyy</td>
	</tr>
	<tr>
		<td><b>End Date</b></td>
		<td><span id='spnEndDate' runat='server'></span>
		</td>
	</tr>
	<tr>
		<td width='10'>&nbsp;</td>
		<td>mm/dd/yyyy</td>
	</tr>
	<tr>
		<td valign='top'><b>Area of Expertise&nbsp;</b><%=kDenoteRequiredField%></td>
		<td>&nbsp;</span>
		</td>
	</tr>
	<tr>
		<td valign='top'>&nbsp;</td>
		<td><span id='spnExpertise' runat='server'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<span runat='server' id='spnSaveAndClose'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>	
	</td>
</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
			
		<DataObject Key='PersonReviewer' DataObjectDefinitionKey='PersonReviewer' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID'
					PropertyKey='PersonID' 
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewerStatusID'>
					<Control ID='ctlReviewerStatus'
						Container='spnReviewerStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='ReviewerStatus'
						StoredValue='ReviewerStatusID'
						DisplayValue='Abbr'
						Required='True'
						ErrorMessage='Status is required.'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='Abbr' Direction='Ascending'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage="The Start Date must be in MM/DD/YYYY format.">
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage="The End Date must be in MM/DD/YYYY format.">
					</Control>
				</DisplayProperty>
				<!--
				<DisplayProperty PropertyKey='AreaExpertise'>
					<Control ID='ctlAreaExpertise'
						Container='spnAreaExpertise'
						Type='cTextBox'
						Size='50'
						MaxLength='250'
						RequiredField='True'
						ErrorMessage='Area of Expertise is required.'>
					</Control>
				</DisplayProperty>
				-->
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID'
					PropertyKey='PersonID' 
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>		
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPerson'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsReviewer'>
					<Control ID='ctlIsReviewer'
						Container='spnIsReviewer'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Primary'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonReviewerExpertise'>
					<Control ID='CtlExpertise'
						Container='spnExpertise'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='ResearchArea'
						DisplayValue='Description'
						StoredValue='ResearchAreaID'
						StoredDisplayValue='ResearchArea.Description' 
						Height='15'
						Sort='True'
						MinSelected='1'
						TooFewMessage='Area of Expertise is required.'
						DisplayNone='False'
						DisplayMoveAll='True'
						DisplaySort='False'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton' EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
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
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
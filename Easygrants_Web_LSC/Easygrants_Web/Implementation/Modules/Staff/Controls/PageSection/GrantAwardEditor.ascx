<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GrantAwardEditor.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantAwardEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->

<!-- Page Content - Controls -->
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='4' class="SeparatorHdg"><b>Add or Edit Initial Award</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='12%'><b>Initial Award Date&nbsp;<%=kDenoteRequiredField%></b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAwardDate' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	    <td class='FieldLabel' nowrap='true'>mm/dd/yyyy</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Initial Award Amount&nbsp;<%=kDenoteRequiredField%></b></td>
		<td width='10'>$&nbsp;</td>
		<td><span id='spnAwardAmount' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table id="Table5" border='0' cellspacing='0' cellpadding='2' align='center' runat='server' width='100%'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td align='center'>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;
		<span runat='server' id='spnSaveAndClose'/>&nbsp;&nbsp;
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>
</table>

<Core:cUserCtlLoader ID="CUserCtlLoader5" CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProject&QueryStringKey=GranteeProjectID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   
	    <DataObject Key='GrantAwardEditorGrantAwardAndAmendment' DataObjectDefinitionKey='GrantAwardAndAmendment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GrantAwardAndAmendmentID' PropertyKey='GrantAwardAndAmendmentID' Value='' />
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />  
			    <Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/> 
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='InitialAwardDate'>
					<Control ID='ctlAwardDate'
						Type='cDateTextBox'
						Container='spnAwardDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage='Award Date must be in MM/DD/YYYY format.'
						RequiredField='True'
						ErrorMessage='Award Date is required.'>
					</Control>
				</DisplayProperty> 
			    <DisplayProperty PropertyKey='InitialAwardAmount'>
					<Control ID='ctlAwardAmount'
						Container='spnAwardAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0.00'
						Size='20'
						RequiredField='True'
						ErrorMessage='Award Amount is required.'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='Award Amount requires a valid currency format (Example: $100,000.00).'
						DecimalErrorMessage='Award Amount requires a valid currency format (Example: $100,000.00).'
						CommaErrorMessage='Award Amount requires a valid currency format (Example: $100,000.00).'>
					</Control>
				</DisplayProperty>    
			</DisplayProperties>
		</DataObject>
		 <DataObject Key='GrantAwardEditorGranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DefaultValues>
			    <Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/> 
			</DefaultValues>
		</DataObject> 
		<DataObject Key='GrantAwardEditorGranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			 <DefaultValues>
				 <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				 <Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				 <Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				 <Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				 <Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/> 
			</DefaultValues>
			
		</DataObject>
	    <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='GrantAwardEditorGrantAwardAndAmendment' DataObjectPropertyKey='GrantAwardAndAmendmentID' PropertyKey='GrantAwardAndAmendmentID' BaseValue='GrantAwardAndAmendmentID='/>
							</Parameters>
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
</span>
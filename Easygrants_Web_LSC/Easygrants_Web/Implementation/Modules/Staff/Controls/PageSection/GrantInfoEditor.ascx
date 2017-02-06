<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GrantInfoEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantInfoEditorImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->

<!-- Page Content - Controls -->
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
    <tr><td>&nbsp;</td></tr>
	<tr>
		<td  class="SeparatorHdg"><b>Edit Grant Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server'>
    <tr>
		<td><b>Grantee <%=GetLabel("Organization")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2">
		<Core:cUserCtlLoader CtlID='ctlOrg'
				Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' Properties='Origin=Organization'
				runat='server' ID="Cuserctlloader2"/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Primary Contact/PI&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2">
		<Core:cUserCtlLoader CtlID='ctlPer' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' Properties='Origin=Person'
				runat='server'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td><b><%=GetLabel("ProjectTitle")%>&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTitle' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("ProjectDescription")%> </b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProjDesc' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td><b><%=GetLabel("GrantProjectTerm")%></b> </td>
		<td width='10'>&nbsp;</td>
		<td><span runat='server' id='spnStart'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnEnd'/></td>
	</tr>			
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td>(Start Date - mm/dd/yyyy)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		(End Date - mm/dd/yyyy)
			  <asp:CustomValidator 
				id='valGranteeProjTerm1'
				runat='server'
				OnServerValidate='ValGranteeProjTerm'
				ErrorMessage='The ~~GrantProjectTerm~~ End Date must be greater than the the grantee project term start date.'
				Display='None'/>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("GrantRequestedAmount")%></b>
		</td>
		<td width='10'>$&nbsp;</td>
		<td><span id='spnRequestedAmount' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Status&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStatus' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>
		
	<tr>
		<td><b>Outcome </b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOutcome' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>			
	<tr>
		<td><b>Subject Area </b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnSubjectArea' runat='server'/>
		    <asp:CustomValidator 
				id='valSubjectArea'
				runat='server'
				OnServerValidate='ValidatevalSubjectArea'
				ErrorMessage='Subject Area Other is required.'
				Display='None'/>
		</td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Other </b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOther' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td>If other, enter the subject area.</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td colspan='5'><b>Focus Area(s) </b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		
		<td>&nbsp;</td>
		<td colspan='4'>
			<span id='spnResearchAreas' runat='server'/>
			<asp:CustomValidator 
				id='valResearchArea'
				runat='server'
				OnServerValidate='ValidateResearchArea'
				ErrorMessage='Focus Areas(s) Other is required.'
				Display='None'/>
		</td>
	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Other </b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnResearchOther' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td>If other, enter the focus area.</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/>
			<!-- Reset Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSaveAndClose'/>	
			<!-- Cancel Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>

<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProject&QueryStringKey=GranteeProjectID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GrantInfoGranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' 	Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>		
			    <DisplayProperty PropertyKey='PrimaryOrganizationID' PropertyValue='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='ctlOrg' LabelText='Selected ~~Organization~~ '
					Type='cPopUpSelectorLauncher'
					RequiredField='True'
					ErrorMessage='Grantee ~~Organization~~ is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPersonID' PropertyValue='PrimaryPerson.LastNameFirstNameMiddleNameCommaSep'>
					    <Control ID='ctlPer' Type='cPopUpSelectorLauncher' RequiredField='True' LabelText='Selected Contact '
						    ErrorMessage='Primary Contact/PI is required.' >						   
						</Control>   
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantTitle'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='45'
						MaxLength='300'
						RequiredField='True'
						ErrorMessage='~~ProjectTitle~~ is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantDescription'>
					<Control ID='ctlProjDescription'
						Container='spnProjDesc'
						Type='cTextArea'
						Rows='5'
						Cols='50'
						MaxLength='1000'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestAmount'>
					<Control ID='ctlRequestedAmount'
						Container='spnRequestedAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0.00'
						Size='20'
						RequiredField='False'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='~~GrantRequestedAmount~~ must contain only digits, commas, and hyphens.'
						DecimalErrorMessage='~~GrantRequestedAmount~~ must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted.'>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='GrantStatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantStatus'
						StoredValue='GrantStatusID'
						DisplayValue='Abbr'
						RequiredField='True' DisplayText='Select'
						ErrorMessage='Status is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProjectOutcomeID'>
					<Control ID='CtlOutcome'
						Container='spnOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantOutcome'
						StoredValue='GrantOutcomeID'
						DisplayValue='Description' >						
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjectResearchArea'>
					<Control ID='CtlResearchAreas'
						Container='spnResearchAreas'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='ResearchArea'
						DisplayValue='Description'
						StoredValue='ResearchAreaID'
						StoredDisplayValue='ResearchArea.Description' 
						Height='15'
						Sort='True'
						DisplayNone='False'
						DisplayMoveAll='True'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='OtherResearchArea'>
					<Control ID='ctlResearchOther'
						Container='spnResearchOther'
						Type='cTextBox'
						Size='45'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProjectResearchCategory' DataObjectDefinitionKey='GranteeProjectResearchCategory' Updatable='True' CreateNew='True'>
		    <Filters>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
		    </Filters>	
		    <DefaultValues>
				 <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
		    <DisplayProperties>	
			    <DisplayProperty PropertyKey='ResearchCategoryID'>
				    <Control ID='CtlSubjectArea'
					    Container='spnSubjectArea'
					    Type='cDropDown'
						DataObjectDefinitionKey='ResearchCategory'
						DisplayValue='Description'
						StoredValue='ResearchCategoryID'
						StoredDisplayValue='ResearchCategory.Description'>
					   <Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
				    </Control>
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='OtherResearchCategory'>
					<Control ID='ctlOther'
						Container='spnOther'
						Type='cTextBox'
						Size='45'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
		    </DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>				
				<DisplayProperty PropertyKey='DurationStart'>
					<Control ID='ctlStart'
						Type='cDateTextBox'
						Container='spnStart'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='False'
						NotSupportedDateErrorMessage='Grant Project Term Start Date must be in MM/DD/YYYY format.'
						ErrorMessage='Start date for Budget Period is required.'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='DurationEnd'>
					<Control ID='ctlEnd'
						Type='cDateTextBox'
						Container='spnEnd'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='False'
						NotSupportedDateErrorMessage='Grant Project Term End Date must be in MM/DD/YYYY format.'
						ErrorMessage='End date for Budget Period is required.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<!-- Save Reset and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'>
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
		<UserCtlLoader>
		    <ctlOrg>
				<DataObject Key='OrganizationID' DataObjectDefinitionKey='Organization'>
					<SearchProperties>
						<SearchProperty DisplayValue='CommonOrganizationName'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='CommonOrganizationName'/>
					</DisplayProperties>
				</DataObject>
			</ctlOrg>
			<ctlPer>
				<DataObject Key='PersonID' DataObjectDefinitionKey='Person' DisplayName='Person last'>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='LastNameFirstNamePrimInst'/>
					</DisplayProperties>
				</DataObject>
			</ctlPer>
		</UserCtlLoader>							
	</ModuleSection>
</span>
<!-- End Embedded XML -->

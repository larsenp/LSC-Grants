<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GrantInfoEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantInfoEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
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

<table id="Table2" border='0' cellspacing='0' cellpadding='0' runat='server'>
    <tr>
		<td><b>Grantee Organization</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2">
		<Core:cUserCtlLoader CtlID='ctlOrg'
				Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' Properties='Origin=Organization'
				runat='server' ID="Cuserctlloader2"/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Primary Contact</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2">
		<Core:cUserCtlLoader CtlID='ctlPer' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' Properties='Origin=Person'
				runat='server'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td><b>Project Title</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTitle' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top'><b>Project Description </b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProjDesc' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td><b>Grantee Project Term</b> </td>
		<td width='10'>&nbsp;</td>
		<td><span runat='server' id='spnStart'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnEnd'/></td>
	</tr>			
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>(Start Date - mm/dd/yyyy)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		(End Date - mm/dd/yyyy)
			  <asp:CustomValidator 
				id='valGranteeProjTerm1'
				runat='server'
				OnServerValidate='ValGranteeProjTerm'
				ErrorMessage='The Grantee Project Term End Date must be greater than the the grantee project term start date.'
				Display='None'/>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Requested Amount</b>
		</td>
		<td width='10'>$&nbsp;</td>
		<td><span id='spnRequestedAmount' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<%--<tr>
		<td><b>Award Amount </b>
		</td>
		<td width='10'>$&nbsp;</td>
		<td><span id='spnAwardAmount' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>--%>
	<tr>
		<td><b>Award Date </b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnAwardDate' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Status&nbsp;<%=kDenoteRequiredField%></b>
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
		<td><b>Recommended Amount</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnRAmt' runat='server'/></td>
		<td width='10'>&nbsp;</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Original Amount</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnOriginalAmt' runat='server'/></td>
		<td width='10'>&nbsp;</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Grant Amount</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnGrantAmt' runat='server'/></td>
		<td width='10'>&nbsp;</td>	
	</tr>			
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProject&QueryStringKey=GranteeProjectID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table id="Table3" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/>
			<!-- Reset Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnReset'/>	
			<!-- Cancel Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSaveAndClose'/>&nbsp;
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
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
			    <DisplayProperty PropertyKey='PrimaryOrganizationID' PropertyValue='PrimaryOrganization.OrganizationName'>
					<Control ID='ctlOrg' LabelText='Selected Organization '
					Type='cPopUpSelectorLauncher'
					RequiredField='True'
					ErrorMessage='Grantee Organization is required.'/>
				</DisplayProperty>
				  <DisplayProperty PropertyKey='PrimaryPersonID' PropertyValue='PrimaryPerson.LastNameFirstName'>
					    <Control ID='ctlPer' 
							Type='cPopUpSelectorLauncher' 
							LabelText='Selected Contact '/>
				 </DisplayProperty>			
				
				<DisplayProperty PropertyKey='GrantTitle'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='45'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantDescription'>
					<Control ID='ctlProjDescription'
						Container='spnProjDesc'
						Type='cTextArea'
						Rows='3'
						Cols='50'>
						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestAmount'>
					<Control ID='ctlRequestedAmount'
						Container='spnRequestedAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0'
						Size='20'
						RequiredField='False'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='Request amount must contain only digits, commas, and hyphens.'
						DecimalErrorMessage='Request amount must be a whole number with no decimal point.'
						CommaErrorMessage='Commas are improperly formatted.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='GrantAwardDate'>
					<Control ID='ctlAwardDate'
						Type='cDateTextBox'
						Container='spnAwardDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='False'
						ErrorMessage='Please enter a start date for Budget Period.'>
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
						DisplayValue='Description'  >						
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantAwardAndAmendment.InitialAwardAmount' Format='$#,#'>
					        <Control ID='spnOriginalAmt'
						        Type='HtmlGenericControl'>
					        </Control>
				</DisplayProperty>
		    </DisplayProperties>
		</DataObject>
		<DataObject Key='LscGranteeProjectTig' DataObjectDefinitionKey='LscGranteeProjectTig'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>	
			    <DisplayProperty PropertyKey='RecommendedAmount' Format='$#,0'>
					        <Control ID='spnRAmt'
						        Type='HtmlGenericControl'>
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
				<DisplayProperty PropertyKey='AwardAmount' Format='$#,#'>
					<Control ID='spnGrantAmt'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DurationStart'>
					<Control ID='ctlStart'
						Type='cDateTextBox'
						Container='spnStart'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='False'
						ErrorMessage='Please enter a start date for Budget Period.'>
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
						ErrorMessage='Please enter an end date for Budget Period.'>
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
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantInfoEditor'/>															
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>																	
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
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
		<UserCtlLoader>
		    <ctlOrg>
				<DataObject Key='OrganizationID' DataObjectDefinitionKey='Organization'>
					<SearchProperties>
						<SearchProperty DisplayValue='OrganizationName'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='OrganizationName'/>
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

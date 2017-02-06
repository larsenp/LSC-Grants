<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Application.Controls.PageSection.cParticipantKeyPersonnelEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
	<br>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='2'><b>Participating <%=GetLabel("Organization")%></b></td>
	</tr>	
	<tr><td  colspan='2'>&nbsp;</td></tr>
	<tr>
		<td width='10%'><%=GetLabel("Organization")%>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnOrgSelectLauncher' runat='server'/></td>
	</tr>	
</table>
<br>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='4'><b>Other Key Personnel Information</b></td>
	</tr>	
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
		<td	width='10%'><b>Name</b></td>
		<td colspan='3'><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>
		<td></td>
		<td  colspan='3'>Prefix</td>	
	</tr>	
	<tr>
		<td width='10%'></td>
		<td width='15%'><span id='spnFirst' runat='server'/></td>
		<td width='10%'><span id='spnMiddle' runat='server'/></td>
		<td width='65%'><span id='spnLast' runat='server'/></td> 	
	</tr>
	<tr>
		<td></td>	
		<td>First&nbsp;<%=kDenoteRequiredField%></td>
		<td>Middle</td>
		<td>Last&nbsp;<%=kDenoteRequiredField%></td>
	</tr>	
	<tr>
		<td></td>
		<td  colspan='3'><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>		
		<td></td>
		<td  colspan='3'>Suffix</td>	
	</tr>
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
		<td	width='10%'><b>Project Role&nbsp;<%=kDenoteRequiredField%></b></td>
		<td colspan='3'><span id='spnProjectRole' runat='server'/></td>
	</tr>
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
		<td	width='10%'><b>Position Title</b></td>
		<td colspan='3'><span id='spnTitle' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'  colspan='3'>Position Title (e.g. Provost, Department Head, Vice President)</td>
	</tr>
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
		<td	width='10%'><b>Phone &nbsp;<%=kDenoteRequiredField%> &nbsp;(Business)</b></td>
		<td><span id='SpnPhone' runat='server'/></td>		
		<td colspan='2'><span id='SpnExtension' runat='server'/></td>
	</tr>
	<tr>
		<td	width='10%'></td>
		<td>(Enter numbers only)</td>		
		<td colspan='2'>Extension</td>
	</tr>
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
		<td	width='10%'><b>E-mail &nbsp;<%=kDenoteRequiredField%> &nbsp; (Business)</b></td>
		<td colspan='3'><span id='spnEmail' runat='server'/><span id='spnLblEmail' runat='server' /></td>
	</tr>
	<tr runat='server' id='TrEmailInst'>
		<td>&nbsp;</td>
		<td class='FieldLabel'  colspan='3'>(Every individual entered must have a unique e-mail.)</td>
	</tr>	
</table>
<br><br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table10">
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/><span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='0'  width='100%'  runat='server' ID="TblInstructions">	
	<tr>
		<td  class="SeparatorHdg" colspan='2'><b>Uploads</b></td>
	</tr>
		<tr>
		<td>&nbsp;</td>
	</tr>	
	<tr>
		<td><span id='spnUploadsList' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
	
	<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='ParticipantOtherKeyPersonnelEditorGranteeProjectAdditionalContact' DataObjectDefinitionKey='GranteeProjectAdditionalContact' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectAdditionalContactID' PropertyKey='GranteeProjectAdditionalContactID' Value='' 	Bool=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool='And'/>
				<Argument Type='' TypeKey='' PropertyKey='GrantContactCategoryID' Value='1' Bool='And'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='StaffPersonID'/>
				<Argument Type='' TypeKey='' PropertyKey='GrantContactCategoryID' Value='1'/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
					<Control ID='ctlOrgSelectLauncher' 
					Type='cOrgSelectLauncherNotInList'
					Container='spnOrgSelectLauncher'
					HiddenValueKey='OrganizationID'
					DataObjectDefinitionKey='Organization'
					StoredValue='OrganizationID'
					DisplayValue='CommonOrganizationName'
					RequiredField='True' ErrorMessage='~~Organization~~ is required.'	/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayValue='Prefix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='100'
						RequiredField='True' ErrorMessage='First name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
						MaxLength='75'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True' ErrorMessage='Last name is required.'>
					</Control>
				</DisplayProperty>																		
				<DisplayProperty PropertyKey='SuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayValue='Suffix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContactTypeID'>
					<Control ID='ctlProjectRole'
						Container='spnProjectRole'
						Type='cDropDown'
						DataObjectDefinitionKey='GrantContactType'
						StoredValue='GrantContactTypeID'
						DisplayValue='Description'
						RequiredField='True' ErrorMessage='Project Role is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='45'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhone'
						Container='SpnPhone'
						Type='cTextBox'
						Size='15'
						MaxLength='50'
						RequiredField='True' ErrorMessage='Phone is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='Extension'>
					<Control ID='ctlExtension'
						Container='SpnExtension'
						Type='cTextBox'
						Size='8'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlLblEmail'
						Container='spnLblEmail'
						Type='cLabel'>						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='ctlEmail' Type='cEmailTextBox' Container='spnEmail' Size='45' MaxLength='100'
						RequiredField='True' ErrorMessage='E-mail Address is required.'
						RexErrorMessage='E-mail Address is incorrectly formatted. Use the following format to enter the e-mail address: test@test.edu or test@test.edu.au.'>						
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable=''>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable=''>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='GranteeProject'
					DataObjectPropertyKey='WfProjectID'
					PropertyKey='WfProjectID'
					Value='' 
					bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskID'
					PropertyKey='WfTaskID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='WfProjectTaskUpload' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable=''>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' 
					DataObjectPropertyKey='WfProjectTaskID' PropertyKey='WfProjectTaskID'
					Value='' bool=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='IncludeInTask' Value='True'/>
				<Argument Type='Data' TypeKey='' PropertyKey='GeneralUpload' Value='True'/>	
				<Argument Type='Data' TypeKey='' PropertyKey='GeneralUploadCategoryTypeID' Value='1'/>
				<Argument Type='Data' TypeKey='' PropertyKey='GeneralUploadCategoryID' Value='1'/>			
			</Filters>
			<Sort>
				<Argument PropertyKey='UploadName'>
					<RelatedProperty PropertyKey='Upload'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlUploadsList'
						Container='spnUploadsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskUpload'
						NoRecordMessage='No task uploads.'
						ShowColumnHeaderRow='False'
						HideBlankRow='True'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Upload.UploadName' ColumnHeader=' ' >
							<Control ID='btnUpload' CaptionKey='Upload.UploadName'
								Type='cButton'>
								<Action
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='NavigateToUploadEditor'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ParticipantUploadEditor'/>
										<Argument Type='DataObject' TypeKey='UploadID' AttributeName='UploadID' BaseValue='' />
										<Argument Type='DataObjectCollection' TypeKey='ParticipantOtherKeyPersonnelEditorGranteeProjectAdditionalContact' DataObjectPropertyKey='GranteeProjectAdditionalContactID' AttributeName='GranteeProjectAdditionalContactID' BaseValue='GranteeProjectAdditionalContactID=' />
										<Argument Type='' TypeKey = '' Value='1' />
										<Argument Type='' TypeKey = '' Value='1' />
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
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='False'							
							Object='DataPresenter'
                            Method='SaveUser_PageReload'>
                            <Parameters>								
								<Argument Type='Control' TypeKey = 'ctlEmail' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlFirst' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlMiddle' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlLast' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlPrefix' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlSuffix' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='Control' TypeKey = 'ctlPhone' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlExtension' ControlPropertyKey='Value' Value='' />
								<Argument Type='' TypeKey = '' Value='1' />	
								<Argument Type='' TypeKey = '' Value='ParticipantKeyPersonnelEditor' />	
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>	
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton' Caption='Cancel'
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
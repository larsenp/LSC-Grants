<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PublicationsEditor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cPublicationsEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<br />
<br />

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />

<br />

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Publications</b></td>
	</tr>
	<tr><td><span id='spnUploadbtn' runat='server'/></td></tr>
</table>

<br />

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td	width="15%"><b>Publication Title&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnArticleTitle' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td	width="15%"><b>Published Year&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnPublicationYear' runat='server'/></td>
	</tr>
	<tr>
		<td	width="15%" align="right"></td>
		<td>yyyy</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td	width="15%"><b>Publication Type&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnPublicationType' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td	width="15%"><b>Publication Status&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnPublicationStatus' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td	width="15%"><b>&nbsp;URL</b></td>
		<td><span id='spnUrl' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td	width="15%" valign='Top'><b>&nbsp;Description</b></td>
		<td><span id='spnDescription' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td class="SeparatorHdg"><b>Upload Publication</b></td>
	</tr>
</table>

<br />
	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td	width="15%"><b>&nbsp;Upload Publication</b></td>
		<td><span id='spnUpload' runat='server'/></td>
	</tr>
</table>

<br />
<br />

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td align="center">
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectPublications' DataObjectDefinitionKey='GranteeProjectPublications' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectPublicationsID'
					PropertyKey='GranteeProjectPublicationsID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			  	<DisplayProperty PropertyKey='ArticleTitle'>
					<Control ID='ctlArticleTitle'
						Container='spnArticleTitle'
						Type='cTextBox'
						Size='75'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Publication Title is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PublicationYear'>
					<Control ID='ctlPublicationYear'
						Container='spnPublicationYear'
						Type='cTextBox'
						Size='10'
						MaxLength='4'
						RequiredField='True'
						ErrorMessage='Published Year is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateYear' ErrorMessage='Published Year must be YYYY format.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PublicationTypeID'>
					<Control ID='ctlPublicationType' Type='cDropDown' Container='spnPublicationType' DataObjectDefinitionKey='PublicationType'
						StoredValue='PublicationTypeID' DisplayValue='Abbr' DisplayNone='False' DisplayText='Select'
						FilterKey='PublicationType.PublicationTypeID' 
						RequiredField='True'
						ErrorMessage='Publication Type is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
						<FilterList List='GrantList' Property='PublicationTypeID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PublicationStatusID'>
					<Control ID='ctlPublicationStatus' Type='cDropDown' Container='spnPublicationStatus' DataObjectDefinitionKey='PublicationStatus'
						StoredValue='PublicationStatusID' DisplayValue='Abbr' DisplayNone='False' DisplayText='Select'
						FilterKey='PublicationStatus.PublicationStatusID' 
						RequiredField='True'
						ErrorMessage='Publication Status is required.' >
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
						<FilterList List='GrantList' Property='PublicationStatusID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Url'>
					<Control ID='ctlUrl'
						Container='spnUrl'
						Type='cTextBox'
						Size='75'
						MaxLength='200'
						RequiredField='False'
						ErrorMessage='Url is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateURL' ErrorMessage='A complete URL is required (Example: http://www.altum.com).' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextArea'
						Cols='80'
						Rows='8'
						MaxLength='300'
						
						RequiredField='False'
						ErrorMessage='Description is required.'>
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
								<Argument AttributeName='PageKey' Value='PublicationsEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectPublications' DataObjectPropertyKey='GranteeProjectPublicationsID' BaseValue='GranteeProjectPublicationsID='/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
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
								<Argument AttributeName='PageKey' Value='GrantAttachments'/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnUpload'
						Container='spnUpload'
						Type='cButton'
						Caption='Upload'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='NavigateToPublicationsUploadEditor'>
							    <Parameters>
									<Argument AttributeName='PageKey' Value='PublicationUploadEditor'/>
									<Argument Type='' TypeKey='FileTypeID' AttributeName='FileTypeID' Value='FileTypeID=56'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>	
								</Parameters>							
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

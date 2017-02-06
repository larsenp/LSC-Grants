<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cEmailTemplateEditor_Content"%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Messages may be customized with merge codes.  To use merge codes, select the query field group that includes the type of information you want to use. See 
<a href='../../../Easygrants/Controls/Base/pgQTFields.aspx' Target='Blank'> Query Fields and Merge Codes </a>
for a list of fields in each group and their corresponding merge codes.  
<br><br>  
To use HTML tags in the body of the message, select <b>Yes</b> for HTML Content.<br><br>
Sent messages will be logged in the contact record under Correspondence unless <b>No</b> is selected for Log Message.  You may not want to log messages that contain proprietary information such as passwords.
<br><br>
For more help with e-mail templates, see the <a href='../../../Easygrants/PDF/EmailTemplateGuide.pdf' target='blank'>E-mail Template Guide</a>.   </P>

<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit E-mail Template</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b>Template Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTitle' runat='server'/>
		</td>	
	</tr>
	
	<tr>
		<td><b>Template Description</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDescription' runat='server'/>
		</td>	
	</tr>
	<tr valign='top'>
		<td></td>
		<td></td>
		<td class="FieldLabel">Template Name and Description are for internal use only and will not be included in the e-mail message.</td>
	</tr>
	<tr>
		<td><b>Query Field Group</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDefinitionKey' runat='server'/>
		</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>From Name</b></td>
	    <td width='10'>&nbsp;</td>
	    <td>
		    <span id='spnCorrespondenceFromName' runat='server'/>
	    </td>	
    </tr>
	<tr>
		<td width='140'><b>From</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCorrespondenceFrom' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>To</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCorrespondenceTo' runat='server'/>
		</td>	
	</tr>
	<tr valign='top'>
		<td></td>
		<td></td>
		<td class="FieldLabel">Separate multiple e-mail addresses using a comma.</td>
	</tr>
	<tr>
		<td><b>CC</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCorrespondenceCC' runat='server'/>
		</td>	
	</tr>
	<tr valign='top'>
		<td></td>
		<td></td>
		<td class="FieldLabel">Separate multiple e-mail addresses using a comma.</td>
	</tr>
	<tr>
		<td><b>BCC</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCorrespondenceBCC' runat='server'/>
		</td>	
	</tr>
	<tr valign='top'>
		<td></td>
		<td></td>
		<td class="FieldLabel">Separate multiple e-mail addresses using a comma.</td>
	</tr>
	<tr>
		<td><b>Subject</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEmailSubject' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>HTML Format?</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnHTMLFormat' runat='server'/> 
		</td>	
	</tr>
	<tr>
		<td><b>Log Message?</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEmailLog' runat='server'/> 
		</td>	
	</tr>
	<tr valign="top">
		<td><b>Text</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnBody' runat='server'/> 
		</td>
	</tr>
</table>

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td colspan="4" align="center">
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveAndClose'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='CorrespondenceDefinition' DataObjectDefinitionKey='CorrespondenceDefinition' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='CorrespondenceDefinitionID'
					PropertyKey='CorrespondenceDefinitionID'
					Value='' 
					bool=''/>
			</Filters>			
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='UserID' Value='' Update='True'/>
			</DefaultValues>	
			<DisplayProperties>
			
				<DisplayProperty PropertyKey='DefinitionKeyID'>
					<Control ID='ctlDefinitionKey'
						Container='spnDefinitionKey'
						Type='cDropDown'
						DataObjectDefinitionKey='DefinitionKey'
						StoredValue='DefinitionKeyID'
						DisplayText='Select'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
			
				<DisplayProperty PropertyKey='CorrespondenceDescription'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='65'
						MaxLength='100'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cTextBox'
						Size='65'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Template Name is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceFromName'>
					<Control ID='ctlCorrespondenceFromName'
						Container='spnCorrespondenceFromName'
						Type='cTextBox'
						Size='65'
						MaxLength='100'
						RequiredField='False'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceFrom'>
					<Control ID='ctlCorrespondenceFrom'
						Container='spnCorrespondenceFrom'
						Type='cTextBox'
						Size='65'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='From Address is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceTo'>
					<Control ID='ctlCorrespondenceTo'
						Container='spnCorrespondenceTo'
						Type='cTextBox'
						Size='65'
						MaxLength='300'
						RequiredField='True'
						ErrorMessage='To Address is required.'>
					</Control>					
				</DisplayProperty>						
				<DisplayProperty PropertyKey='CorrespondenceCC'>
					<Control ID='ctlCorrespondenceCC'
						Container='spnCorrespondenceCC'
						Type='cTextBox'
						Size='65'
						MaxLength='300'>
					</Control>					
				</DisplayProperty>		
				<DisplayProperty PropertyKey='CorrespondenceBCC'>
					<Control ID='ctlCorrespondenceBCC'
						Container='spnCorrespondenceBCC'
						Type='cTextBox'
						Size='65'
						MaxLength='100'>
					</Control>					
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='ctlEmailSubject'
						Container='spnEmailSubject'
						Type='cTextBox'
						Size='65'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Subject is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsHtml'>
					<Control ID='ctlHTMLFormat'
						Container='spnHTMLFormat'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsLog'>
					<Control ID='ctlEmailLog'
						Container='spnEmailLog'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='Body'>
					<Control ID='ctlBody'
						Container='spnBody'
						Type='cTextArea'
						Rows='25'
						Cols='50'
						RequiredField='True'
						MaxLength='5000'
						ErrorMessage='Text is required.'>
					</Control>
					<Control ID='ctlBody'
						Container='spnBody'
						Type='cTextArea'
						Rows='25'
						Cols='50'
						RequiredField='True'
						MaxLength='5000'
						ErrorMessage='Body is required.'>
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
						EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='CorrespondenceDefinition' DataObjectPropertyKey='CorrespondenceDefinitionID' PropertyKey='CorrespondenceDefinitionID' BaseValue='CorrespondenceDefinitionID='/>
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
							Object='DataPresenter'
							Method='ModulePage_RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='EmailTemplate'/>
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
							Object='DataPresenter'
							Method='ModulePage_RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='EmailTemplate'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>	
							
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>
<!-- End Embedded XML -->
<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ReviewerEmailSend.ascx.vb" Inherits="Easygrants_Web.Controls.Base.cReviewerEmailSend" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br />
<table id='tblSentMessage' visible='false' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>Test e-mail was sent successfully.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id='tblEmailRequiredMessage' visible='false' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td><font color="red">E-mail Address is required.</font></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td class="SeparatorHdg" colspan='3'><b>Send E-mail</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>Name - E-mail (First 5)</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnDisplayName' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Total Recipient Count</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCount' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'><b>Template</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTemplate' runat='server'/>	
			<span runat='server' id='spnLoadTemplate'/>	
		</td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td><b>From</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCorrespondenceFrom' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr id='trTo' visible='false' runat='server'>
		<td><b>To</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCorrespondenceTo' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr id='trToLabel' visible='true' runat='server'>
		<td><b>To</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnToLabel' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Cc</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCorrespondenceCC' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Enter multiple e-mail addresses selected by a comma.</td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Bcc</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCorrespondenceBCC' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Enter multiple e-mail addresses selected by a comma.</td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Subject</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnEmailSubject' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit to 100 characters.</td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td><b>E-mail Format</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnBodyFormat' runat='server'/>&nbsp;
			Click here to activate html tags in your e-mail.
		</td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td><b>E-mail History</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEmailLog' runat='server'/>&nbsp;
			Click here to have this e-mail display for the contact(s) in their details record.
		</td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr valign="top">
		<td><b>Text</b>&nbsp;<font color='red'>*</font>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnBody' runat='server'/></td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit to 6000 characters.</td>
		<td width='10'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4' align='center'>
			<span runat='server' id='spnSendEmail'/>&nbsp;&nbsp;<span runat='server' id='spnSendEmailAndClose' visible="false"/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td  class="SeparatorHdg"><b>Send Test E-mail</b></td>
	</tr>
	<tr>
		<td class='FieldLabel'>To send a test e-mail, enter the destination e-mail address
		and click the <b>Send</b> button.  (The test e-mail must be sent before the actual
		e-mail.)</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>E-mail Address</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTestAddress' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center' colspan='3'>
			<span id='spnSendTestEmail' runat='server'/>&nbsp;&nbsp;&nbsp;<span id='spnCancel' runat='server'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='CorrespondenceDefinition' DataObjectDefinitionKey='CorrespondenceDefinition'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='CorrespondenceDefinitionID'
					PropertyKey='CorrespondenceDefinitionID'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='CorrespondenceDefinitionID'>
					<Control ID='ctlTemplate'
						Container='spnTemplate'
						Type='cDropDown'
						DataObjectDefinitionKey='CorrespondenceDefinition'
						StoredValue='CorrespondenceDefinitionID'
						DisplayValue='Title'
						DisplayText='Select'>
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='DefinitionKeyID' Value='2'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='Title'/>
						</Sort>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='CorrespondenceFrom'>
					<Control ID='ctlCorrespondenceFrom'
						Container='spnCorrespondenceFrom'
						Type='cTextBox'
						Size='65'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='From is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceTo'>
					<Control ID='ctlCorrespondenceTo'
						Container='spnCorrespondenceTo'
						Type='cTextBox'
						Size='65'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='To is required.'>
					</Control>					
				</DisplayProperty>						
				<DisplayProperty PropertyKey='CorrespondenceCC'>
					<Control ID='ctlCorrespondenceCC'
						Container='spnCorrespondenceCC'
						Type='cTextBox'
						Size='65'
						MaxLength='100'>
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
					<Control ID='ctlBodyFormat'
						Container='spnBodyFormat'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Html'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsLog'>
					<Control ID='ctlEmailLog'
						Container='spnEmailLog'
						Type='cCheckBox'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Body'>
					<Control ID='ctlBody'
						Container='spnBody'
						Type='cTextArea'
						Rows='25'
						Cols='50'
						MaxLength='6000'
						RequiredField='True'
						ErrorMessage='Text  is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,6000}$' ErrorMessage='Limit your summary to 6000 characters or less.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnLoadTemplate'
						Container='spnLoadTemplate'
						Type='cButton'
						Image='Load'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='GetEmailTemplate'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlTemplate' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendEmail'
						Container='spnSendEmail'
						Type='cButton'
						Image='Send'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendEmail'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendEmailAndClose'
						Container='spnSendEmailAndClose'
						Type='cButton'
						Image='Send and Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendEmailAndClose'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTestAddress'
						Container='spnTestAddress'
						Type='cEmailTextBox'
						Size='65'
						MaxLength='200'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendTestEmail'
						Container='spnSendTestEmail'
						Type='cButton'
						Image='Send_Test_Email'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendTestEmail'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
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
<!-- End Embedded XML -->

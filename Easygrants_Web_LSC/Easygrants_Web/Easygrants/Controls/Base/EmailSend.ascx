<%@ Control Language="vb" AutoEventWireup="true" Codebehind="EmailSend.ascx.vb" Inherits="Easygrants_Web.Controls.Base.cEmailSend" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->

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
<table border='0' width='100%' cellspacing='0' cellpadding='2'>
<tr>
	<td colspan="2" class="SeparatorHdg"><b>Send E-mail</b></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
	<td>
		The Send E-mail page contains functionality to send e-mail to the recipient list. To load an existing template for 
		the e-mail, select a template and click on the <b>Load</b> button.  Once the template is 
		loaded, you can modify its content. However, you will not be able to save your changes. 
		To make a permanent change to the template, click on the <b>E-mail Template</b> link in 
		the left navigation bar. Alternatively, you can type in a new message. Click on the <b>Send</b> button to 
		send the e-mail.
	</td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server' id='tabEmailListSource' >
<tr>
	<td colspan="2" class="SeparatorHdg"><b>E-mail Recipient List</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
<tr>
	<td width='25%'>
		<b>Name&nbsp;&nbsp;-&nbsp;&nbsp;E-mail (first 5):</b>
	</td>	
	<td width='75%'>
		<span id='spnDisplayName' runat='server'/>
	</td>	
</tr>
<tr>
	<td width='25%'>
		<b>Definition Key:</b>
	</td>	
	<td width='75%'>
		<span id='spnDefinitionKey' runat='server'/>
	</td>	
</tr>
<tr>
	<td width='25%'>
		<b>Total Recipient Count:</b>
	</td>	
	<td width='75%'>
		<span id='spnCount' runat='server'/>
	</td>	
</tr>
<tr>
	<td colspan='2' >
		<span id='spnReturn' runat='server'/>
	</td>	
</tr>
<tr><td>&nbsp;</td></tr>
</table>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
<!-- Control Label (for Send E-mail information) -->
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Send E-mail</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td><b>Template</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnTemplate' runat='server'/>	
		<span runat='server' id='spnLoadTemplate'/>	
	</td>
</tr>
<tr>
	<td><b>From&nbsp;</b><font color='red'>*</font></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnCorrespondenceFrom' runat='server'/>
	</td>	
</tr>
<tr id='trTo' visible='false' runat='server'>
	<td><b>To</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnCorrespondenceTo' runat='server'/>
	</td>	
</tr>
<tr id='trToLabel' visible='true' runat='server'>
	<td><b>To</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnToLabel' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Cc</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnCorrespondenceCC' runat='server'/>
	</td>
</tr>
<tr>
	<td><b>Bcc</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnCorrespondenceBCC' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>Subject</b>&nbsp;<font color='red'>*</font></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnEmailSubject' runat='server'/>
	</td>	
</tr>
<tr>
	<td><b>E-mail Format</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		Html&nbsp;<span id='spnBodyFormat' runat='server'/> 
	</td>	
</tr>
<tr>
	<td><b>E-mail History</b></td>
	<td width='10'>&nbsp;</td>
	<td>
		Log&nbsp;<span id='spnEmailLog' runat='server'/> 
	</td>	
</tr>
<tr valign="top">
	<td><b>Body&nbsp;</b><font color='red'>*</font></td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnBody' runat='server'/>
	</td>	
</tr>
<tr>
	<td colspan='2'>&nbsp;</td>
	<td align='center'>
		<span runat='server' id='spnSendEmail'/>
	</td>
</tr>
</table>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Send Test E-mail</b></td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr><td colspan='4'>&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>E-mail Address</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTestAddress' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td align='center' colspan='3'>
			<span id='spnSendTestEmail' runat='server'/>&nbsp;&nbsp;&nbsp;<span id='spnCancel' runat='server'/>
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
			<DisplayProperties>	
				<DisplayProperty PropertyKey='CorrespondenceDefinitionID'>
					<Control ID='ctlTemplate'
						Container='spnTemplate'
						Type='cDropDown'
						DataObjectDefinitionKey='CorrespondenceDefinition'
						StoredValue='CorrespondenceDefinitionID'
						DisplayValue='Title'>
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
						MaxLength='5000'
						RequiredField='True'
						ErrorMessage='Body is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,5000}$' ErrorMessage='Limit your summary to 7000 characters (1000 words) or less.'/>
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
					<Control ID='lnkReturn'
						Container='spnReturn'
						Type='cLink'
						CausesValidation='False'
						Caption=''>
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
					<Control ID='ctlTestAddress'
						Container='spnTestAddress'
						Type='cEmailTextBox'
						Size='50'
						MaxLength='200'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendTestEmail'
						Container='spnSendTestEmail'
						Type='cButton'
						Caption='Send Test E-mail'
						Image='Send'>
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

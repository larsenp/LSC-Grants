<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Review.Controls.Page.cEmailEditor_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
<span id='spnPageContent' runat='server' />


<Core:cUserCtlLoader CtlID='ctlGrantInformation' 
	Src='Implementation/Modules/Review/Controls/PageSection/GrantInformation.ascx'
	runat='server' />	

<br>	
<table width='100%'>
	<tr>	
		<td width='100%' class='SeparatorHdg'>
			E-mail Information 
		</td>
	</tr>
</table>
 <table width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>To:</b></td>
		<td><span runat='server' id='spnTo'/></td>
	</tr>
	<tr>
		<td><b>From:</b></td>
		<td><span runat='server' id='spnFrom'/></td>
	</tr>
	<tr>
		<td><b>CC:</b></td>
		<td><span runat='server' id='spnCC'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Enter multiple email addresses separated by a comma.</td>
	</tr>
	<tr>
		<td><b>BCC:</b></td>
		<td><span runat='server' id='spnBCC'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Enter multiple email addresses separated by a comma.</td>
	</tr>
	<tr>
		<td><b>Subject:</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnSubject'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit to 100 characters.</td>
	</tr>
	<tr>
		<td valign='top'><b>Text:</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnText'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit to 1000 characters.</td>
	</tr>
 </table>
 <table width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			&nbsp;&nbsp;
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSendEmail'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
 </table>
 <!-- 
 <table width='100%'>
	<tr>	
		<td width='100%' class='SeparatorHdg'>
			Send Test E-mail
		</td>
	</tr>
 </table>
 <table width='100%'>
	<tr>
		<td width='35%'>
			<b> Test E-mail Address</b>
		</td>
		<td width='15%'>
			<span runat='server' id='spnTestAddr'/>
		</td>
		<td>
			<span runat='server' id='spnSendTest'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='2' class='FieldLabel'>Enter multiple e-mail addresses separated by a comma.</td>
	</tr>
 </table>
 -->
<br>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='CorrespondenceDefinition' DataObjectDefinitionKey='CorrespondenceDefinition' Updatable='False'>
			<Filters>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='1000'/>
			</Filters>
		</DataObject>
		<DataObject Key='EmailMessage' DataObjectDefinitionKey='EmailMessage' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='1000'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='1000'/>
				
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Create='False' Update='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Create='False' Update='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CorrespondenceFrom'> 
					<Control ID='spnFrom'
							Type='HtmlGenericControl'/>								
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceCc'>
					<Control ID='ctlCC'
						Container='spnCC'
						Type='cEmailTextBox'
						Size='40'
						MaxLength='100'
						AllowMultiple='True'
						RexErrorMessage='The CC email address must be a valid email format (EX: name@organization.org).'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceBcc'>
					<Control ID='ctlBCC'
						Container='spnBCC'
						Type='cEmailTextBox'
						Size='40'
						MaxLength='100'
						AllowMultiple='True'
						RexErrorMessage='The BCC email address must be a valid email format (EX: name@organization.org).'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='ctlSubject'
						Container='spnSubject'
						Type='cTextBox'
						Size='40'
						RequiredField='True'
						ErrorMessage='Subject is required.'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceTo'>
					<Control ID='spnTo'
						Type='HtmlGenericControl'/>		
				</DisplayProperty>
				<DisplayProperty PropertyKey='Body'>
					<Control ID='ctlText'
						Container='spnText'
						Type='cTextArea'
						Rows='15'
						Cols='40'
						MaxLength='1000'
						RequiredField='True'
						ErrorMessage='Text  is required.'
						TooLongMessage='The text of the email message must be fewer than 3500 characters.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton' Caption='Close'
						Image='Cancel'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
								<Parameters>
									<Argument Type='QueryString' TypeKey='ReturnURL'/>
								</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
						
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendEmail'
						Container='spnSendEmail'
						Type='cButton'
						Caption='Save and Send'
						Confirmation='Are you sure you want to request a resubmission?'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendEmailAndSubmit'/>
					</Control>	
				</DisplayProperty>
				
				<!-- 
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendTest'
						Container='spnSendTest'
						Type='cButton'
						Image='Send'
						Confirmation='Are you sure you want to send the test e-mail?'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendTestEmail'/>
					</Control>	
				</DisplayProperty>   -->
			</DisplayProperties>
		</DataObject>
		<!-- 
		<DataObject Key='Base' DataObjectDefinitionKey='' GetData='True' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTestAddr'
						Container='spnTestAddr'
						Type='cEmailTextBox'
						Size='40'
						MaxLength='100'
						AllowMultiple='True'
						RexErrorMessage='The addresses in the Test E-mail Address box are incorrectly formatted.'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>    -->
	</ModuleSection>
</span>	
	


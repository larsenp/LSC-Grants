<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewReport.Controls.Page.cResubmitReport_Email" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
 <br />
 <p>
	Please review the resubmission request email to be sent to the Primary Contact. <b>Important</b> The Primary Contact Email address being displayed will be the address to which the request will be sent.
 </p>
 <p>
	To save the email modifications, click the <b>Save</b> button.  You can return to this at a later time using the <b>Continue ></b> button at the bottom of the Request Report Resubmission page.
 </p>
 <p>
	Once you have reviewed and made any modifications, click the <b>Send</b> button.  The Review Report task will be closed until the primary contact has resubmitted the report.  To cancel and return to the Request Report Resubmission page, click on the <b>Cancel</b> button.
 </p>

 <table width='50%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b><%=GetLabel("GrantId")%>:</b></td>
		<td><span runat='server' id='spnGrantView'/></td>
	</tr>
	<tr>
		<td nowrap><b><%=GetLabel("Organization")%> Name:</b></td>
		<td><span runat='server' id='spnOrgName'/></td>
	</tr>
	<tr>
		<td><b>Primary Contact:</b></td>
		<td><span runat='server' id='spnContact'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>To:</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnTo'/></td>
	</tr>
	<tr>
		<td><b>From:</b>&nbsp;<%=kDenoteRequiredField%></td>
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
		<td class='FieldLabel'>Limit the subject of your email to 100 characters.</td>
	</tr>
	<tr>
		<td valign='top'><b>Text:</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnText'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td align='center'>
			<span runat='server' id='spnCancel'/>&nbsp;&nbsp;
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnSendEmail'/>
		</td>
	</tr>
 </table>
 <!--<table width='100%'>
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
 </table> -->
<br>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='spnGrantView'
							Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'> 
					<Control ID='spnOrgName'
							Type='HtmlGenericControl'/>								
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryPerson.FirstNameLastName'> 
					<Control ID='spnContact'
							Type='HtmlGenericControl'/>								
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='CorrespondenceDefinition' DataObjectDefinitionKey='CorrespondenceDefinition' Updatable='False'>
			<Filters>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='108'/>
			</Filters>
		</DataObject>
		<DataObject Key='EmailMessage' DataObjectDefinitionKey='EmailMessage' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='108'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='108'/>
				
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
				<DisplayProperty PropertyKey='CorrespondenceTo'>
					<Control ID='spnTo'
						Type='HtmlGenericControl'/>		
				</DisplayProperty>		
				<DisplayProperty PropertyKey='CorrespondenceCc'>
					<Control ID='ctlCC'
						Container='spnCC'
						Type='cEmailTextBox'
						Size='40'
						MaxLength='100'
						AllowMultiple='True'
						RexErrorMessage='The CC email address must be in a valid email format (EX: name@organization.org).'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceBcc'>
					<Control ID='ctlBCC'
						Container='spnBCC'
						Type='cEmailTextBox'
						Size='40'
						MaxLength='100'
						AllowMultiple='True'
						RexErrorMessage='The BCC email address must be in a valid email format (EX: name@organization.org).'/>
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
				<DisplayProperty PropertyKey='Body'>
					<Control ID='ctlText'
						Container='spnText'
						Type='cTextArea'
						Rows='15'
						Cols='40'
						MaxLength='3500'
						RequiredField='True'
						ErrorMessage='Text is required.'
						TooLongMessage='Limit your Text to 3500 characters.'/>
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
						<Action
							PostBack='True'
							AutoSave='True'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendEmail'
						Container='spnSendEmail'
						Type='cButton'
						Image='Submit'
						Confirmation='Are you sure you want to send the email?'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendEmailAndSubmit'/>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>	

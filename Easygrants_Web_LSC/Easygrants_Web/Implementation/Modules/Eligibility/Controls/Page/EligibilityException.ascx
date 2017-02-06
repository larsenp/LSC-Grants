<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.Eligibility.Controls.Page.cEligibilityException" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table border='0' cellpadding='0' cellspacing='0' runat='server' width='100%' id='tblSenMail'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="SeparatorHdg" colspan="2"><b>Request Eligibility Exception</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2"><span id='spnPageContent' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td	width='26%'><b>From</b> <%=kDenoteRequiredField%></td>
		<td><span id='spnFrom' runat='server'/><span id='spnTextFrom' runat='server' visible='true' />
		<span id='spnTo' runat='server' visible='false' /></td>
	</tr>
	<tr>
		<td><b>Subject</b> <%=kDenoteRequiredField%></td>	
		<td><span id='spnSubject' runat='server'/></td>
	</tr>
	<tr>
		<td valign='top'><b>Message</b> <%=kDenoteRequiredField%></td>	
		<td><span id='spnMessage' runat='server'/></td>
	</tr>
	<tr>
		<td></td>	
		<td>Limit 2000 characters</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="tblConfirm">
	<tr><td>&nbsp;</td></tr>
	<tr><td>Your request for Exception has been sent.</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr align='center'>
		<td colspan="2">
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnClose'/>&nbsp;&nbsp;
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
			<PageContent/>
			<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' >
		        <Filters>
			        <Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
	            </Filters>
		        <DisplayProperties>
			        <DisplayProperty PropertyKey='WfProject.SupportEmailAddress'>
				        <Control ID='spnTo'
					        Type='HtmlGenericControl'/>
			        </DisplayProperty>	
				</DisplayProperties>
			</DataObject>
			<DataObject Key='Person' DataObjectDefinitionKey='Person' >
			    <Filters>
				    <Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
		        </Filters>
			    <DisplayProperties>
				    <DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1'>
					    <Control ID='spnFrom'
						    Type='HtmlGenericControl'/>
				    </DisplayProperty>	
				    <DisplayProperty PropertyKey=''>
					    <Control ID='ctlSubject'
						    Container='spnSubject'
						    Type='cTextBox'
						    Size='75'
						    MaxLength='200'
						    RequiredField='True'
						    ErrorMessage='Subject is required.' />
				    </DisplayProperty>
				    <DisplayProperty PropertyKey=''>
					    <Control ID='ctlMessage'
						    Container='spnMessage'
						    Type='cTextArea'
						    MaxLength='2000'
						    TooLongMessage='The maximum length is 2000 !'
						    Rows='13'
						    Cols='85'
						    RequiredField='True'
						    ErrorMessage='Message is required.' />
				    </DisplayProperty>
				</DisplayProperties>
			</DataObject>
			<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
				<DisplayProperties>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
							<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
								<Parameters>
									<Argument Value='Home' />
									<Argument Value='HomeModuleConfig' />
									<Argument Value='Home' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
				    <DisplayProperty PropertyKey=''>
					    <Control ID='btnSave'
						    Container='spnSave'
						    Type='cButton'
						    Caption='Send'
						    Image='Save'>
							<Action
								PostBack='True'
								Object='DataPresenter'
								Method='SendEmail'>
								<Parameters>
									<Argument Type='Control' TypeKey = 'ctlSubject' ControlPropertyKey='Value' Value='' />
									<Argument Type='Control' TypeKey = 'ctlMessage' ControlPropertyKey='Value' Value='' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

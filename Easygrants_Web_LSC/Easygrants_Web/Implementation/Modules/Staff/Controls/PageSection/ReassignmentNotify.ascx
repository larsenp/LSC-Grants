<%@ Control Language="vb" AutoEventWireup="True" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cReassignmentNotify"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>

<table width='100%' cellpadding='3'>
	<tr><td class='SeparatorHdg' colspan='3'>Reassignment</td></tr>
</table>
 <br /> 
   <table width='100%'>
	<tr>
		<td><b>To</b></td>
		<td><span runat='server' id='spnTo'/></td>
	</tr>
	<tr>
		<td><b>From</b></td>
		<td><span runat='server' id='spnFrom'/>
			<asp:CustomValidator id="CtlvalFromEmail" runat="server"
				OnServerValidate="valFromEmail"
				Display="None"
				ErrorMessage="From address is required."/>
		</td>
	</tr>
	<tr>
		<td><b>CC</b></td>
		<td><span runat='server' id='spnCC'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Enter multiple email addresses separated by a comma.</td>
	</tr>
	<tr><td colspan='2' height='4px'></td></tr>
	<tr>
		<td><b>BCC</b></td>
		<td><span runat='server' id='spnBCC'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Enter multiple email addresses separated by a comma.</td>
	</tr>
	<tr><td colspan='2' height='4px'></td></tr>
	<tr>
		<td><b>Subject&nbsp;<%=kDenoteRequiredField%></b></td>
		<td><span runat='server' id='spnSubject'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Limit to 100 characters.</td>
	</tr>
	<tr><td colspan='2' height='4px'></td></tr>
	<tr>
		<td valign='top'><b>Text&nbsp;<%=kDenoteRequiredField%></b></td>
		<td><span runat='server' id='spnText'/></td>
	</tr>
	<tr >
		<td>&nbsp;</td>
		<td>Limit to 3500 characters.</td>
	</tr>
	</table>
	 <table width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
		    <span runat='server' id='spnSave'/>&nbsp;&nbsp;
		    <span runat='server' id='spnSendEmail'/>&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
 </table>
 
<!-- Embedded XML Page Functionality -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='CorrespondenceDefinition' DataObjectDefinitionKey='CorrespondenceDefinition' Updatable='False'>
			<Filters>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='131'/>
			</Filters>
		</DataObject>
		<DataObject Key='EmailMessage' DataObjectDefinitionKey='EmailMessage' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='131'/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='131'/>
				
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
				<DisplayProperty PropertyKey='Body'>
					<Control ID='ctlText'
						Container='spnText'
						Type='cTextArea'
						Rows='15'
						Cols='40'
						MaxLength='3500'
						RequiredField='True'
						ErrorMessage='Text is required.'
						TooLongMessage='The Text must be fewer than 3500 characters.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='close'>
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
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save_and_Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='Save'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendEmail'
						Container='spnSendEmail'
						Type='cButton'
						Image='Save_and_Notify'
						Confirmation='Are you sure you want to send the email?'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='SendEmailAndSubmit'/>
					</Control>	
				</DisplayProperty>
						
			</DisplayProperties>
		</DataObject>
		
	
	</ModuleSection>
</span>	

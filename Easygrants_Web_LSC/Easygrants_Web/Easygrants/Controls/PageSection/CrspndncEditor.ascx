<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cCrspndncEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="AddressEditorb.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<span runat='server' id='spnOrgContent'>
</span>
<br><br>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td width='100%' colspan="3" class="SeparatorHdg"><b>View Correspondence E-mail</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr><td width='2%'></td>
		<td><b>Person</b></td>
		<td> <span runat='server' id='spnPerson'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr><td width='2%'></td>
		<td><b>To</b></td>
		<td> <span runat='server' id='spnTo'/></td>
	</tr>
	<tr><td></td>
		<td><b>From</b></td>
		<td> <span runat='server' id='spnFrom'/></td>
	</tr>
	<tr><td></td>
		<td><b>CC</b></td>
		<td> <span runat='server' id='spnCC'/></td>
	</tr>
	<tr><td></td>
		<td><b>BCC</b></td>
		<td> <span runat='server' id='spnBCC'/></td>
	</tr>
	<tr><td></td>
		<td><b>Subject</b></td>
		<td> <span runat='server' id='spnSubject'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr><td></td>
		<td valign='top' NoWrap='true'><b>Body Text</b></td>
		<td> <span runat='server' id='spnBody'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr><td></td>
		<td valign='top' NoWrap='true'><b>Date Sent</b></td>
		<td> <span runat='server' id='spnDate'/></td>
	</tr>
	<tr><td></td>
		<td valign='top' NoWrap='true'><b>Last Date Resent</b></td>
		<td> <span runat='server' id='spnRecentResend'/></td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnResend'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='EmailLog' DataObjectDefinitionKey='EmailLog' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EmailLogID' PropertyKey='EmailLogID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CorrespondenceTo'>
					<Control ID='spnTo' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceFrom'>
					<Control ID='spnFrom' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceCC'>
					<Control ID='spnCC' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CorrespondenceBCC'>
					<Control ID='spnBCC' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='spnSubject' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreateDate' Format='M/d/yyyy'>
					<Control ID='spnDate' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='EmailLog' DataObjectPropertyKey='RecipientPersonID' PropertyKey='PersonID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPerson' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnResend'
						Type='cButton'
						Image='Resend and Close'
						Confirmation='Are you sure you want to send this item?'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='Resend'>
						</Action>
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
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>


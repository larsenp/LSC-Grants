<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cSupportForm" Codebehind=".SupportForm.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true"%>
<%@ register tagprefix='Core' tagname='cCloseWindow' src='../../../Core/Controls/Base/CloseWindow.ascx' %>
<%@ register tagprefix='Core' tagname='cDropDown'  src='../../../Core/Controls/Base/DropDown.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->

<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<!-- Link to Registration Page(additional configuration information is specified in the 
					DisplayProperty node below) -->	
	<tr><td>&nbsp;</td></tr>
	<tr>
			<td colspan="4" class="SeparatorHdg"><b>Support Form</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id='tblSentMessage' visible='false' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>Your support request has been submitted. We look forward to helping you and will be addressing your support request at our first opportunity during normal business hours. </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>Thank you, </td>
	</tr>
	<tr>
		<td>Easygrants Customer Service Team</td>
	</tr>
</table>
<br/>
<table id='tblCloseWindow' visible='false' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>
<table id='tblMessage' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td><b>From (E-mail Address)&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnFrom'></span></td>
	</tr>
	<tr>
		<td><b>Subject&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnSubject'></span></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%>&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnCompetition'/></td>
	</tr>
	<tr>
		<td valign='top'><b>Message&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnMessage'></span></td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' id='tblSubmit' cellspacing='0' cellpadding='2' runat='server' align='center' visible='true'>		
	<tr>
		<td align='center'>
			<span runat='server' id='spnSubmit'/> <span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>			
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlFrom'
						Container='spnFrom'
						Type='cEmailTextBox'
						Size='30'
						RequiredField='True'
						ErrorMessage='Enter a From E-mail Address.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSubject'
						Container='spnSubject'
						Type='cTextBox'
						Size='30'
						RequiredField='True'
						ErrorMessage='Enter a Subject.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProjectID'>
					<Control ID='ctlCompetition'
						Container='spnCompetition'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProject'
						StoredValue='WfProjectID'
						DisplayValue='WfProjectName'	
						RequiredField='True'
						ErrorMessage='Select a ~~FundingCycleName~~.'>
							<Sort>
	                            <Argument PropertyKey='WfProjectName'/>
                            </Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlMessage'
						Container='spnMessage'
						Type='cTextArea'
						Rows='10'
						Cols='50'
						RequiredField='True'
						ErrorMessage='Enter a Message.' />
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close Window'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow'>
							<Parameters>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendEmail'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlFrom' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlSubject' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlCompetition' ControlPropertyKey='SelectedText' Value='' />
								<Argument Type='Control' TypeKey = 'ctlMessage' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlCompetition' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='QueryString' TypeKey ='Type'  Value='' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='False'>
			<Filters>
				<Argument Type='' 
				TypeKey=''
				PropertyKey='WfProjectID'
				Value='null' 
				bool=''/>
			</Filters>
			<DisplayProperties>		
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo' 
	Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
	runat='server' />
<br />
<div class='SeparatorHdg'>
	Edit Milestone
</div>
<br />
<table width='100%' cellpadding='1'>
	<tr>
		<td>
			<b>Milestone Number</b>
		</td>
		<td>
			<span runat='server' id='spnMilestoneNumber' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top'>
			<b>Milestone Text</b>
		</td>
		<td>
			<span runat='server' id='spnMilestone' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top'>
			<b>Instructions</b>
		</td>
		<td>
			<span runat='server' id='spnInstructions' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnSaveClose' />&nbsp;&nbsp;
			<span runat='server' id='spnClose' />
				
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
      <td colspan='2' align='center'><span id='spnDelete' runat='server'/></td>
    </tr>
</table>
<br />
<div class='SeparatorHdg'>
	History
</div>
<br />
<b>Created by</b>&nbsp;&nbsp;<span runat='server' id='spnCreateUser'/><br />
<b>Created on</b>&nbsp;&nbsp;<span id="spnCreateDate" runat='server' /><br />
<b>Last modified by</b>&nbsp;&nbsp;<span id="spnModifyUser" runat='server' /><br />
<b>Last modified on</b>&nbsp;&nbsp;<span id="spnModifyDate" runat='server' /><br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscMilestone' DataObjectDefinitionKey='LscMilestone' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscMilestoneID' PropertyKey='LscMilestoneID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='PaymentID' PropertyKey='PaymentID' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='MilestoneNumber'>
					<Control ID='txtMilestoneNumber'
						Type='cTextBox'
						Container='spnMilestoneNumber'
						Size='5'
						MaxLength='3'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999'
							ErrorMessage='Milestone Number must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Milestone'>
					<Control ID='txtMilestone'
						Type='cTextArea'
						Container='spnMilestone'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Instructions'>
					<Control ID='txtInstructions'
						Type='cTextArea'
						Container='spnInstructions'
						Rows='5'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstName'>
					<Control ID='spnCreateUser'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreateDate' Format='M/d/yyyy'>
					<Control ID='spnCreateDate'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName'>
					<Control ID='spnModifyUser'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='M/d/yyyy'>
					<Control ID='spnModifyDate'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Type='cButton'
						Container='spnSaveClose'
						Caption='Save and Close'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnDelete'
						Type='cButton'
						Image='Delete Milestone'
						Container='spnDelete'
						Confirmation='Are you sure you want to delete this item?'>
							<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_Delete'>
								<Parameters>
									<Argument Value='LscMilestone'/>
									<Argument Type='QueryString' TypeKey='LscMilestoneID' DataObjectPropertyKey='LscMilestoneID'/>
									<Argument Value='False' />
								</Parameters>
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
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

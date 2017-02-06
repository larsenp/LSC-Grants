<%@ Control Language="vb" AutoEventWireup="true" Codebehind="CopyTaskEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder.cCopyTaskEditor" EnableViewState="True" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Copy Task</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Task</B></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnTaskName'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>New Task Name</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnNewTaskName'></span>
			<asp:CustomValidator id="valUniqueTaskName" runat="server"
				OnServerValidate="ValidateUniqueTaskName"
				Display="None"
				ErrorMessage="Task Name must be unique."/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Description</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnDescription' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnCopy'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTask' DataObjectDefinitionKey='WfTask' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask'>
					<Control ID='ctlTaskName'
						Container='spnTaskName'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='NewWfTask' DataObjectDefinitionKey='WfTask' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask'>
					<Control ID='ctlNewTaskName'
						Container='spnNewTaskName'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='New Task Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Description is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCopy'
						Container='spnCopy'
						Type='cButton'
						EnterKey='True'
						Image='Copy'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='DataPresenter_Save_And_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='TaskBuilder'/>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='TaskBuilder'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
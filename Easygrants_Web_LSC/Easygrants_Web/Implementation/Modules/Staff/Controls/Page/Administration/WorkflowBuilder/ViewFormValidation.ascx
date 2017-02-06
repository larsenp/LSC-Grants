<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>View Workflow Task Validation</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task Name</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTaskName' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Form Name</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnFormName' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Form Description</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnFormDescription' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnFormValidation' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign="top"><b>Submission Validation</b></td>
		<td width='10'>&nbsp;</td>
		<td valign="top">
			<span id='spnSubmissionValidation' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskModuleConfigNavElement' DataObjectDefinitionKey='WfTaskModuleConfigNavElement' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskModuleConfigNavElementID' PropertyKey='WfTaskModuleConfigNavElementID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='ctlTaskName'
						Container='spnTaskName'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StandardForms.Name'>
					<Control ID='ctlFormName'
						Container='spnFormName'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StandardForms.Description'>
					<Control ID='ctlFormDescription'
						Container='spnFormDescription'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubmissionValidation'>
					<Control ID='ctlSubmissionValidation'
						Container='spnSubmissionValidation'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
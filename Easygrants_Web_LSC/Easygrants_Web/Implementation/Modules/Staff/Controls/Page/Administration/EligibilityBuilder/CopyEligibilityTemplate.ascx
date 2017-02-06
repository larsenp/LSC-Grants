<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.EligibilityBuilder.cCopyEligibilityTemplate" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br/>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Copy Eligibility Quiz</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Eligibility Quiz Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td>
			<span runat='server' id='spnCopyFromTemplateName'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>New Eligibility Quiz Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td>
			<span runat='server' id='spnTemplateName'></span>
			<asp:CustomValidator id="valUniqueTemplate" runat="server"
				OnServerValidate="ValidateUniqueTemplate"
				Display="None"
				ErrorMessage="Eligibility Quiz Name must be unique."/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Description</b></td>
		<td>
			<span runat='server' id='spnTemplateDescription' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td align='left'>
			<span runat='server' id='spnCopy'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='EligibilityTemplate' DataObjectDefinitionKey='EligibilityTemplate' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EligibilityTemplateID' PropertyKey='EligibilityTemplateID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TemplateName'>
					<Control ID='ctlCopyFromTemplateName'
						Container='spnCopyFromTemplateName'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='NewEligibilityTemplate' DataObjectDefinitionKey='EligibilityTemplate' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EligibilityTemplateID' PropertyKey='EligibilityTemplateID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TemplateName'>
					<Control ID='ctlTemplateName'
						Container='spnTemplateName'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Eligibility Quiz Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TemplateDescription'>
					<Control ID='ctlTemplateDescription'
						Container='spnTemplateDescription'
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
								<Argument AttributeName='PageKey' Value='EligibilityBuilder'/>
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
								<Argument AttributeName='PageKey' Value='EligibilityBuilder'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
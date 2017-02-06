<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='600'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			Unsubmission Request Sent
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Your request for unsubmission of this application has been forwarded to LSC. You should
			receive a reply within two business days at the following e-mail address: <span runat='server' id='spnEmail' />.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnMain' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Person.User.UserName'>
					<Control ID='spnEmail'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnMain'
						Type='cButton'
						Container='spnMain'
						Caption='Back to Main Page'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Main' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnUploadInstructionsEMF'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnUploadLOI'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnUploadBibliography'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnUploadPICV'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID'
					PropertyKey='PersonID'	Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadInstructionsEMF'
						Type='cUploadInstructionsEMF'
						Container='spnUploadInstructionsEMF'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadLOI'
						Type='cUpload'
						Container='spnUploadLOI'>
						<Parameters>
							<Argument PropertyKey='FileTypeID' Value='2' Bool=''/>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'	Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadBibliography'
						Type='cUpload'
						Container='spnUploadBibliography'>
						<Parameters>
							<Argument PropertyKey='FileTypeID' Value='3' Bool=''/>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID' Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadPICV'
						Type='cUpload'
						Container='spnUploadPICV'>
						<Parameters>
							<Argument PropertyKey='FileTypeID' Value='4' Bool=''/>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID' Bool=''/>
						</Parameters>
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
								<Argument AttributeName='PageKey' Value='DocumentList'/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
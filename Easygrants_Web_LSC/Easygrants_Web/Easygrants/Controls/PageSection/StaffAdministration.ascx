<%@ Control Language="vb" AutoEventWireup="true" Codebehind="StaffAdministration.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cStaffAdministration" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>

<!-- Control Label (for Education information) -->
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Administration</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td><span id='spnManager' runat='server'/>
	</td>
</tr>
<tr>
	<td>&nbsp;
	</td>
</tr>
</table>

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlManager'
						Container='spnManager'
						Type='cLink'
						Caption='Easygrants Manager'>
						<Action
							PostBack='True'
							Object='ModulePage'
								Method='RedirectToModule'>
								<Parameters>
									<Argument AttributeName='PageKey1' Value='Staff' />
									<Argument AttributeName='PageKey2' Value='ModuleConfig' />
									<Argument AttributeName='PageKey3' Value='Home' />
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

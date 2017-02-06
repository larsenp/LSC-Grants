<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>
	If your project involves substantial interaction with another <%=GetLabel("Organization")%>, 
	(e.g., scientific collaboration, sharing facilities, etc.), not described 
	in the Co-PI section, click the <b>Add</b> button to provide the required 
	<%=GetLabel("Organization")%> information.
</P>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Other <%=GetLabel("Organization")%>s</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlOtherInstitution' 
	Src='EasyGrants/Controls/PageSection/OtherInstitution_List.ascx'
	runat='server'/>

<center>
<table>	
	<tr>
		<td>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>
</center>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Budget'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

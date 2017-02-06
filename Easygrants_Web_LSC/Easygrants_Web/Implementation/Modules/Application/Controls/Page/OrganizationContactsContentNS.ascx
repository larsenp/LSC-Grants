<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>
Please provide information about the <%=GetLabel("Organization")%> Contacts for this project.  
Only Administrative and Financial Contacts need to be provided at the application 
stage.  The Administrative Contact is the person at the <%=GetLabel("Organization")%> (not departmental) 
level to whom an award agreement would be mailed; the Financial Contact is the person at 
the <%=GetLabel("Organization")%> (not departmental) level responsible for financial management of the award.  
The table below lists the contacts, if any, that have been entered into the 
system. Each contact must be entered separately. To add an <%=GetLabel("Organization")%> Contact 
click on the <b>Add</b> button, which will direct you to the <%=GetLabel("Organization")%> Contact 
editor. To edit or delete an existing record, click on the appropriate button 
in the Options column. Note: The table below will display only a portion of 
he information entered for each <%=GetLabel("Organization")%> Contact. 
</P>
<P>
<b>Note: For the Application Submission, you are only required to submit 
the contact information for the Administrative and Financial contacts for 
your <%=GetLabel("Organization")%>.</b>
</P>

<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlPrincipal' 
	Src='EasyGrants/Controls/PageSection/OrganizationContacts_List.ascx'
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
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ProjectInformation'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

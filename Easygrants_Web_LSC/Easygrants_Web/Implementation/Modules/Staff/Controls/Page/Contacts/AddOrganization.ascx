<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
<br>
<!--
From this page you can add an Organization Contact record.  All fields marked with a red asterisk 
(<FONT color=red>*</FONT>) are required.  <b>IMPORTANT:</b> If an existing organization is found based on the matching criteria, 
the system will display the matches on the Matching Organization page.  Matches are based on Legal 
Organization Name or Common Name and City and State.  The links on the <b>History:</b> menu act as a "crumb 
trail" as you navigate through the Contact Information pages, allowing you to easily navigate or 
click back to a previously accessed page.
<br><br>
<b>History:</b>&nbsp;&nbsp;
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='AddOrganization' LinkTitle='Add Organization' runat='server'/>
<br><br>
-->
<table width='100%' runat='server'>
	<tr>
		<td class='SeparatorHdg'>
			Add <%=GetLabel("Organization")%>
		</td>
	</tr>
	
</table>
<!--
<br>
Enter the organization information below.  The address, phone, and Web site address will be saved as 
the primary information for this organization. To save the information, click the <b>Save</b> button.   
To save the information and go to the Organization record, click the <b>Save & Continue</b> button. To cancel 
and return to the Easylist, click the <b>Cancel</b> button. <b>IMPORTANT:</b> If you close or navigate off 
this page before you save, you will lose unsaved information.
<br>
-->


<Core:cUserCtlLoader CtlID='ctlAddOrg' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Organization_Editor.ascx'
	runat='server'/>
	
<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddOrg'
						Type='cUserCtlLoader'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>

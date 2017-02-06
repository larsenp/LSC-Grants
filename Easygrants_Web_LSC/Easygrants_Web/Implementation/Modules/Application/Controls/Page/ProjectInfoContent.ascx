<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' 
	Type='cValidationSummary' 
	runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<Core:cUserCtlLoader CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
<br>
<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlProjectInfo' 
	Src='EasyGrants/Controls/PageSection/ProjectInfo.ascx'
	runat='server' />
<center>
<table>	
	<tr>
		<td>
		<!-- Save Button Control(additional configuration information is specified in the 
		DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
</center>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True' AutoSave='True'/>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='' >
					<Control ID='ctlProjectInfo' Type='cUserCtlLoader'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save and Continue'
						GoToNextPage='True'>
						<Action PostBack='True' AutoSave='True' />
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>				
	</ModuleSection>
<!-- End Embedded XML -->
</span>



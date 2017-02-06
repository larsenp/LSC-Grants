<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->

<P>
All fields marked with an asterisk (<FONT color=red>*</FONT>) are required.  
Please select all that apply to your proposed research.  
<ul>
	<li>Click on the <B>Save and Continue</B> button to save the information.</li>
	<li>Click on the <b>Close</b> button to close the <b>Compliance</b> page 
	and return to the <b>Main</b> page.</li>
</ul>
</P>

<!-- Page Content - Controls -->

<Core:cUserCtlLoader CtlID='ctlProjectAssurances' 
	Src='EasyGrants/Controls/PageSection/ProjectAssurances.ascx'
	Properties='SvButton=NoShow'
	runat='server'/>
<u>Animal and Human Subject Use Policy</u>
<p>
If your project involves animal or human subjects, you must understand and adhere to your institution's policies regarding these subjects, and you must obtain the
necessary approvals prior to the use of these subjects.  Approvals do not need to be sent to the Foundation.
<p>
<center>
<table>	
	<tr>
		<td>
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
</center>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='' >
					<Control ID='ctlProjectAssurances' Type='cUserCtlLoader'/>
				</DisplayProperty>
				
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
								<Argument AttributeName='PageKey' Value='ProjectDescription'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	

				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument AttributeName='PageKey' Value='Main'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

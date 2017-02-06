<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- Page Content - Controls -->
<br>
Click the checkbox below to confirm that the information contained in this application is true and correct
to the best of your knowledge and that you have read the Privacy Disclosure Policy.
<br><br>
Privacy Disclosure Policy:
<br><br>
The information that you will be providing to The Wallace H. Coulter Foundation (the "Foundation") in your
Early Career Translational Research Award application will be used by this Foundation to make a 
decision as to whether or not to fund your research.  As part of this decision making process, the Foundation 
relies on outside advisors to assist in the review of all applications received.  The foundation will use 
reasonable efforts to not distribute your application beyond reviewers described above.  However, the submission
of your application is not made pursuant to any nondisclosure agreement with the Foundation.  Moreover,
the Foundation will not enter into a non disclosure agreement with any applicant.  Therefore, it is 
incumbent on each applicant to provide the foundation with sufficient detail to understand the 
research that you are requesting to be funded and at the same time not disclose any proprietary
elements that may compromise your ability to obtain intellectual property protection in the future.
<ul>
	<li>Click the <b>Save and Continue</b> to save the information.</li>
	<li>Click the <b>Close</b> button to close the <b>Agreement</b> page and return to the <b>Main</b> page.</li>
</ul>
</p>

<Core:cUserCtlLoader CtlID='ctlProjectAgreement' 
	Src='EasyGrants/Controls/PageSection/ProjectAgreement.ascx'
	Properties='SvButton=NoShow'
	runat='server'/>

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
					<Control ID='ctlProjectAgreement' Type='cUserCtlLoader'/>
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
								<Argument AttributeName='PageKey' Value='Validation'/>
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

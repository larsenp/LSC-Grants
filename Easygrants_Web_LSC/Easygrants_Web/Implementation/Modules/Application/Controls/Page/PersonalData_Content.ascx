<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="PersonalData_Content.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<span id='spnPageContent' runat='server'/>
<br><br>

<!-- Page Content - Top Of Page -->

<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlPersonalDataEditor' 
	Src='EasyGrants/Controls/PageSection/PersonalData_Editor.ascx'
	runat='server' />


<table width='100%' border='0'>	
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;
			<span runat='server' id='spnClose'/> 
		</td>
	</tr>
</table>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
			<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
				<DisplayProperties>
					<DisplayProperty PropertyKey='' >
						<Control ID='ctlPersonalDataEditor' Type='cUserCtlLoader'/>
					</DisplayProperty>	
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave'
							Container='spnSave'
							Type='cButton'
							Image='Save'>
							<Action
								PostBack='True'
								AutoSave='True'/>
						</Control>
					</DisplayProperty>			
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton'GoToNextPage='True' >
							<Action
								PostBack='True'
								AutoSave='True'/>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnClose'
							Container='spnClose'
							Type='cButton'
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

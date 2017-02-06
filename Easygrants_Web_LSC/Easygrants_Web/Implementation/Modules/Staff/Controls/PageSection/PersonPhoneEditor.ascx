<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="PhoneEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Enter or edit the phone/fax number for the contact and click the <b>Save</b> button.  To close this page and return 
to Person Details page, click the Close button.  <b>IMPORTANT:</b> If you close or navigate off this page before 
you save, you will lose unsaved information.</P>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Phone Editor</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>	
			<b>Person: <span runat='server' id='spnPerson'/></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader CtlID='ctlPhoneEditor' 
	Src='Easygrants/Controls/PageSection/PhoneEditor.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='PersonID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPerson'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPhoneEditor'
						Type='cUserCtlLoader'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>						
						</Action>
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
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>
<!-- End Embedded XML -->

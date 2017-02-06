<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
	
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Enter or edit your contact information in the fields below.  
	All fields marked with an asterisk (<FONT color=red>*</FONT>) are required.</P>
	<ul>
		<li>Click on the <B>Save</B> button to save information about your name.</li>
	  <li>  Click on the <strong>Add</strong> buttons below to add  information about your address, telephone/fax and email address.</li>
	<li>To return to your Home page when finished, click on the <b>Home</b> left navigational link or the <b>Close</b> button at the bottom of the page.</li>
	</ul>

<!-- Page Section - Controls -->
<br>
<Core:cUserCtlLoader CtlID='ctlContactName' 
	Src='EasyGrants/Controls/PageSection/Person_Editor.ascx'
	runat='server'/><br>

<Core:cUserCtlLoader CtlID='ctlContactAddress' 
	Src='EasyGrants/Controls/PageSection/Contact_Address.ascx'
	runat='server'/>	
<Core:cUserCtlLoader CtlID='ctlContactPhone' 
	Src='EasyGrants/Controls/PageSection/Contact_Phone.ascx'
	runat='server'/>	
<Core:cUserCtlLoader CtlID='ctlContactEmail' 
	Src='EasyGrants/Controls/PageSection/Contact_Email.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'>
						<Action
							PostBack='True'
							Object='ModulePage'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Home' />
								<Argument Type='' TypeKey = '' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey = '' Value='Home' />
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->



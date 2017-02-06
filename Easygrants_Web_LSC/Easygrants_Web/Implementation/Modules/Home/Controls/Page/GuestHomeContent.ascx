<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
Welcome to the <b>Easygrants&reg; Competition System</b>.
<br><br>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Link to Registration Page(additional configuration information is specified in the 
				DisplayProperty node below) -->
<tr>
	<td>
		The link(s) below provide information and details on competitions currently open for application.<br><br>
		<ul>
		<li><a href='http://www.ellisonfoundation.org/index.jsp'> Ellison Medical Foundation Scholars Competitions</a></ul>
		</ul>
	</td>
</tr>	
<tr><td>&nbsp;</td></tr>
<tr>
        <td colspan="4" class="SeparatorHdg"><b>Registration</b></td>
</tr>		
<tr>
	<td>
	If you are a first-time visitor, and are interested in applying for one of the 
	above competitions, please click on the <b>Registration Page</b> link to register.
	</td>
</tr>
<tr><td>&nbsp;</td></tr>	
<tr>
	<td>
		<span runat='server' id='spnRegistrationSS'/>
	</td>
</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkRegistrationSS' 
						Type='cLink' 
						Caption = 'Senior Scholar Competitions Registration Page'
						Container='spnRegistrationSS'>
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Registration' />
								<Argument Type='' TypeKey = '' Value='RegistrationModuleConfig' />
								<Argument Type='' TypeKey = '' Value='Registration' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core.Web.Modules.cModuleCtl" %>
<%@ register tagprefix='Core' tagname='HorizNavigation'	src='../../../../../Core/Controls/Base/HorizNav.ascx' %>


<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td>
			<Core:HorizNavigation id='ctlGoToNavigation' NavKey='GoToUploadManager' runat='server' />
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
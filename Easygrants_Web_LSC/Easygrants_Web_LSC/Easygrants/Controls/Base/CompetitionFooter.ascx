<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" %>
<%@ register tagprefix='Core' tagname='dbgReleaseBuildDisplay' src='../../../Core/Controls/Base/dbgReleaseBuildDisplay.ascx' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>

<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Link to Registration Page(additional configuration information is specified in the 
				DisplayProperty node below) -->
<tr><td>&nbsp;</td></tr>
<tr>
	<td align='middle'>
	    <a href="#top" style="vertical-align:top" id="topButton" class="CSSButtonStyle" visible="true" >Top</a>

    </td>
</tr>				
<tr><td>&nbsp;</td></tr>
<tr>
	<td align="middle" class='CompetitionFooter'>
		For technical assistance, please contact <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a><!-- <span id='spnAncTech' runat='server'/> -->.
    	</td>
</tr>
<tr>
	<td align="middle" class='CompetitionFooter'>
		<a target='_blank' href='../../PDF/Terms of Use Document Hold Page.pdf'>Terms of Use</a>
	</td>
</tr>
<tr>
	<td align="middle" class='CompetitionFooter'>
		Powered by <a target='_blank' href='http://www.altum.com'>Easygrants&reg;</a>
	</td>
</tr>
<tr>
	<td align="middle" class='CompetitionFooter'>
		<Core:dbgReleaseBuildDisplay id='ctlReleaseBuildDisplay' runat='server'/>
	</td>
</tr>	
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
	<DataObject Key='Footer' DataObjectDefinitionKey=''>
		<Filters>
		</Filters>
		 <DisplayProperties>
			<!--<DisplayProperty PropertyKey=''>
				<Control Container='spnAncTech' 
					ID='ctlAncTech'
					Type='cLink'
					Caption='email'
					>
					<Action
						PostBack='False'
						Target='Blank'
						URL='../../../Easygrants/Controls/Base/pgSupportForm.aspx?Type=Tech'>
					</Action>				
				</Control>
			</DisplayProperty>	 -->
			
			
		</DisplayProperties>	
	</DataObject>
</ModuleSection>
<!-- End Embedded XML -->
</span>

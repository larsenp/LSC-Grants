<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- On June 24, 2005, Basil Eliopoulos changed the navigation URL from "/Easygrants_v4_WHCF_r1/...."  to  "/Easygrants_v4_AHA_r1/...."  per QA task.  --> 

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<p>
	You must create an annual budget for each of the four years of the grant.  
	Starting the budget is a two-step process, whereby you first enter the required 
	information below (see the fields with the red asterisk) and click <b>Save</b>.  
	The page will refresh with the full budget grid.  You may then enter budget data 
	and click <b>Save</b> to save your changes and <b>Close</b> to return to the 
	budget period list page.
</p>
<p>
	Enter information for the budget year below.  All fields marked with an asterisk (<FONT color=red>*</FONT>) are required.
</p>
<p>
	To save your changes, click on the <B>Save</B> button. Click on the <b>Close</b> 
	to close the page.
</p>

<b>Budget Requirements</b>
<br><br>
	This standard budget projection format is designed to be used for all types 
	of WHCF awards. Some sections may not be relevant to your grant. Please read 
	the instructions for completing the WHCF budget form carefully before filling 
	out this page (<span runat='server' id='spnGuidelines'/>).
<br><br>
	The Total Requested Amount can't exceed $50,000 per budget year.  The indirect costs 
	can’t equal more than 8% of the total award, to be subtracted from the $50,000.
<br><br>

<!-- Page Content - Controls -->

<Core:cUserCtlLoader CtlID='ctlBudgetEditor' 
	Src='EasyGrants/Controls/PageSection/BudgetPeriod_Editor.ascx'
	Properties='BudgetUploadVisible=True'
	runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGuidelines'
						Container='spnGuidelines'
						Type='cLink'
						Caption='View Budget Guidelines'>
						<Action PostBack='False'
							Target='_blank'
							URL='/Easygrants_v4_AHA_r1/Easygrants/PDF/WHCF-NS-BudgetGuide.pdf'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->



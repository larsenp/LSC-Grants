<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<br><br>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- On August 18, 2005 in the evening, Basil Eliopoulos modified the content of this -->
<!-- "Acceptance Submitted" page as per a content QA task so that it will conform to  -->
<!-- the configuration document for the same page.                                                   -->
<br />
&nbsp;If you have chosen to Accept this award, there are certain requirements that you will need to fulfil.  
&nbsp;&nbsp;You will find these requirements on your Home<br />
&nbsp;page under the To Do Applications section.
<br /><br />
&nbsp;To return to your Easygrants Home page, click the <b>Close</b> button.    

<br><br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Acceptance</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan="4">&nbsp;&nbsp;&nbsp;Your answer plus any explanation you entered on the previous page, appears below.</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='10%'>&nbsp;&nbsp;<b>Accepted?</b></td>
		<td><span runat='server' id='spnIsAccepted' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top'>&nbsp;&nbsp;<b>Explanation</b></td>
		<td><span runat='server' id='spnNonAcceptedReason' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<br>		
<br>		
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		<DataObject Key='GranteeProjectAHA' DataObjectDefinitionKey='GranteeProjectAHA'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='ModuleUser' TypeKey='PersonID' 
					PropertyKey='PersonID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsAccepted' Format='YesNo'>
					<Control ID='lblAccepted'
						Container='spnIsAccepted'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonAcceptedReasion'>
					<Control ID='lblNonAcceptedReasion'
						Container='spnNonAcceptedReason'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action PostBack='True' 
								Object='WebSession' 
								Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Home' />
								<Argument Type='' TypeKey='' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey='' Value='Home' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

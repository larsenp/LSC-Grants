<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<ul>
	<li>Applicant need not do anything on this page when
		submitting initial application, other than click &quot;Save and Continue.&quot;
		There will only be information on this page after submitting your LOI <i>and</i> if a reviewer has requested
		additional information.</li>
		<br><br>
	<li>If a reviewer submits comments or requests additional information, applicant will receive an email 
		directing them to go back to this page.</li>
</ul>

<P>To save your changes, click on the <B>Save</B> button.  All fields marked with an asterisk 
(<FONT color=red>*</FONT>) are required. 
</P>

<!-- Page Content - Controls -->
		
		

<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>	
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnSave_and_Continue'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Save='False'
						Type='cButton' GoToNextPage='True' >
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>



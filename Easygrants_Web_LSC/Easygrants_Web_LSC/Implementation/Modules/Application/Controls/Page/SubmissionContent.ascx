<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
      <span id='spnPageContent' runat='server' />
<br>

<br>
<table width='100%' cellpadding='2' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg'>Submission</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	<tr><td></td></tr>
	<span id='spnSubmitButton' runat='server'/>	
</table>



<table width='100%'>
	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Validation Summary</b>
		</td>
	</tr>
	<tr>
		<td><Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>
		</td>
	</tr>
</table>	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DisplayProperties>
			<DisplayProperty PropertyKey=''>
				<Control ID='btnSubmit'
					Container='spnSubmitButton'
					Type='cButton'
					Image='Submit'>
					<Action
						PostBack='True'
						Object='DataPresenter'
						Method='SubmissionContent_Submit'/>
					<Visible>
						<Argument PropertyKey='WfTaskStatusID' Value='1' NullDataObject='' />
					</Visible>						
				</Control>	
			</DisplayProperty>
		</DisplayProperties>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>

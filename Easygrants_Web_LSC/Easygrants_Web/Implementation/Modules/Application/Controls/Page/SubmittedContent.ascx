<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->

<table width='100%' cellpadding='2' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg'>
			Instructions
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table width='100%' cellpadding='2' cellspacing='0'>
	<tr>
		<td>
			Your application has been submitted.  You will receive an e-mail confirming this submission.<br>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' 
				Src='Core/Controls/Base/ReportOutputLink.ascx'
				runat='server' />	
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
			<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<!-- <DisplayProperty PropertyKey=''>
					<Control ID='ctlAcrobat'
						Container='spnAcrobat'
						Type='cLink'
						Caption='Free Acrobat Reader.'
						>
						<Action PostBack='False'
							Target='_blank'
							URL='http://www.adobe.com/products/acrobat/readstep2.html'/>
					</Control>
				</DisplayProperty> -->
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View PDF~'>
						<Parameters>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument PropertyKey='DefinitionID' 
								Value='2'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
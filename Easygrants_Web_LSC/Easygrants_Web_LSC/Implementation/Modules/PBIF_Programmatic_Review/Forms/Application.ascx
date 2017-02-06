<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<div style="width:800px;">
	<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
		Src='Core/Controls/Base/ValidationSummary.ascx'
		runat='server'/>
	<br />
		<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
			Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/ApplicationInfo.ascx'
			runat='server'/>
		<br />
	<span id='spnPageContent' runat='server' />
	
	<div class='SeparatorHdg'>
		Application
	</div>
	<br />
	<table cellpadding='1' width='600px'>
		<tr>
			<td>
				<b><%=GetLabel("ProjectTitle")%></b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnProjectTitle' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Total Grant Request</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnAmountRequested' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Total Project Budget</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnTotalBudget' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Grant Term (months)</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnGrantTermMonths' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<b>Executive Summary</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>&nbsp;
				
			</td>
		</tr>
		<tr>
			<td colspan='2'> 
				<span runat="server" id='spnExecSummary' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<b>Are you also requesting funding for this project through LSC’s TIG program ?</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnParrallelTig' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Are you applying for a TIG that complements this grant? </b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='SpnApplyForTIG' />
			</td>
		</tr>
	</table>
	<br />
</div>

      

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='AppWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='100'/>
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
		</DataObject>		
		<DataObject Key='LscPbifApp' DataObjectDefinitionKey='LscPbifApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProjectTitle'>
					<Control ID='spnProjectTitle'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AmountRequested' Format='$0,0'>
					<Control ID='spnAmountRequested'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='TotalBudget' Format='$0,0'>
					<Control ID='spnTotalBudget'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantTermMonths'>
					<Control ID='spnGrantTermMonths'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ParrallelTig' Format='YesNo'>
					<Control ID='spnParrallelTig'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ApplyForTIG' Format='YesNo'>
					<Control ID='spnApplyForTIG'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExecSummary'>
					<Control ID='spnExecSummary'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>		
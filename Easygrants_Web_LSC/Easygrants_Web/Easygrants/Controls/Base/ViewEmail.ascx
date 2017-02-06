<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ register tagprefix='Core' tagname='cCloseWindow' src='../../../Core/Controls/Base/CloseWindow.ascx' %>
<%@ register tagprefix='Core' tagname='cDropDown'  src='../../../Core/Controls/Base/DropDown.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ register Tagprefix='Crumb' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br><br>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<Crumb:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Relative' Key='AdditionalInformation' LinkTitle='Additional Information' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlApplicantInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Additional Information Editor</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width="25%">Subject</td>
		<td><span runat='server' id='spnSubject'></span></td>
	</tr>
	<tr>
		<td>From</td>
		<td><span runat='server' id='spnFrom'></span></td>
	</tr>
	<tr>
		<td>CC</td>
		<td><span runat='server' id='spnCC'></span></td>
	</tr>
	<tr>
		<td>BCC</td>
		<td><span runat='server' id='spnBCC'></span></td>
	</tr>
	<tr>
		<td valign='top'>Request Comments</td>
		<td><span runat='server' id='spnMessage'></span></td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' visible='true'>		
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>								
		<DataObject Key='ReviewAdditionalInformation' DataObjectDefinitionKey='ReviewAdditionalInformation' >
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewAdditionalInformationID'
					PropertyKey='ReviewAdditionalInformationID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='spnSubject' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EmailFrom'>
					<Control ID='spnFrom' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EmailCC'>
					<Control ID='spnCC' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EmailBCC'>
					<Control ID='spnBCC' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestComment'>
					<Control ID='spnMessage' Type='HtmlGenericControl'/>
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

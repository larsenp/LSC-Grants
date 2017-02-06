<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />


<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Legal Needs Assessment Data Sources and Tools</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area 1, Criterion 1 - <i>Periodic comprehensive assessment and ongoing consideration of the most pressing legal needs</i></b> </td>
	</tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
        <td colspan="4" >&nbsp;</td>
 </tr>
 <tr>
	<td><p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p>
	<p>Use the web form below to indicate whether the Applicant used data from the sources or tools identified. Complete this form by selecting the appropriate choice. Each inquiry in the form must be answered before the form can be submitted. Click the save button below once the form is completed and return to the proposal narrative.</p></td>
	<td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/>
    </td>
 </tr>
 <tr> <td >&nbsp;</td></tr>
 <tr>	
	<td><p><strong><u>Do not paste this form into the proposal narrative</u></strong>. Email questions pertaining to this form to the competition service desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a></p></td>
     <td >&nbsp;</td>
 </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td  colspan='4' class="SeparatorHdg" >Legal Needs Assessment Data Sources and Tools</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>1.  Census data (e.g. demographic data, employment data)<%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnCensusData' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>2.  Other legal needs studies (e.g. statewide needs studies, needs studies of similar service areas) <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnOtherLegalNeedsStudies' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>3. Geographic Information Systems (GIS) mapping <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnGISMapping' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>4. Other information (e.g. other government data, studies conducted by academics, business groups, or nonprofits) <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnOtherInformation' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>5. Intake data on cases not accepted <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnIntakeDataNotAccepted' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>6. CMS data regarding case types/ problem codes closed with extended or limited service  <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnCMSDataClosed' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>7. CMS data showing geographic location of Applicants for service and clients  <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnCMSDataShowing' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>8. Other (Specify)  <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><span runat="server" id='spnOtherText' /></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnOtherSelection' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br />
<br />







<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	     <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='2' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='66' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject>
	    
	    <DataObject Key='LscAssessmentDataSources' DataObjectDefinitionKey='LscAssessmentDataSources' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
			     <DisplayProperty PropertyKey='CensusData' Format='YesNo'>
					<Control ID='spnCensusData'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='OtherLegalNeedsStudies' Format='YesNo'>
					<Control ID='spnOtherLegalNeedsStudies'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='GISMapping' Format='YesNo'>
					<Control ID='spnGISMapping'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='OtherInformation' Format='YesNo'>
					<Control ID='spnOtherInformation'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='IntakeDataNotAccepted' Format='YesNo'>
					<Control ID='spnIntakeDataNotAccepted'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='CMSDataClosed' Format='YesNo'>
					<Control ID='spnCMSDataClosed'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='CMSDataShowing' Format='YesNo'>
					<Control ID='spnCMSDataShowing'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='OtherText' >
					<Control ID='spnOtherText'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='OtherSelection' Format='YesNo'>
					<Control ID='spnOtherSelection'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
		
			
	</ModuleSection>
</span>
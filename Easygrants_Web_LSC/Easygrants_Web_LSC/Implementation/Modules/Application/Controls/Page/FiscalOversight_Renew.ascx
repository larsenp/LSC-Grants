<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Fiscal Oversight and Internal Control Inquiry</h1></td>
	</tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
	<td><p>Applicants will use this form to disclose whether they experienced fraud, misappropriation of funds, embezzlement, or theft within the last twenty-four months.</p><p>Each section in the form must be answered before the form can be submitted. Click the save button below once the form is completed.</p></td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
 </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<div style='width:100%' class='SeparatorHdg'>Fiscal Oversight and Internal Control Inquiry</div>
<br />
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
       <td colspan="4" >1. Has applicant experienced fraud, misappropriation of funds, embezzlement, or theft within the last twenty-four months?<Font color='Red'>*</Font></td>
    </tr>
    <tr>
       <td><span id='spnFraudRecently' runat='server'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td>If yes, discuss:</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td>a.	the incident(s) that occurred including the job title(s) of the personnel  involved</td>
    </tr>
    <tr>
       <td><span id='spnFraudIncident' runat='server'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td>b.	what action was taken by the applicant in response to the incident(s)</td>
    </tr>
    <tr>
       <td><span id='spnFraudActionTaken' runat='server'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td>c.	what changes were made to applicant's fiscal oversight policies and procedures and internal controls following the incident(s)</td>
    </tr>
    <tr>
       <td><span id='spnFraudChangesMade' runat='server'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<br />
<table id="Table2" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	    <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	   
	    <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	    
	   <DataObject Key='LSCFiscalOversight' DataObjectDefinitionKey='LSCFiscalOversight' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FraudRecently'>
					<Control ID='ctlFraudRecently'
						Container='spnFraudRecently'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudIncident'>
					<Control ID='txtFraudIncident' 
						Type='cTextArea' 
						Container='spnFraudIncident' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudActionTaken'>
					<Control ID='txtFraudActionTaken' 
						Type='cTextArea' 
						Container='spnFraudActionTaken' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FraudChangesMade'>
					<Control ID='txtFraudChangesMade' 
						Type='cTextArea' 
						Container='spnFraudChangesMade' 
						Rows='2' 
						Cols='80'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
				
				
				
	</ModuleSection>
</span>
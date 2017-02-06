<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Priorities, Goals, Strategies and Desired Outcomes</h1></td>
	</tr>
	<tr>
		<td ><b>Performance Area One, Criteria 2 - <i>Setting goals and objectives, developing strategies and allocating resources</i></b> </td>
	</tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	<p>Instructions </p>
</div>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
	<td><p>Provide information about the applicant&rsquo;s  board-approved priorities, including goals, strategies and desired outcomes. </p>
      <ul type="disc">
        <li>To       enter a priority into the application, click&nbsp;<strong>Add</strong></li>
      </ul>
      <ul type="disc">
        <li>To edit a priority that has been entered, click&nbsp;<strong>Edit</strong></li>
        <li>To remove a priority from the application, click&nbsp;<strong>Delete</strong></li>
        <li>To go to the next web form, click&nbsp;<strong>Continue</strong></li>
    </ul></td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
 </tr>
 <tr><td>&nbsp;</td></tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<div style='width:100%' class='SeparatorHdg'>Priorities, Goals, Strategies and Desired Outcomes</div>
<br />
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	<tr><td><span runat='server' id='spnDatalist' /></td></tr>
</table>

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
		  
		 <DataObject Key='PrioritiesGoalsStrategiesPDF' DataObjectDefinitionKey='PrioritiesGoalsStrategiesPDF' >
             <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			 </Filters>
			 <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDatalist'
						Type='cDataListCtl'
						DataObjectDefinitionKey='PrioritiesGoalsStrategiesPDF'
						SeparatorWidth='1'>
						<DisplayProperty PropertyKey='Abbr' Width='20%'/>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Description'  Width='45%'/>
						<DisplayProperty PropertyKey='DesiredOutcome' ColumnHeader='Desired Outcome'  Width='35%'/>
					</Control>
				</DisplayProperty>
						
			</DisplayProperties>
	     </DataObject>
	
	
	
	
	
	</ModuleSection>
</span>
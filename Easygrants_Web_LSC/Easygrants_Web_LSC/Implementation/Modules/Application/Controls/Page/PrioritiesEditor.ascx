<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Priorities Editor</h1></td>
	</tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	<p>Instructions </p>
</div>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
	<td>
      <ul type="disc">
        <li>Enter the priority for the current year</li>
        <li>To add a goal to the priority, click&nbsp;<strong>Save and Add Goal</strong></li>
      </ul>
      <ul type="disc">
        <li>To edit a goal that has been entered, click&nbsp;<strong>Edit</strong></li>
        <li>To remove a goal from the priority, click&nbsp;<strong>Delete</strong></li>
        <li>To save and return to the Main Priorities Page, click&nbsp;<strong>Save and Close</strong></li>
        <li>To return without saving, click&nbsp;<strong>Close</strong></li>
    </ul></td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
 </tr>
 <tr><td><p><font color='red'>Always use the “Save and Close” or “Close” buttons at the bottom of the screen. Do not use the “back” button on your browser.</font></p></td></tr>
 <tr><td>&nbsp;</td></tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>Priorities</div>
<br />
<table width="600">
		<tr><td><b>Priority<Font color='Red'>*</Font></b></td>
			<td><span runat='server' id='spnPriorityDesc'/></td>
		</tr>
</table>	
<br />
<div style='width:600'>
     <span runat='server' id='spnAdd' />
   <br /><br />
     <span runat='server' id='spnGoalsDatalist' />
   <br />
</div>
<br />
<table width='600' runat='server' >
	<tr align='center'>
		<td>
			<span runat='server' id='spnSaveClose'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	   <DataObject Key='LscProgramPriorities' DataObjectDefinitionKey='LscProgramPriorities' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PrioritiesID' PropertyKey='PrioritiesID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PriorityDesc'> 
				   <Control ID='ctlPriorityDesc'
					 Container='spnPriorityDesc'
					 Type='cTextBox'
					 Size='70'
					 RequiredField='True'
					 ErrorMessage='Priority Name is required.'> 
				   </Control> 
			   </DisplayProperty> 
		    </DisplayProperties>
        </DataObject>
         
        <DataObject Key='LscGoal' DataObjectDefinitionKey='LscGoal' Updatable='False' CreateNew='False'>
             <Filters>
				<Argument Type='QueryString' TypeKey='GoalID' PropertyKey='GoalID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscProgramPriorities' DataObjectPropertyKey='PrioritiesID' PropertyKey='PrioritiesID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Save and Add Goal'>
						<Action PostBack='True'
						    AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument  AttributeName='PageKey' Value='PriorityGoalsEditor' />
								<Argument Value='GoalID=0' />
								<Argument Type='DataObjectCollection' TypeKey='LscProgramPriorities' DataObjectPropertyKey='PrioritiesID' BaseValue='PrioritiesID='/>
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
		<DataObject Key='LscGoalDatalist' DataObjectDefinitionKey='LscGoal' Updatable='False' CreateNew='False'>
             <Filters>
				    <Argument Type='DataObjectCollection' TypeKey='LscProgramPriorities' DataObjectPropertyKey='PrioritiesID' PropertyKey='PrioritiesID'/>
			 </Filters>
			 <Sort>
				    <Argument PropertyKey='GoalID'/>
			 </Sort>
			 <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGoalsDatalist'
						Container='spnGoalsDatalist'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscGoal'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='GoalDesc' ColumnHeader='Goal'  Width='25%'/>
						<DisplayProperty PropertyKey='LscLegalProblemType.Description' ColumnHeader='Problem Type'  Width='30%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PriorityGoalsEditor'/>
										<Argument Type='DataObject' TypeKey='GoalID' AttributeName='GoalID' BaseValue='GoalID='/>
										<Argument Type='DataObject' TypeKey='PrioritiesID' AttributeName='PrioritiesID' BaseValue='PrioritiesID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='GoalID' AttributeName='GoalID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
	     </DataObject>
	
	    <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
		    <DisplayProperties>	  
			   <DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Type='cButton'
						Container='spnSaveClose'
						Caption='Save and Close'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='PV_Priorities' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='PV_Priorities' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
	
	
	
	</ModuleSection>
</span>
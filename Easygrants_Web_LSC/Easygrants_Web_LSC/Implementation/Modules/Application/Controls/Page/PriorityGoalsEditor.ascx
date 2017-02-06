<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Priority Goals Editor</h1></td>
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
        <li>Enter the goal for the current year, and select the Problem Type that most closely describes this goal. </li>
        <li>To add a strategy to the priority, click&nbsp;<strong>Save and Add Strategy</strong></li>
      </ul>
      <ul type="disc">
        <li>To edit a strategy that has been entered, click&nbsp;<strong>Edit</strong></li>
        <li>To remove a strategy from the goal, click&nbsp;<strong>Delete</strong></li>
        <li>To save and return to the Priorities Editor Page, click&nbsp;<strong>Save and Close</strong></li>
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
<div style='width:600' class='SeparatorHdg'>Goals</div>
<br />
<table width="600">
        <tr>
			<td><b>Priority</b></td>
			<td><span runat='server' id='spnPriority'/></td>
		</tr>
		<tr>
			<td><b>Goal<Font color='Red'>*</Font></b></td>
			<td><span runat='server' id='spnGoalDesc'/></td>
		</tr>
		<%--<tr>
		    <td><b>Goal Type<Font color='Red'>*</Font></b></td>
		    <td><span runat='server' id='spnGoalType'/></td>
		</tr>--%>
		<tr>
		    <td><b>Problem Type<Font color='Red'>*</Font></b></td>
		    <td><span runat='server' id='spnProblemType'/></td>
		</tr>
</table>	
<br />
<div style='width:600'>
     <span runat='server' id='spnAdd' />
   <br /><br />
     <span runat='server' id='spnStrategiesDatalist' />
   <br />
</div>
<br />
<br />
<table width='600' runat='server' >
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
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
			<DisplayProperties>
			    <DisplayProperty PropertyKey='PriorityDesc'>
					<Control ID='spnPriority'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
        </DataObject>
						
	    <DataObject Key='LscGoal' DataObjectDefinitionKey='LscGoal' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GoalID' PropertyKey='GoalID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='PrioritiesID' PropertyKey='PrioritiesID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GoalDesc'> 
				   <Control ID='ctlGoalDesc'
					 Container='spnGoalDesc'
					 Type='cTextBox'
					 Size='70'
					 RequiredField='True'
					 ErrorMessage='Goal Name is required.'> 
				   </Control> 
			   </DisplayProperty> 
			  <%-- <DisplayProperty PropertyKey='GoalTypeID'> 
				 <Control ID='ctlGoalType'
					Container='spnGoalType'
					Type='cDropDown'
					DataObjectDefinitionKey='LscGoalType'
					StoredValue='GoalTypeID'
					DisplayValue='Desc' /> 
			   </DisplayProperty> --%>
			   <DisplayProperty PropertyKey='ProblemTypeID'> 
				 <Control ID='ctlProblemType'
					Container='spnProblemType'
					Type='cDropDown'
					DataObjectDefinitionKey='LscLegalProblemType'
					StoredValue='LscLegalProblemTypeID'
					DisplayValue='Description' 
					RequiredField='True'
					ErrorMessage='Problem Type is required.' /> 
			    </DisplayProperty>
			 </DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscStrategies' DataObjectDefinitionKey='LscStrategies' Updatable='False' CreateNew='False'>
             <Filters>
				<Argument Type='QueryString' TypeKey='StrategiesID' PropertyKey='StrategiesID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscGoal' DataObjectPropertyKey='GoalID' PropertyKey='GoalID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Save and Add Strategy'>
						<Action PostBack='True'
						    AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument  AttributeName='PageKey' Value='PriorityStrategiesEditor' />
								<Argument Value='StrategiesID=0' />
								<Argument Type='DataObjectCollection' TypeKey='LscGoal' DataObjectPropertyKey='GoalID' BaseValue='GoalID='/>
								<Argument Type='DataObjectCollection' TypeKey='LscGoal' DataObjectPropertyKey='PrioritiesID' BaseValue='PrioritiesID='/>
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
	     </DataObject>
	     
	     <DataObject Key='LscStrategiesDatalist' DataObjectDefinitionKey='LscStrategies' Updatable='False' CreateNew='False'>
             <Filters>
				    <Argument Type='DataObjectCollection' TypeKey='LscGoal' DataObjectPropertyKey='GoalID' PropertyKey='GoalID'/>
			 </Filters>
			 <Sort>
				    <Argument PropertyKey='StrategiesID'/>
			 </Sort>
			 <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlStrategiesDatalist'
						Container='spnStrategiesDatalist'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscStrategies'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='StrategyDesc' ColumnHeader='Strategy'  Width='25%'/>
						<DisplayProperty PropertyKey='LscStrategyType.Desc' ColumnHeader='Strategy Type'  Width='15%'/>
						<DisplayProperty PropertyKey='DesiredOutcomes' ColumnHeader='Desired Outcomes'  Width='15%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PriorityStrategiesEditor'/>
										<Argument Type='DataObject' TypeKey='StrategiesID' AttributeName='StrategiesID' BaseValue='StrategiesID='/>
										<Argument Type='DataObject' TypeKey='GoalID' AttributeName='GoalID' BaseValue='GoalID='/>
										<Argument Type='DataObjectCollection' TypeKey='LscGoal' DataObjectPropertyKey='PrioritiesID' BaseValue='PrioritiesID='/>
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
										<Argument Type='DataObject' TypeKey='StrategiesID' AttributeName='StrategiesID'/>
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
						Container='spnSave'
						Caption='Save and Close'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='PrioritiesEditor' />
								<Argument Type='QueryString' TypeKey='PrioritiesID' BaseValue='PrioritiesID=' />
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
								<Argument Value='PrioritiesEditor' />
								<Argument Type='QueryString' TypeKey='PrioritiesID' BaseValue='PrioritiesID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
	
	
	
	
	
	</ModuleSection>
</span>
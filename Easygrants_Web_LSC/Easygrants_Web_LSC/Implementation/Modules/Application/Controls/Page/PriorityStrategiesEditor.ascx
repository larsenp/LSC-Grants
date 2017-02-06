<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Priority Strategies Editor</h1></td>
	</tr>
</table>
<br />
<div style="width:600" class="SeparatorHdg">
		Instructions
</div>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
	<td>
      <ul type="disc">
        <li>Enter the strategy for the current year, and indicate the Strategy Type – Cases or Other Services </li>
        <li>For Case strategies, a Desired Outcome is required. Enter projected outcomes for the current year. </li>
        <li>To save and return to the Goals Editor Page, click&nbsp;<strong>Save and Close</strong></li>
        <li>To return without saving, click&nbsp;<strong>Close</strong></li>
      </ul>
    </td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
 </tr>
 <tr>
 	<td colspan='2'>
		<p>Applicants must provide outcomes data for case services entered as “strategies” in this form. Before entering outcomes data, please review the definition of case service outcomes, the examples of acceptable outcomes, and the examples of unacceptable outcomes.</p>
 
		<p><strong>Definition of case service outcomes:</strong></p>
		<p>Case services outcomes are the tangible results of case services such as improvements in clients’ housing conditions, income, domestic stability, assets, access to services, employment, etc. Case service outcomes for clients should be expressed in concrete, measurable terms so that applicants can readily determine their ultimate success in accomplishing the outcomes.</p>

		<p><strong>Examples of acceptable outcomes for cases:</strong></p>
		<ul>
			<li>
				criminal records of 150 clients will be expunged
			</li>
			<li>
				200 families will have court orders that protect a family member from domestic violence
			</li>
			<li>
				100 foreclosures will be prevented
			</li>
			<li>
				200 evictions will be averted
			</li>
			<li>
				200 clients will obtain or have SSI/SSD benefits increased
			</li>
		</ul>

		<p><strong>Examples of unacceptable case outcomes:</strong></p>
		<ul>
			<li>
				Develop and launch three medical legal partnerships <em>(reason: does not describe results of case services)</em>
			</li>
			<li>
				Provide all domestic violence shelters with information about how the legal aid program can help <em>(reason: does not describe case services, does not specify tangible benefits in measurable terms)</em>
			</li>
			<li>
				Reduce the percentage of homelessness in the client community <em>(reason: not specific enough; state the estimated number of foreclosures/evictions prevented)</em>
			</li>
			<li>
				Provide high quality legal representation to the client community <em>(reason: does not specify concrete, tangible benefits in measurable terms)</em>
			</li>
		</ul>
		<p><font color='red'>Always use the “Save and Close” or “Close” buttons at the bottom of the screen. Do not use the “back” button on your browser.</font></p>
	</td>
</tr>
 <tr><td>&nbsp;</td></tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>Strategies</div>
<br />
<table width="600">
        <tr>
			<td><b>Priority</b></td>
			<td><span runat='server' id='spnPriority'/></td>
		</tr>
		<tr>
		    <td><b>Goal</b></td>
		    <td><span runat='server' id='spnGoal'/></td>
		</tr>
		<tr>
			<td><b>Strategy that supports Goal<Font color='Red'>*</Font></b></td>
			<td><span runat='server' id='spnStrategyDesc'/></td>
		</tr>
		<tr>
		    <td><b>Strategy Type<Font color='Red'>*</Font></b></td>
		    <td><span runat='server' id='spnStrategyType'/></td>
		</tr>
		<tr>
		    <td><b>Desired Outcomes towards achieving Goal</b></td>
		    <td><span runat='server' id='spnDesiredOutcomes'/></td>
		</tr>
</table>
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
	 
	  <DataObject Key='LscStrategies' DataObjectDefinitionKey='LscStrategies' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='StrategiesID' PropertyKey='StrategiesID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GoalID' PropertyKey='GoalID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='StrategyDesc'> 
				   <Control ID='ctlStrategyDesc'
					 Container='spnStrategyDesc'
					 Type='cTextBox'
					 Size='70'
					 RequiredField='True'
					 ErrorMessage='Strategy Name is required.'> 
				   </Control> 
			   </DisplayProperty> 
			   <DisplayProperty PropertyKey='StrategyTypeID'> 
				 <Control ID='ctlStrategyType'
					Container='spnStrategyType'
					Type='cDropDown'
					DataObjectDefinitionKey='LscStrategyType'
					StoredValue='StrategyTypeID'
					DisplayValue='Desc' 
					RequiredField='True'
					ErrorMessage='Strategy Type is required.' /> 
			   </DisplayProperty> 
			   <DisplayProperty PropertyKey='DesiredOutcomes'> 
				   <Control ID='ctlDesiredOutcomes'
					 Container='spnDesiredOutcomes'
					 Type='cTextBox'
					 Size='70'> 
				   </Control> 
			   </DisplayProperty> 
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscGoal' DataObjectDefinitionKey='LscGoal' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GoalID' PropertyKey='GoalID' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='LscProgramPriorities.PriorityDesc'>
					<Control ID='spnPriority'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GoalDesc'>
					<Control ID='spnGoal'
						Type='HtmlGenericControl' />
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
								<Argument Value='PriorityGoalsEditor' />
								<Argument Type='QueryString' TypeKey='GoalID' BaseValue='GoalID=' />
								<Argument Type='DataObjectCollection' TypeKey='LscGoal' DataObjectPropertyKey='PrioritiesID' BaseValue='PrioritiesID='/>
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
								<Argument Value='PriorityGoalsEditor' />
								<Argument Type='QueryString' TypeKey='GoalID' BaseValue='GoalID=' />
								<Argument Type='DataObjectCollection' TypeKey='LscGoal' DataObjectPropertyKey='PrioritiesID' BaseValue='PrioritiesID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
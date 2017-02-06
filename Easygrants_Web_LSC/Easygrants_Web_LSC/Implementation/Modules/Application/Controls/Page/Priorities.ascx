<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Priorities, Goals, Strategies and Desired Outcomes</h1></td>
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
        <li>To enter a priority into the application, click&nbsp;<strong>Add</strong></li>
        <li>To edit a priority that has been entered, click&nbsp;<strong>Edit</strong></li>
        <li>To remove a priority from the application, click&nbsp;<strong>Delete</strong></li>
        <li>When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return</li>
   	</ul>
		<p style="color:red">For those applying to multiple service areas: This RFP Chart is <em>not</em> linked across service areas. Applicants should enter information into this form that is specific to this service area.</p>
		<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>
	</td>
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
<div style='width:600' class='SeparatorHdg'>Priorities, Goals, Strategies and Desired Outcomes</div>
<br />
<div style='width:600'>
     <span runat='server' id='spnAdd' />
   <br /><br />
     <span runat='server' id='spnDataList' />
   <br />
   <div style="text-align:center">
		<span runat='server' id='spnCloseStd' />
		<span runat='server' id='spnClosePPQV' />
  </div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

	
		<DataObject Key='LscProgramPriorities' DataObjectDefinitionKey='LscProgramPriorities' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Add Priority'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument  AttributeName='PageKey' Value='PrioritiesEditor' />
								<Argument Value='PrioritiesID=0' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscProgramPriorities'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='PriorityDesc' ColumnHeader='Priority'  Width='55%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PrioritiesEditor'/>
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
										<Argument Type='DataObject' TypeKey='PrioritiesID' AttributeName='PrioritiesID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
			 <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToCriterion'
						Type='cLabel'
						Container='spnReturnToCriterion'
						LabelText='Save and Return to Criterion Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToPA'
						Type='cLabel'
						Container='spnReturnToPA'
						LabelText='Save and Return to Performance Area Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCloseStd'
						Type='cButton'
						Container='spnCloseStd'
						Caption='Save and Return to Criterion Page'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="AppFormByCriterion"/>
								<Argument Type='QueryString' TypeKey='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClosePPQV'
						Type='cButton'
						Container='spnClosePPQV'
						Caption='Save and Return to Performance Area Page'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="PostPQVPA1"/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>
</span>
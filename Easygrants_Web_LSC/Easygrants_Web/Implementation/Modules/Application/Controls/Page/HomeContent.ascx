<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->

<table>
	<tr>
		<td>
			<p>Welcome to your Easygrants&reg; grantee home page.
			<br><br>
		</td>
	</tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Profile</b>
		</td>
	</tr>
	<tr>
		<td>
			<br>
			Profile is your personal information management tool. 
			To ensure that your profile reflects the 
			most current information, be sure to update your profile periodically
			<br><br>
			
			<span id='spnProfile' visible='true' runat='server'></span>
			<br><br>
		</td>
	</tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>To Do</b>
		</td>
	</tr>
	<tr>
		<td>
			<br>
			The To Do list displays all of the grant application tasks required 
			of you for each grant to which you have applied. You may access any 
			of the tasks listed below by clicking on the program name.
			<br><br>
			
			<span id='spnApply' visible='true' runat='server'></span>
			<br><br>
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnToDoListApplicant' visible='true'></span>
		</td>
	</tr>
</table>	


	
	<!-- Embedded XML Page Functionality - please do not edit -->
	<span id='spnConfigXML' visible='false' runat='server'>
		<ModuleSection>
		<DataObject Key='ProfileOther' DataObjectDefinitionKey='' Updatable='False'>		
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonID'>
					<Control ID='profile' 
						Type='cLink' 
						Container='spnProfile'
						Caption='View your profile'>
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Profile' />
								<Argument Type='' TypeKey = ''  Value='ProfileModuleConfig' />
								<Argument Type='' TypeKey = '' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PersonID'>
					<Control ID='apply' 
						Type='cLink' 
						Container='spnApply'
						Caption='Start a new application'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ApplyGrant' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
			
		<!--APPLICANT -->
		<DataObject Key='List1' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<!--<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Operator='NotEqual' Value='3' />-->
				<Argument Type='' TypeKey='' PropertyKey='WfTaskRoleID'  Value='1' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskID'  Operator='NotEqual' Value='10' />
			</Filters>
			<Sort>
				<Argument PropertyKey='GrantTitle'>	
					<RelatedProperty PropertyKey='GranteeProject'/>
				</Argument>
			</Sort>	
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListApplicant'
						Container='spnToDoListApplicant'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task' >
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTask.WfTask' />															
								<Argument Value='1' ValueKey='WfTaskStatusID' DisplayValue='Control' PropertyKey='WfTask.WfTask'> 
									<Control ID='ctlLink'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='2' ValueKey='WfTaskStatusID' DisplayValue='Control' PropertyKey='WfTask.WfTask'> 
									<Control ID='ctlLink2' 
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='WfTaskModule.ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.GrantTitle' ColumnHeader='ProjectTitle' ConfigurableHeader='True' />
						<DisplayProperty PropertyKey='WfTask.WfTaskProgram' ColumnHeader='Program'/>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status' >
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus.WfTaskStatus' />
								<Argument Value='1' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus.WfTaskStatus' />
								<Argument Value='2' ValueKey='WfTaskStatusID'  DisplayValue='' PropertyKey='WfTaskStatus.WfTaskStatus' />
							</Parameters>
						
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>									
	</ModuleSection>
<!-- End Embedded XML -->
</span>

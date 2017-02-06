<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cPersonalTaskListStaffReassign" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>
<br>

<table width='100%' cellpadding='3'>
	<tr><td class='SeparatorHdg' colspan='3'>Reassignment</td></tr>
	<tr><td colspan='3'>&nbsp;</td></tr>
	<tr><td width='1%'></td><td><b>Task</b></td><td><span id='spnTask' runat='server'/></td></tr>
	<tr><td width='1%'></td><td><b>Reassign To</b>&nbsp;<font color='red'>*</font></td><td><Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlPer'
				Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx'
				runat='server'/></td></tr>
	<tr><td colspan='3'>&nbsp;</td></tr>
	<tr align='center'><td colspan='3'><span id='spnContinue' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnCancel' runat='server'/></td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
        <DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonID' PropertyValue='LastNameFirstName' ReadOnly='QueryID'>
					    <Control ID='ctlPer' Type='cPopUpSelectorLauncher2' RequiredField='True' LabelText='Selected Contact'
						    ErrorMessage='Reassign To is required.' >						   
						</Control>   
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask.WfTask'> 
					<Control ID='spnTask'
							Type='HtmlGenericControl'/>								
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
        <DataObject Key='EmailMessage' DataObjectDefinitionKey='EmailMessage' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument PropertyKey='CorrespondenceDefinitionID' Value='131'/>
			</Filters>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Caption='Close'>
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='Home'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Type='cButton'
						Caption='Save and Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='ContinueToEmail'>
							<Parameters>
								 <Argument Type='Control' TypeKey = 'ctlPer' ControlPropertyKey='ObjID' Value='' />
								 <Argument Type='DataObjectCollection' TypeKey='WfTA' DataObjectPropertyKey='WfTaskAssignmentID' Value=''/>
								 <Argument Type='DataObjectCollection' TypeKey='WfTA' DataObjectPropertyKey='GranteeProjectID' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>  
			</DisplayProperties>
		</DataObject>	
		<UserCtlLoader>			
			<ctlPer>
				<DataObject Key='PersonID' DataObjectDefinitionKey='StaffUserType' DisplayName='contact &amp;apos;s  last name '>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name' />
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='Person.LastNameFirstName' />
					</DisplayProperties>
				</DataObject>
			</ctlPer>
		</UserCtlLoader>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

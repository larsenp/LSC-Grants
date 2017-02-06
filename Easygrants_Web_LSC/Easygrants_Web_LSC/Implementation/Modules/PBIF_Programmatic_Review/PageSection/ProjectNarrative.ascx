<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div style="width:800px;">
<br />
	<div class='SeparatorHdg'>
		Project Narrative
	</div>
	<br />
	<span runat="server" id='spnNarrative' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AppWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='100'/>
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
		</DataObject>		
		<DataObject Key='LscPbifApp' DataObjectDefinitionKey='LscPbifApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Narrative'>
					<Control ID='lblNarrative'
						Type='cLabel'
						Container='spnNarrative'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>		
	</ModuleSection>
</span>		

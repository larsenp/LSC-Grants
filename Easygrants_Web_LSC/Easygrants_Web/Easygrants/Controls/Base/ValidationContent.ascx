<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cValidationDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table runat='server' id='tabHeader' border='0' width='100%' cellpadding='0' cellspacing='0'/>
<table runat='server' id='tabResults' border='0'/>
<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
	<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
		<Filters>
			<Argument Type='ModuleUser' 
				TypeKey='WfTaskAssignmentID'
				PropertyKey='WfTaskAssignmentID'
				Value='' 
				bool=''/>
		</Filters>
	</DataObject>
</ModuleSection>
</span>

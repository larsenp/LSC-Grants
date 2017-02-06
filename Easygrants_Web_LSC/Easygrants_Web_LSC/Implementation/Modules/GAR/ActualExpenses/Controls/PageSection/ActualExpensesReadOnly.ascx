<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ActualExpenses.Controls.PageSection.cActualExpensesEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>

<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'/>
<br />

<script language="javascript">
	coll = window.document.forms[0].elements
	
	for(var i = 0; i<coll.length;i++) {
		if(coll[i].name.match("txtText") == "txtText"){
			coll[i].readOnly = true;
		}
	}
</script>

<!-- USER MODIFIABLE CONTENT AREA -->


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
		  <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		  </Filters>
		</DataObject>

		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>

		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' Updatable='True' CreateNew='True'>
		  <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' >
					<RelatedProperty PropertyKey='LscWfTABudgetPeriod' />
				</Argument>
		  </Filters>
		</DataObject>
		
		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod' Updatable='True' CreateNew='True'>
		  <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' >
					<RelatedProperty PropertyKey='LscWfTABudgetPeriod' />
				</Argument>
		  </Filters>
		</DataObject>
		
		<DataObject Key='TopBudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False'>
		  <Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='ProjectID' />
				<Argument PropertyKey='CategoryTypeID' Value='8' />
				<Argument PropertyKey='ParentID' Value='0'>
					 <RelatedProperty PropertyKey='Parent'/>
				</Argument>
		  </Filters>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
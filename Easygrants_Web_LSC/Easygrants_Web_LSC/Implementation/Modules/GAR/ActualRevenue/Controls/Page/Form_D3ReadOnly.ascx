<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ActualRevenue.Controls.PageSection.cForm_D3" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form D-3: Actual Support and Revenue</h1></td>
  </tr>
</table>
<div width='100%' class='SeparatorHdg'></div>

<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<div style='width:600' class='SeparatorHdg'>Support &amp; Revenue  Detail</div>
<br />
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
				<Argument PropertyKey='CategoryTypeID' Value='9' />
				<Argument PropertyKey='ParentID' Value='0'>
					 <RelatedProperty PropertyKey='Parent'/>
				</Argument>
		  </Filters>
		</DataObject>

		<DataObject Key='LscWfTAAwardAmount' DataObjectDefinitionKey='LscWfTAAwardAmount' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
	</ModuleSection>
</span>
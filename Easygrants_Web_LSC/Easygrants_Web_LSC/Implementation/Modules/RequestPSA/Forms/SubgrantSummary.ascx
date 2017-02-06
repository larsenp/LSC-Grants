<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantApproval/PageSection/SubgrantInfo.ascx'
	runat='server'/>

<div width='100%' class="SeparatorHdg">
	Instructions
</div>
<br />
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td><p>The <strong>Subgrant Summary</strong> page captures information regarding the type(s) of services to be provided under the subgrant agreement and the type of contract to be used (i.e., flat fee, fee for service, retainer, etc.).</p>
    </td>
  </tr>
</table>
<br /><br />
<div width='100%' class="SeparatorHdg">
	Other Goals of Subgrant
</div>
<table width='400px' cellpadding='1'>
	<tr>
		<td>
			<b>PAI Related?<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<span runat='server' id='spnPaiRelated' />
		</td>
	</tr>
</table>
<br />
<div width='100%' class="SeparatorHdg">
	Type of Contract<%=kDenoteRequiredField%>
</div>
<br />
<br />Select one.
<br />
<span runat='server' id='spnLscSubgrantContractType' />
<br />
If Other, please explain<br />
<span runat='server' id='spnTOCOtherServices'/><br /><br />
<div class='SeparatorHdg'>
	Types of Services<%=kDenoteRequiredField%>
</div>
<br />Select as many as apply.
<br />
<span runat='server' id='spnLscSubgrantServByType' />
<br />
If Other, what services will be provided?<br />
<span runat='server' id='spnOtherServices'/><br /><br />
<div style="text-align:center">
	<span runat='server' id='spnSave'/>&nbsp;
	<span runat='server' id='spnSaveContinue'/>
</div>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWfTASubgrant' DataObjectDefinitionKey='LscWfTASubgrant' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PaiRelated'>
					<Control ID='ctlPaiRelated'
						Type='cRadioButtonList'
						Container='spnPaiRelated'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherServices'>
					<Control ID='txtOtherServices'
						Type='cTextArea'
						Container='spnOtherServices'
						Cols='50'
						Rows='3'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherContractTypes'>
					<Control ID='txtTOCOtherServices'
						Type='cTextArea'
						Container='spnTOCOtherServices'
						Cols='50'
						Rows='3'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscSubgrantContractTypeID'>
					<Control ID='ctlLscSubgrantContractType'
						Type='cRadioButtonList'
						Container='spnLscSubgrantContractType'
						DataObjectDefinitionKey='LKPLscSubgrantContractType'
						StoredValue='LscSubgrantContractTypeID'
						DisplayValue='SortDescription' >
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscSubgrantServByType'>
					<Control ID='ctlLscSubgrantServByType'
						Container='spnLscSubgrantServByType'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscSubgrantServType'
						DisplayValue='SortDescription'
						StoredValue='LscSubgrantServTypeID'
						RepeatColumns='0'
						CellSpacing='2'
						RepeatDirection='Vertical'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' CreateNew='True' Update='True'/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

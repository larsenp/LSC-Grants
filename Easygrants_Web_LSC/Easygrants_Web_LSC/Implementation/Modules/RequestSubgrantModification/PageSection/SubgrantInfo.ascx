<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<div class='SeparatorHdg'>Subgrant Information</div>
<br />
<table style="width:100%; padding:1px 1px 5px 1px">
	<tr>
		<td style="width:200px">
			<b>Subrecipient Name</b>
		</td>
		<td>
			<span runat='server' id='spnSubgranteeName' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Subgrant Term</b>
		</td>
		<td>
			<span runat='server' id='spnStartDate' />
			&nbsp;-&nbsp;
			<span runat='server' id='spnEndDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Subgrant Amount</b>
		</td>
		<td>
			$<span runat='server' id='spnSubgrantAmount' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='53' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='116' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='LscWfTASubgrant' DataObjectDefinitionKey='LscWfTASubgrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubgranteeName'>
					<Control ID='spnSubgranteeName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate' Format='M/d/yyyy'>
					<Control ID='spnStartDate'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate' Format='M/d/yyyy'>
					<Control ID='spnEndDate'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgrantAmount' Format='#,0'>
					<Control ID='spnSubgrantAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
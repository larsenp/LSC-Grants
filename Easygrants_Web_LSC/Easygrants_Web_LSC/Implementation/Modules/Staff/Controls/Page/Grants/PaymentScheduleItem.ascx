<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table width='600' cellpadding='1'>
	<td width='100' valign='top'>
		<span runat='server' id='spnPeriodStart' />&nbsp;-&nbsp;
		<span runat="server" id='spnDueDate' />
	</td>
	<td width='400' valign='top'>
		<span runat='server' id='spnMilestones' />
	</td>
	<td width='100' valign='top'>
		<span runat='server' id='spnRequestedAmount' />
	</td>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='Payment' Key='Payment' DataObjectDefinitionKey='Payment' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscPayment.PeriodStart' Format='M/yyyy'>
					<Control ID='spnPeriodStart'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestedDate' Format='M/yyyy'>
					<Control ID='spnDueDate'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestedAmount' Format='$#,0'>
					<Control ID='spnRequestedAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscMilestone' DataObjectDefinitionKey='LscMilestone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Payment' DataObjectPropertyKey='PaymentID' PropertyKey='PaymentID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='MilestoneNumber' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlMilestones'
						Type='cDataListCtl'
						Container='spnMilestones'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='MilestoneNumber' Width='20'/>
						<DisplayProperty PropertyKey='Milestone' Width='375'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

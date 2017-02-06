<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cReviewNotify" CodeBehind="ReviewNotify.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStagePages.ascx'
	runat='server'/>
<br>
<b>History:</b> <EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='ReviewNotify' LinkTitle='Notification' runat='server'/>
<br>
<Core:cUserCtlLoader CtlID='ReviewStageInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>
	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg">
			<b>Identify Committees to Notify <font color=red>*</font></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Select one or more committees from the Available list and click the <B>Add</B> button to add them to the Selected list. 
			To select multiple committees, use the <B>CTL</B> key while clicking on the items in the Available list and click 
			the <B>Add</B> button.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnReviewCycleCommittee'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'><span runat='server' id='spnSaveContinue'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>E-mail Notification History - For This Review Cycle</b></td>
	</tr>
</table>
<p><b>Review/Award Cycle</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnCycle'/>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TimePeriod.Description'>
					<Control ID='spnCycle' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewCycleNotification'>
					<Control ID='ctlReviewCycleCommittee'
						Container='spnReviewCycleCommittee'
						Type='cDoubleListBox'
						DataObjectDefinitionKey='ReviewCycleCommittee'
						DisplayValue='ReviewCommittee.ReviewCommitteeDescription'
						StoredValue='ReviewCommitteeID'
						StoredDisplayValue='ReviewCommittee.ReviewCommitteeDescription' 
						Height='9'
						DisplayNone='False'
						DisplaySort='False'
						DisplayMoveAll='True'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
							<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' Value=''/>
						</DefaultValues>
						<Filters>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='ReviewCycleNotificationLog' DataObjectDefinitionKey='ReviewCycleNotificationLog'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SendDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SendDate' ColumnHeader='Date Sent' Format='M/d/yyyy' >
							<Sortable>
								<Argument PropertyKey='SendDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Sender.LastNameFirstName' ColumnHeader='Sent By' >
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='Sender'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCycleStage.WfTask.WfTask' ColumnHeader='Review Stage Name'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='ReviewCycleStage.WfTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Template.Title' ColumnHeader='E-mail Template'>
							<Sortable>
								<Argument PropertyKey='Title'>
									<RelatedProperty PropertyKey='Template'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='NotificationLogCommittees' ColumnHeader='Committees' List='True'>
							<DisplayProperties>
								<DisplayProperty PropertyKey='ReviewCommittee.ReviewCommitteeDescription'/>
							</DisplayProperties>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Container='spnSaveContinue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewerEmailSend'/>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycleStage' DataObjectPropertyKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
								<Argument Type='ModulePage' TypeKey='PageKey' BaseValue='ReturnPageKey=' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

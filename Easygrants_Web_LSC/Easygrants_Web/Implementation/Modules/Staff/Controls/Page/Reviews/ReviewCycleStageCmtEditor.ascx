<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cReviewCycleStageCmtEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- Page Content - Top Of Page -->
<br>
Enter and select the appropriate values for the review stage.  All fields preceded by a red asterisk (<font color=red>*</font>) 
are required.
<p>
To save the review stage, click on the <b>Save</b> button.  To return to the Stages page, click on the <b>Close</b> 
button. <b>IMPORTANT:</b> if you close or navigate off this page before you save, you will lose unsaved 
information.<p>
<b>History:&nbsp;</b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='ReviewStageEdit' LinkTitle='Review Stage Edit' runat='server'/>
<br><br>
<Core:cUserCtlLoader CtlID='ReviewCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewCycleInfo.ascx'
	runat='server' ID="Cuserctlloader1"/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Review Stage Edit</b></td>
</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table2">
	<tr>
		<td width='200'>
			<b>Review Task (Stage)&nbsp;</b><font color=red>*</font>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnTask' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'>
			<b>Stage List Order&nbsp;</b><font color=red>*</font>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id="spnListOrder" visible='true'></span>
		</td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Committee Dates Edit</b></td>
</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td width='200'>
			<b>Committee Name</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnCmt' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'>
			<b>Start Date</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnStartDate' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'>
			<b>Open Date</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnOpenDate' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'>
			<b>Due Date</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnDueDate' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'>
			<b>Close Date</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnCloseDate' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'>
			<b>End Date</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnEndDate' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/>
			<!-- Cancel Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<!--
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCycleID'
					PropertyKey='ReviewCycleID' 
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='CompetitionType.Description'>
					<Control ID='spnType'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TimePeriod.Description'>
					<Control ID='spnTimePeriod'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		-->
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCycleStageID'
					PropertyKey='ReviewCycleStageID' 
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='spnTask'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ListOrder'>
					<Control ID='spnListOrder'
						Type='HtmlGenericControl'/>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ReviewCycleStageCommittee' DataObjectDefinitionKey='ReviewCycleStageCommittee' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCycleStageCommitteeID'
					PropertyKey='ReviewCycleStageCommitteeID' 
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ReviewCommittee.ReviewCommitteeDescription'>
					<Control ID='spnCmt'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						ShowDateTime='True'
						Calendar='True'
						DateFormat='MM/dd/yyyy'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='ctlOpenDate'
						Container='spnOpenDate'
						Type='cDateTextBox'
						ShowDateTime='True'
						Calendar='True'
						DateFormat='MM/dd/yyyy'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DueDate'>
					<Control ID='ctlDueDate'
						Container='spnDueDate'
						Type='cDateTextBox'
						ShowDateTime='True'
						Calendar='True'
						DateFormat='MM/dd/yyyy'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CloseDate'>
					<Control ID='ctlCloseDate'
						Container='spnCloseDate'
						Type='cDateTextBox'
						ShowDateTime='True'
						Calendar='True'
						DateFormat='MM/dd/yyyy'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						ShowDateTime='True'
						Calendar='True'
						DateFormat='MM/dd/yyyy'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>	
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

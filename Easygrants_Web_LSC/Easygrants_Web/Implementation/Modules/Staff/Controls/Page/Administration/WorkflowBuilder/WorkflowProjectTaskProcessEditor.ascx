<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cWorkflowProjectTaskProcessEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Add or Edit Task Processing</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Type&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProcessType' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Event&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEvent' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Order&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnSortOrder' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Short Description&nbsp;</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnShortDescription' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200' valign="top"><b>Long Description&nbsp;</b></td>
		<td width='10'>&nbsp;</td>
		<td valign="top">
			<span id='spnLongDescription' runat='server'/>
		</td>
	</tr>
</table>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4' align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveClose'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WorkflowEventsEditor' DataObjectDefinitionKey='WorkflowEvents' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WorkflowEventsID' PropertyKey='WorkflowEventsID' Value='' bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='WorkflowEvents' DataObjectDefinitionKey='WorkflowEvents' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WorkflowEventsID'
					PropertyKey='WorkflowEventsID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WorkflowID' PropertyKey='WorkflowID' Value=''/>
				<Argument Type='QueryString' TypeKey='WorkflowEventTypeID' PropertyKey='WorkflowEventTypeID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProcessTypeID'>
					<Control ID='ctlProcessType'
						Container='spnProcessType'
						Type='cDropDown'
						DataObjectDefinitionKey='ProcessType'
						StoredValue='ProcessTypeID'
						DisplayValue='Description'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Type is required.'>
						<Filters>
							<Argument Type='QueryString' TypeKey='WorkflowEventTypeID' PropertyKey='WorkflowEventTypeID' Value=''/>
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EventManagerEventID'>
					<Control ID='ctlEvent'
						Container='spnEvent'
						Type='cDropDown'
						DataObjectDefinitionKey='EventManagerEvents'
						StoredValue='EventManagerEventsID'
						DisplayValue='EventName'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Event is required.'>
						<Filters>
							<Argument Type='Data' TypeKey='' PropertyKey='IsActive' Value='True'/>
							<Argument Type='DataObjectCollection' TypeKey='WorkflowEventsEditor' PropertyKey='ProcessTypeID' DataObjectPropertyKey='ProcessTypeID' bool=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='EventName'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='ctlSortOrder'
						Container='spnSortOrder'
						Type='cTextBox'
						Size='5'
						MaxLength='3'
						AllowNumbersOnly='True'
						RequiredField='True'
						ErrorMessage='Order is required.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='EventManagerEvents' DataObjectDefinitionKey='EventManagerEvents' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WorkflowEvents'
					PropertyKey='EventManagerEventsID' DataObjectPropertyKey='EventManagerEventID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ShortDescription'>
					<Control ID='ctlShortDescription'
						Container='spnShortDescription'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LongDescription'>
					<Control ID='ctlLongDescription'
						Container='spnLongDescription'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton' EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='WorkflowEvents' DataObjectPropertyKey='WorkflowEventsID' PropertyKey='WorkflowEventsID' BaseValue='WorkflowEventsID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Container='spnSaveClose'
						Type='cButton'
						Image='Save and Close'>
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
</span>
<!-- End Embedded XML -->
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Edit Event</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Event Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEventName' runat='server'/>
		</td>
	</tr>
	<tr>
		<td width='200'>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td>Limit: 200 characters</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Event Type&nbsp;</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEventType' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Short Description&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnShortDescription' runat='server'/>
		</td>
	</tr>
	<tr>
		<td width='200'>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td>Limit: 1000 characters</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200' valign="top"><b>Long Description&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td valign="top">
			<span id='spnLongDescription' runat='server'/>
		</td>
	</tr>
	<tr>
		<td width='200'>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td>Limit: 1000 characters</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Active</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnIsActive' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
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
		<DataObject Key='EventManagerEvents' DataObjectDefinitionKey='EventManagerEvents' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EventManagerEventsID'
					PropertyKey='EventManagerEventsID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='EventName'>
					<Control ID='ctlEventName'
						Container='spnEventName'
						Type='cTextBox'
						Size='100'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Event Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ShortDescription'>
					<Control ID='ctlShortDescription'
						Container='spnShortDescription'
						Type='cTextBox'
						Size='100'
						MaxLength='1000'
						RequiredField='True'
						ErrorMessage='Short Description is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LongDescription'>
					<Control ID='ctlLongDescription'
						Container='spnLongDescription'
						Type='cTextArea'
						Rows='10'
						Cols='100'
						MaxLength='1000'
						RequiredField='True'
						ErrorMessage='Long Description is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsActive'>
					<Control ID='ctlIsActive'
						Container='spnIsActive'
						Type='cCheckBox'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='EventManagerEventsLabels' DataObjectDefinitionKey='EventManagerEvents' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EventManagerEventsID'
					PropertyKey='EventManagerEventsID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='EventManagerEventType.Description'>
					<Control ID='ctlEventType'
						Container='spnEventType'
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
								<Argument Type='DataObjectCollection' TypeKey='EventManagerEvents' DataObjectPropertyKey='EventManagerEventsID' PropertyKey='EventManagerEventsID' BaseValue='EventManagerEventsID='/>
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
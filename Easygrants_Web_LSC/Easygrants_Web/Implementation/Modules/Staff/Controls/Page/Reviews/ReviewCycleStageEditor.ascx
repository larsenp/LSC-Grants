<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cReviewCycleStageEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ReviewCycleStageEditor.ascx.vb" %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- Page Content - Top Of Page -->

<Core:cUserCtlLoader CtlID='ReviewCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewCycleInfo.ascx'
	runat='server'/>
	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Add or Edit Review Stage</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Review Stage Name&nbsp;</b><font color=red>*</font></td>
		<td><span runat='server' id='spnName'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit: 200 characters</td>
	</tr>
	<tr>
		<td><b>Review Task (Stage)&nbsp;</b><font color=red>*</font></td>
		<td><span runat='server' id='spnTask'/></td>
	</tr>	
	<tr>
		<td><b>Stage List Order</b></td>
		<td><span runat='server' id='spnListOrder'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='Name'>
					<Control ID='ctlName'
						Container='spnName'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Review Stage Name is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskID'>
					<Control ID='ctlTask'
						Container='spnTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'
						RequiredField='True'
						ErrorMessage='Review Task (Stage) is required.'>
						<Filters>
							<Argument PropertyKey='WfTaskTypeID' Value='4'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTask' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ListOrder'>
					<Control ID='ctlListOrder'
						Container='spnListOrder'
						Type='cTextBox'
						Size='5'
						AllowNumbersOnly='True'
						MaxLength='5'>
						<Validation Type='Custom' Object='EventController' Method='ValidateListOrder' ErrorMessage='Stage List Order must be a whole number.' />
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
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='ReviewCycleStage' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
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

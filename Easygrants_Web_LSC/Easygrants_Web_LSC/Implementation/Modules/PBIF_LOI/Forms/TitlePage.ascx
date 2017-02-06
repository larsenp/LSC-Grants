<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<span id='spnPageContent' runat='server' />

<div class='SeparatorHdg'>
	Title Page
</div>
<br />
<div style="width:600px">
	<table cellpadding='1' width='600px'>
		<tr>
			<td>
				<b><%=GetLabel("ProjectTitle")%></b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnProjectTitle' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Estimated Amount Requested</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
			    <span runat="server" id='spnEstimatedAmountRequested' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Estimated Total Project Cost</b>&nbsp;<%=kDenoteRequiredField%><br />
				(These amounts are populated automatically based on the LOI Budget Form)
			</td>
			<td style="vertical-align:top">
			    <span runat="server" id='spnEstimatedTotalProjectCost' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Estimated Project Duration</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnGrantTermMonths' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Are you also requesting funding for this project through LSC’s FY16 TIG program?</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnParrallelTig' />
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan='2'> 
                If you responded yes, please briefly explain how the FY16 TIG and Pro Bono Innovation Fund projects are related and if there is duplication in the funding amount(s) requested.
			</td>
		</tr>
		<tr>
			<td colspan='2'> 
				<span runat="server" id='spnTigProgramDescription' />
			</td>
		</tr>
	</table>
	<br />
	<div style="text-align:center">
		<span runat='server' id='spnSave' />
		<span runat='server' id='spnContinue' />
	</div>	
</div>

      

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='LscPbifApp' DataObjectDefinitionKey='LscPbifApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProjectTitle'>
					<Control ID='txtProjectTitle'
						Type='cTextBox'
						Container='spnProjectTitle'
						Size='50'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantTermMonths'>
					<Control ID='ctlGrantTermMonths'
						Type='cDropDown'
						Container='spnGrantTermMonths'
						ParamList='18|18 Months~24|24 Months'
						Separator='~'
						SubSeparator='|'
						DisplayText='Select'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ParrallelTig'>
					<Control ID='ctlParrallelTig'
						Type='cRadioButtonList'
						Container='spnParrallelTig'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TigProgramDescription'>
					<Control ID='txtTigProgramDescription'
						Type='cTextArea'
						Container='spnTigProgramDescription'
						Rows='8' 
						Cols='80' />
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
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscPBIFBudget' DataObjectDefinitionKey='LscPBIFBudget' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPBIFBudgetTypeID' Value="1" />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscPBIFBudgetByFundingType' DataObjectDefinitionKey='LscPBIFBudgetByFundingType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPBIFBudget' DataObjectPropertyKey='LscPBIFBudgetID' PropertyKey='LscPBIFBudgetID' />
				<Argument PropertyKey="LscPBIFBudgetFundingTypeID" Value="1"/>
			</Filters>
			<DisplayProperties>	
			    <DisplayProperty PropertyKey='FundingTypeTotal' Format='$#,0'>
			        <Control ID='spnEstimatedAmountRequested'
				        Type='HtmlGenericControl'>
			        </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscPBIFBudgetTotal' DataObjectDefinitionKey='LscPBIFBudgetTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPBIFBudget' DataObjectPropertyKey='LscPBIFBudgetID' PropertyKey='LscPBIFBudgetID' />
			</Filters>
			<DisplayProperties>	
			    <DisplayProperty PropertyKey='BudgetTotal' Format='$#,0'>
			        <Control ID='spnEstimatedTotalProjectCost'
				        Type='HtmlGenericControl'>
			        </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>		
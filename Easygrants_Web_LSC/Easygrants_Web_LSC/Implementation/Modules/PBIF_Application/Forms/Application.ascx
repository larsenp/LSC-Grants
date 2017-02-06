<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<span id='spnPageContent' runat='server' />

<div class='SeparatorHdg'>
	Application
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
				<b>Amount Requested</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnAmountRequested' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Total Project Budget</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnTotalBudget' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Grant Term</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnGrantTermMonths' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Executive Summary</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>&nbsp;
				
			</td>
		</tr>
		<tr>
			<td colspan='2'> 
				Provide a concise one-paragraph description of the proposed project.  The Executive Summary of all eligible applications will be published on the LSC website following grant awards.
			</td>
		</tr>
		<tr>
			<td colspan='2'> 
				<span runat="server" id='spnExecSummary' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<b>Did you also request funding for an FY2016 TIG grant?</b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='spnParrallelTig' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Is the TIG related to this grant? </b>&nbsp;<%=kDenoteRequiredField%>
			</td>
			<td>
				<span runat="server" id='SpnApplyForTIG' />
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				If you responded yes to either of the questions above, please briefly explain how the FY2016 TIG and Pro Bono Innovation Fund projects are related and if there is duplication in the funding amount(s) requested.
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				<span runat="server" id='SpnParallelTIGComment' />
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
				<DisplayProperty PropertyKey='AmountRequested'>
					<Control ID='txtAmountRequested'
						Type='cMoneyTextBox'
						Container='spnAmountRequested'
						AllowInputCommas='True'
						Format='#,0'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Amount Requested must be a whole number.'
						RegExErrorMessage='Amount Requested must be a whole number.'
						MaxLength='10'
						Size='15' 
						MinimumValue='1'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='TotalBudget'>
					<Control ID='txtTotalBudget'
						Type='cMoneyTextBox'
						Container='spnTotalBudget'
						AllowInputCommas='True'
						Format='#,0'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Total Budget must be a whole number.'
						RegExErrorMessage='Total Budget must be a whole number.'
						MaxLength='10'
						Size='15' 
						MinimumValue='1'/>
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
				<DisplayProperty PropertyKey='ApplyForTIG'>
					<Control ID='ctlApplyForTIG'
						Type='cRadioButtonList'
						Container='SpnApplyForTIG'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExecSummary'>
					<Control ID='txtExecSummary'
						Type='cTextArea'
						Container='spnExecSummary'
						Rows='8' 
						Cols='80' />
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ParallelTIGComment'>
					<Control ID='txtParallelTIGComment'
						Type='cTextArea'
						Container='spnParallelTIGComment'
						Rows='6' 
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
	</ModuleSection>
</span>		
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>Note variances between D-12 and D-14 that are 10% or more. Check to see that Form D-12 and Form D-14 
were completed for each of the program's service areas.</p>

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	Form D - Substantial Issues
</div>
<p><b>Are the amounts in Expenses and Revenues reasonable? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnFormD' /></p>

<p>Substantial Issues Identified in Form D of the Application.</p>
<span runat='server' id='spnCommentD' />
<br /><br />
<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalEval' DataObjectDefinitionKey='LscRenewalEval' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FormD'>
					<Control ID='ctlFormD'
						Type='cRadioButtonList'
						Container='spnFormD'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommentD'>
					<Control ID='txtCommentD'
						Type='cTextArea'
						Container='spnCommentD'
						Rows='8'
						Cols='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'
						Caption='Save and Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

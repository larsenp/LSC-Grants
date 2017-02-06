<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Form D - Substantial Issues
</div>
<p><b>Are the amounts in Expenses and Revenues reasonable? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnFormD' /></p>

<p>Substantial Issues Identified in Form D of the Application.</p>
<span runat='server' id='spnCommentD' />
<br /><br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalEval' DataObjectDefinitionKey='LscRenewalEval' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
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
				<DisplayProperty PropertyKey='LscRenewalEvalHtml.CommentD' HtmlEncode='False'>
					<Control ID='spnCommentD'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

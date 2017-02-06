<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Form K-1: Current Technology
</div>
<p><b>Are grantee staff using e-mail and do they have Level-I computers? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnFormK' /></p>

<p>Substantial Issues Identified in Form K of the Application.</p>
<span runat='server' id='spnCommentK' />
<br /><br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalEval' DataObjectDefinitionKey='LscRenewalEval' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FormK'>
					<Control ID='ctlFormK'
						Type='cRadioButtonList'
						Container='spnFormK'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalEvalHtml.CommentK' HtmlEncode='False'>
					<Control ID='spnCommentK'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

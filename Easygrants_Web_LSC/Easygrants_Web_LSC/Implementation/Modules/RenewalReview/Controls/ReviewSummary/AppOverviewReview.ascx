<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Applicant Overview Review
</div>
<b>Is the Applicant overview format correct? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnAppOverviewFormat' /><br>

<p><b>Is the content of the Applicant overview comprehensive? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnAppOverviewComprehensive' /></p>

<p>Substantial Issues Identified in the Applicant Overview Review.</p>
<span runat='server' id='spnAppOverviewComment' />
<br /><br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalEval' DataObjectDefinitionKey='LscRenewalEval' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AppOverviewFormat'>
					<Control ID='ctlAppOverviewFormat'
						Type='cRadioButtonList'
						Container='spnAppOverviewFormat'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AppOverviewComprehensive'>
					<Control ID='ctlAppOverviewComprehensive'
						Type='cRadioButtonList'
						Container='spnAppOverviewComprehensive'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalEvalHtml.AppOverviewComment' HtmlEncode='False'>
					<Control ID='spnAppOverviewComment'
						Type='HtmlGenericControl'
						Container='spnAppOverviewComment'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

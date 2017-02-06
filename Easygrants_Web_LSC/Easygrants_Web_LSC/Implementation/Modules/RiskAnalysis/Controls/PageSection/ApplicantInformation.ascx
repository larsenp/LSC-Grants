<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<div width='100%' class='SeparatorHdg'>
	Applicant Information
</div>
<table width='100%'>
	<tr>
		<td>
			<b>Applicant ID</b> <span runat='server' id='spnApplicantID' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Applicant Name</b> <span runat='server' id='spnApplicantName' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Year</b> <span runat='server' id='spnYear' />
		</td>
		<td>&nbsp;</td>
		<td>
			<b>Reviewer:</b> <span runat='server' id='spnReviewer' />
		</td>
	</tr>
</table>
<br />
<div width='100%' class='SeparatorHdg'>
	Grant Information
</div>
<span runat='server' id='spnGrantsList'/>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WFTAYear'>
					<Control ID='spnYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecipientID'>
					<Control ID='spnApplicantID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Organization.OrganizationName'>
					<Control ID='spnApplicantName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='RiskAnalysisWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Person.FirstNameLastName'>
					<Control ID='spnReviewer'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscRiskAnalysisAppList' DataObjectDefinitionKey='LscRiskAnalysisAppList' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='OrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='WFTAYear' PropertyKey='WfTAYear' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGrantsList'
						Type='cDataListCtl'
						Container='spnGrantsList'>
						<DisplayProperty PropertyKey='ServArea' ColumnHeader='Service Area'/>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnReportOutput'
								Type='cButton'
								Caption='View Application PDF'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
									<Parameters>
										<Argument Value='/Easygrants_Web_LSC/Core/Controls/Base/pgReportOutputReader.aspx'/>
										<Argument AttributeName='EntityID' Type='DataObject' TypeKey='AppWfTAID' BaseValue='EntityID='/>
										<Argument AttributeName='DefinitionID' Type='DataObject' TypeKey='ReportOutputDefinitionID' BaseValue='DefinitionID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='TotalScore' Format='##.0' ColumnHeader='Review Score' DataAlign='Right' HeaderAlign='Right' >
							<Parameters>
								<Argument Value='2' ValueKey='AppTaskID' PropertyKey="TotalScore" Format='#0.0'/>
								<Argument Value='66' ValueKey='AppTaskID' PropertyKey="TotalScore" Format='#0.0'/>
								<Argument Value='4' ValueKey='AppTaskID' DisplayValue='N/A'/>
								<Argument Value='67' ValueKey='AppTaskID' DisplayValue='N/A'/>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FundAmount' Format='$#,0' ColumnHeader='Grant Amount' DataAlign='Right' HeaderAlign='Right'/>
						<DisplayProperty ColumnHeader='Poverty Population' DataAlign='Right' HeaderAlign='Right'>
							<Parameters>
								<Argument Value='' ValueKey='PoorPopul' DisplayValue='N/A' />
								<Argument Value='' ValueKey='PoorPopul' Operator='NotEqual' PropertyKey='PoorPopul' Format='#,0' />
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


	</ModuleSection>
</span>

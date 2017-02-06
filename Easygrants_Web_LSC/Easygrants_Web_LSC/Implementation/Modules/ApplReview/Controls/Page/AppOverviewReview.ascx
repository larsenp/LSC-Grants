<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>The Applicant overview provides a concise description of the geographical and cultural 
characteristics of the Applicant's service area(s); the scope of legal services provided 
by the applicant and the delivery methods; and the distinctive characteristics of the 
Applicant's organization.  The Applicant overview should be reviewed for format and 
for content based on the following guidelines:</p>
<ol STYLE="list-style-type: lower-alpha;line-height:1.5">
	<li>
		<b>The format of the overview must follow the outline provided in the renewal narrative instruction.</b>
	</li>
	<li>
		<b>Responses to section 1 of the overview</b> should indicate:
	</li>
	<ul STYLE="list-style-type: disc">
		<li>
			whether the Applicant's service area is either urban or rural or a mix, and explain 
			which counties or cities (or the number of counties or cities) classify it as such;
		</li>
		<li>
			 	whether there have been significant changes, explain what those changes are, 
			 	and explain how those changes affect the eligible client population of the 
			 	service area; and
		</li>
		<li>
			 	if there have been no significant changes, the response should indicate this 
			 	and explain the characteristics that have consistently affected the eligible 
			 	client population such as area-specific legal issues.
		</li>
	</ul>
	<li>
		<b>Responses to section 2 of the overview</b> should state whether the applicant provides 
		a full range of services, examples of what those services include, and whether the full 
		range of service is extended throughout the service area. Applicants that do not provide 
		a full range of service should indicate this and explain methods employed to ensure that 
		a full range of services is provided to the client population. 
	</li>
	<li>
		<b>Responses to section 3 of the overview</b> should describe the methods of delivery used 
		by the applicant and detail the characteristics that the Applicant considers to be unique 
		to its organization. 
	</li>
</ol>
<br />

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

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
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
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
				<DisplayProperty PropertyKey='AppOverviewComment'>
					<Control ID='txtAppOverviewComment'
						Type='cTextArea'
						Container='spnAppOverviewComment'
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

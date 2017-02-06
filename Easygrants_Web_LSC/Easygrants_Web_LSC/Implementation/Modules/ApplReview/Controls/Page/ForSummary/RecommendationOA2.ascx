<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<div class='SeparatorHdg' width='100%'>
	PART I. FUNDING RECOMMENDATION
</div>
<table width='100%'>
	<tr>
		<td width='20'>
			A
		</td>
		<td>
			Fund Total Proposal? <%=kDenoteRequiredField %>
		</td>
		<td width='100'>
			<span runat='server' id='spnFundTotal' />
		</td>
	</tr>
	<tr>
		<td width='20'>
			B
		</td>
		<td>
			Fund Total Proposal with Special Grant Conditions? (If Yes, Complete Part IV) <%=kDenoteRequiredField %>
		</td>
		<td width='100'>
			<span runat='server' id='spnFundTotalCond' />
		</td>
	</tr>
	<tr>
		<td width='20'>
			C
		</td>
		<td>
			Fund All Selected Service Areas? (If No, Complete Part III-B) <%=kDenoteRequiredField %>
		</td>
		<td width='100'>
			<span runat='server' id='spnFundAll' />
		</td>
	</tr>
	<tr>
		<td width='20'>
			D
		</td>
		<td>
			Fund with restrictions on length of grant term? (If Yes, Complete Part V) <%=kDenoteRequiredField %>
		</td>
		<td width='100'>
			<span runat='server' id='spnFundRestrict' />
		</td>
	</tr>
	<tr>
		<td width='20'>
			E
		</td>
		<td>
			Do Not Fund <%=kDenoteRequiredField %>
		</td>
		<td width='100'>
			<span runat='server' id='spnNoFund' />
		</td>
	</tr>
</table>

<div class='SeparatorHdg' width='100%'>
	PART II. FURTHER REVIEW
</div>
<p>Discuss any further review undertaken in addition to review of the application and LSC documentation. 
Describe the reasons for undertaking further review and the outcomes of the review in the comment box below</p>
<span runat='server' id='spnPart2Comment' />
<p>If no further review was undertaken, check None below.</p>
<span runat='server' id='spnNoFurtherReview' /> None<br /><br />

<div class='SeparatorHdg' width='100%'>
	PART III. RATIONALE FOR FUNDING RECOMMENDATION
</div>
<p>(Briefly explain the rationale for the funding recommendation.) </p>
<p>The proposal narrative addresses the applicant's overall capacity to implement the proposed service delivery model. </p>
<p>The applicant's grant proposal is responsive to the information requirements of the FY 2008 RFP. The grant proposal 
(and other materials reviewed) demonstrates, the applicants's ability to respond to the legal needs of the client community, 
and the program's capacity to comply with the selection criteria of 45 C.F.R. 1634.9. </p>
<p>To view Section A and B (scores of 2.0 and below AND 4.0 and above), click Score Report below.</p>
<span runat='server' id='spnScoreReport' />

<p>C.Rationale for not funding one or more service areas:</p>
<p>In the text box below, provide the rationale for not funding one or more service areas. The rationale should address 
issues of non-compliance with the LSC Act, regulations, or grant assurances, or identify specific deficiencies in the 
applicant's proposed delivery approach. If the reviewer recommends that all service areas be funded, enter "Fund all 
service areas." in the text box.</p>
<span runat='server' id='spnPart3Comment' /><br /><br />

<div class='SeparatorHdg' width='100%'>
	REVIEWER(S) AND OTHER PERSONNEL
</div>
<table width='100%'>
	<tr>
		<td>
			<b>LSC Staff Reader</b>
		</td>
		<td>
			<span runat='server' id='spnStaffReaderPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnStaffReaderDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>OPP Management</b>
		</td>
		<td>
			<span runat='server' id='spnOPPMgmtPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnOPPMgmtDate' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscOA2' DataObjectDefinitionKey='LscOA2' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FundTotal'>
					<Control ID='rdoFundTotal'
						Type='cRadioButtonList'
						Container='spnFundTotal'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundTotalCond'>
					<Control ID='rdoFundTotalCond'
						Type='cRadioButtonList'
						Container='spnFundTotalCond'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundAll'>
					<Control ID='rdoFundAll'
						Type='cRadioButtonList'
						Container='spnFundAll'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundRestrict'>
					<Control ID='rdoFundRestrict'
						Type='cRadioButtonList'
						Container='spnFundRestrict'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NoFund'>
					<Control ID='rdoNoFund'
						Type='cRadioButtonList'
						Container='spnNoFund'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOA2Html.Part2Comment'>
					<Control ID='spnPart2Comment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NoFurtherReview'>
					<Control ID='chkNoFurtherReview'
						Type='cCheckBox'
						Container='spnNoFurtherReview' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnScoreReport'
						Type='cButton'
						Container='spnScoreReport'
						Caption='Score Report'>
						<Action PostBack='False'
							URL='/Easygrants_Web_LSC/Implementation/Modules/ApplReview/ModuleContent.aspx?Config=ApplReviewModuleConfig&amp;amp;Page=ScoreReport&amp;amp;PageFrame=Print'
							Target='_blank'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscOA2Html.Part3Comment'>
					<Control ID='spnPart3Comment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderPerson.FirstNameLastName'>
					<Control ID='spnStaffReaderPersonID' 
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderDate' Format='MM/dd/yyyy'>
					<Control ID='spnStaffReaderDate' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPMgmtPerson.FirstNameLastName'>
					<Control ID='spnOPPMgmtPersonID' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPMgmtDate' Format='MM/dd/yyyy'>
					<Control ID='spnOPPMgmtDate' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>


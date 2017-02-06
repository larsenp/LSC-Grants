<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<style>
	#RA td {
		vertical-align:top;
		padding-bottom:10px
	}
</style>
<div style="width:800px">

	<div class='SeparatorHdg' width='100%'>
		Risk Factors
	</div>
	<table id='RA'>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>Primary Risk Factors</b>
			</td>
			<td>&nbsp;</td>
			<td style="text-align:center">
				<b>Explanation</b>
			</td>
		</tr>
		<tr>
			<td>1</td>
			<td>Date of last OPP quality visit (PQV or CAV)</td>
			<td><span runat='server' id='spnLastQualityVisit' /></td>
			<td rowspan='2'><span runat='server' id='spnLastOPPVisitComment'/></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>Date of last OPP engagement visit (PEV)</td>
			<td><span runat='server' id='spnLastEngagementVisit' /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>&nbsp;</b>
			</td>
			<td style="text-align:center">
				<b>Present?</b>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Significant programmatic issues identified by LSC or other reliable source<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnSigProgIssues' /></td>
			<td><span runat='server' id='spnSigProgIssuesComment' /></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<b>Secondary Risk Factors</b>
			</td>
			<td style="text-align:center">
				<b>Present?</b>
			</td>
			<td style="text-align:center">
				<b>Explanation</b>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>Compliance issues identified by OCE<span style="color:Red; font-weight:bold">*</span></td>
			<td colspan='2'><span runat='server' id='spnComplianceIssues' /></td>
			
		</tr>
		<tr>
			<td>4</td>
			<td>Fiscal issues identified by OCE<span style="color:Red; font-weight:bold">*</span></td>
			<td colspan='2'><span runat='server' id='spnAuditIssues' /></td>
			
		</tr>
		<tr>
			<td>5</td>
			<td>Issues identified related to Performance Area One (e.g., no recent needs assessment, no recent strategic planning, no effective program evaluation)<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesRelatedPA1' /></td>
			<td><span runat='server' id='spnIssuesRelatedPA1Comment' /></td>
		</tr> 
        <tr>
			<td>6</td>
			<td>Issues identified related to Performance Area Two (e.g.ineffective intake, insufficient LEP practices, indicia of insufficient outreach or client engagement)<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesRelatedPA2' /></td>
			<td><span runat='server' id='spnIssuesRelatedPA2Comment' /></td>
		</tr> 
         <tr>
			<td>7</td>
			<td>Issues identified related to Performance Area Three (e.g.,inadequate training or legal work management practices, indicia of ineffectiveness of representation)<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesRelatedPA3' /></td>
			<td><span runat='server' id='spnIssuesRelatedPA3Comment' /></td>
		</tr> 
         <tr>
			<td>8</td>
			<td>Issues with low CSRs without adequate explanation<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesLowCSRs' /></td>
			<td><span runat='server' id='spnIssuesLowCSRsComment' /></td>
		</tr> 
        <tr>
			<td>9</td>
			<td>Issues concerning low pro bono performance, without adequate explanation<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesLowProbonoPerf' /></td>
			<td><span runat='server' id='spnIssuesLowProbonoPerfComment' /></td>
		</tr> 
        <tr>
			<td>10</td>
			<td>Issues identified related to Performance Area Four (e.g.ineffective board governance, leadership, management or administration, including technology)<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesRelatedPA4' /></td>
			<td><span runat='server' id='spnIssuesRelatedPA4Comment' /></td>
		</tr> 
		<tr>
			<td>11</td>
			<td>TIG Performance Issues<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnTigPerformanceIssues' /></td>
			<td><span runat='server' id='spnTigPerformanceIssuesComment' /></td>
		</tr>
		<tr>
			<td>12</td>
			<td>Issues concerning board composition (e.g.1607 compliance,size,duration, composition,transition)<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesBoardComposition' /></td>
			<td><span runat='server' id='spnIssuesBoardCompositionComment' /></td>
		</tr>
		<!--<tr>
			<td>8</td>
			<td>Issues identified by OPP as part of the competitive grant evaluation<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesOPPGrantEval' /></td>
			<td><span runat='server' id='spnIssuesOPPGrantEvalComment' /></td>
		</tr> -->
		<tr>
			<td>13</td>
			<td>Significant complaints filed or pending against the program<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnSigComplaints' /></td>
			<td><span runat='server' id='spnSigComplaintsComment' /></td>
		</tr>
		<tr>
			<td>14</td>
			<td>OPP identification of particular areas of interest to be considered in prioritizing visits<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnOPPAreasInterest' /></td>
			<td><span runat='server' id='spnOPPAreasInterestComment' /></td>
		</tr>
		<tr>
			<td>15</td>
			<td>Indications of significant issues related to program size, either in geographic scope or the budget<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnProgramSizeIssues' /></td>
			<td><span runat='server' id='spnProgramSizeIssuesComment' /></td>
		</tr>
		<!--<tr>
			<td>12</td>
			<td>Issues identified by OPP as part of the recipient's required reporting to LSC<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesOPPReqRptg' /></td>
			<td><span runat='server' id='spnIssuesOPPReqRptgComment' /></td>
		</tr> 
		<tr>
			<td>13</td>
			<td>Issues that have been identified by other funders<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnIssuesOtherFunders' /></td>
			<td><span runat='server' id='spnIssuesOtherFundersComment' /></td>
		</tr>-->
		<tr>
			<td>16</td>
			<td>Transition in program leadership (e.g., new ED or CFO)<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnLeadershipTransition' /></td>
			<td><span runat='server' id='spnLeadershipTransitionComment' /></td>
		</tr>
		<!--<tr>
			<td>15</td>
			<td>Concerns resulting from financial statements reviews<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnFinancialReviews' /></td>
			<td><span runat='server' id='spnFinancialReviewsComment' /></td>
		</tr> -->
		<tr>
			<td>17</td>
			<td>Issues identified by OIG, including A-50 referral information provided to OCE or other information from the OIG that is referred to management for follow up<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnOIGIssues' /></td>
			<td><span runat='server' id='spnOIGIssuesComment' /></td>
		</tr>
		<tr>
			<td>18</td>
			<td>Other, including other issues identified by other funders, other stakeholders, or through grantee contacts or reports to LSC<span style="color:Red; font-weight:bold">*</span></td>
			<td><span runat='server' id='spnOther' /></td>
			<td><span runat='server' id='spnOtherComment' /></td>
		</tr>
	</table>
	<br />
	<table width='100%'>
	<tr>
		<td><b>Program Counsel Name<%=kDenoteRequiredField %></b></td>
		<td>
			<span runat='server' id='spnStaffReaderPersonID' />
		</td>
		<td>
			<b>Date<%=kDenoteRequiredField %></b> 
			<span runat='server' id='spnReviewDate' />
		</td>
	</tr>
    </table>
<br />
	<div style="text-align:center">
		<span runat='server' id='spnSave' />
		<span runat="server" id='spnSaveContinue' />
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='LscMostRecentOPPQualityVisit' DataObjectDefinitionKey='LscMostRecentOPPVisitByType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' /> 
				<Argument Group='('/>
					<Argument PropertyKey="Purpose" Value="Program Quality" Bool=''/>
					<Argument PropertyKey="Purpose" Value="Capability Assessment Visit" Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='VisitDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='VisitDate' Format='M/d/yyyy' IfBlank='N/A'>
						<Control ID='lblLastQualityVisit'
						Container='spnLastQualityVisit'
						Type='cLabel' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscMostRecentOPPEngagementVisit' DataObjectDefinitionKey='LscMostRecentOPPVisitByType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' /> 
				<Argument PropertyKey="Purpose" Value="Program Engagement"/>
			</Filters>
			<Sort>
				<Argument PropertyKey='VisitDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='VisitDate' Format='M/d/yyyy' IfBlank='N/A' >
					<Control ID='spnLastEngagementVisit'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscRiskFactorAnalysis' DataObjectDefinitionKey='LscRiskFactorAnalysis' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastOPPVisitComment'>
					<Control ID='txtLastOPPVisitComment'
						Type='cTextArea'
						Container='spnLastOPPVisitComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SigProgIssues'>
					<Control ID='ctlSigProgIssues'
						Type='cRadioButtonList'
						Container='spnSigProgIssues' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SigProgIssuesComment'>
					<Control ID='txtSigProgIssuesComment'
						Type='cTextArea'
						Container='spnSigProgIssuesComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='IssuesRelatedPA1'>
					<Control ID='ctlIssuesRelatedPA1'
						Type='cRadioButtonList'
						Container='spnIssuesRelatedPA1' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesRelatedPA1Comment'>
					<Control ID='txtIssuesRelatedPA1Comment'
						Type='cTextArea'
						Container='spnIssuesRelatedPA1Comment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesRelatedPA2'>
					<Control ID='ctlIssuesRelatedPA2'
						Type='cRadioButtonList'
						Container='spnIssuesRelatedPA2' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesRelatedPA2Comment'>
					<Control ID='txtIssuesRelatedPA2Comment'
						Type='cTextArea'
						Container='spnIssuesRelatedPA2Comment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesRelatedPA3'>
					<Control ID='ctlIssuesRelatedPA3'
						Type='cRadioButtonList'
						Container='spnIssuesRelatedPA3' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesRelatedPA3Comment'>
					<Control ID='txtIssuesRelatedPA3Comment'
						Type='cTextArea'
						Container='spnIssuesRelatedPA3Comment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>

				<DisplayProperty PropertyKey='IssuesLowCSRs'>
					<Control ID='ctlIssuesLowCSRs'
						Type='cRadioButtonList'
						Container='spnIssuesLowCSRs' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesLowCSRsComment'>
					<Control ID='txtIssuesLowCSRsComment'
						Type='cTextArea'
						Container='spnIssuesLowCSRsComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesLowProbonoPerformance'>
					<Control ID='ctlIssuesLowProbonoPerf'
						Type='cRadioButtonList'
						Container='spnIssuesLowProbonoPerf' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesLowProbonoPerformanceComment'>
					<Control ID='txtIssuesLowProbonoPerfComment'
						Type='cTextArea'
						Container='spnIssuesLowProbonoPerfComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesRelatedPA4'>
					<Control ID='ctlIssuesRelatedPA4'
						Type='cRadioButtonList'
						Container='spnIssuesRelatedPA4' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesRelatedPA4Comment'>
					<Control ID='txtIssuesRelatedPA4Comment'
						Type='cTextArea'
						Container='spnIssuesRelatedPA4Comment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='TigPerformanceIssues'>
					<Control ID='ctlTigPerformanceIssues'
						Type='cRadioButtonList'
						Container='spnTigPerformanceIssues' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TigPerformanceIssuesComment'>
					<Control ID='txtTigPerformanceIssuesComment'
						Type='cTextArea'
						Container='spnTigPerformanceIssuesComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesBoardComposition'>
					<Control ID='ctlIssuesBoardComposition'
						Type='cRadioButtonList'
						Container='spnIssuesBoardComposition' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesBoardCompositionComment'>
					<Control ID='txtIssuesBoardCompositionComment'
						Type='cTextArea'
						Container='spnIssuesBoardCompositionComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				<!--<DisplayProperty PropertyKey='IssuesOPPGrantEval'>
					<Control ID='ctlIssuesOPPGrantEval'
						Type='cRadioButtonList'
						Container='spnIssuesOPPGrantEval' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesOPPGrantEvalComment'>
					<Control ID='txtIssuesOPPGrantEvalComment'
						Type='cTextArea'
						Container='spnIssuesOPPGrantEvalComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty> -->
				
				
			
				<DisplayProperty PropertyKey='SigComplaints'>
					<Control ID='ctlSigComplaints'
						Type='cRadioButtonList'
						Container='spnSigComplaints'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SigComplaintsComment'>
					<Control ID='txtSigComplaintsComment'
						Type='cTextArea'
						Container='spnSigComplaintsComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				
			
				<DisplayProperty PropertyKey='OPPAreasInterest'>
					<Control ID='ctlOPPAreasInterest'
						Type='cRadioButtonList'
						Container='spnOPPAreasInterest'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPAreasInterestComment'>
					<Control ID='txtOPPAreasInterestComment'
						Type='cTextArea'
						Container='spnOPPAreasInterestComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				
				
				<DisplayProperty PropertyKey='ProgramSizeIssues'>
					<Control ID='ctlProgramSizeIssues'
						Type='cRadioButtonList'
						Container='spnProgramSizeIssues'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramSizeIssuesComment'>
					<Control ID='txtProgramSizeIssuesComment'
						Type='cTextArea'
						Container='spnProgramSizeIssuesComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
		
				<!--<DisplayProperty PropertyKey='IssuesOPPReqRptg'>
					<Control ID='ctlIssuesOPPReqRptg'
						Type='cRadioButtonList'
						Container='spnIssuesOPPReqRptg'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesOPPReqRptgComment'>
					<Control ID='txtIssuesOPPReqRptgComment'
						Type='cTextArea'
						Container='spnIssuesOPPReqRptgComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				 
				<DisplayProperty PropertyKey='IssuesOtherFunders'>
					<Control ID='ctlIssuesOtherFunders'
						Type='cRadioButtonList'
						Container='spnIssuesOtherFunders'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IssuesOtherFundersComment'>
					<Control ID='txtIssuesOtherFundersComment'
						Type='cTextArea'
						Container='spnIssuesOtherFundersComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>-->
				<DisplayProperty PropertyKey='LeadershipTransition'>
					<Control ID='ctlLeadershipTransition'
						Type='cRadioButtonList'
						Container='spnLeadershipTransition'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LeadershipTransitionComment'>
					<Control ID='txtLeadershipTransitionComment'
						Type='cTextArea'
						Container='spnLeadershipTransitionComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
			<!--	<DisplayProperty PropertyKey='FinancialReviews'>
					<Control ID='ctlFinancialReviews'
						Type='cRadioButtonList'
						Container='spnFinancialReviews'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinancialReviewsComment'>
					<Control ID='txtFinancialReviewsComment'
						Type='cTextArea'
						Container='spnFinancialReviewsComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty> -->
				<DisplayProperty PropertyKey='OIGIssues'>
					<Control ID='ctlOIGIssues'
						Type='cRadioButtonList'
						Container='spnOIGIssues'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OIGIssuesComment'>
					<Control ID='txtOIGIssuesComment'
						Type='cTextArea'
						Container='spnOIGIssuesComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='ctlOther'
						Type='cRadioButtonList'
						Container='spnOther'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherComment'>
					<Control ID='txtOtherComment'
						Type='cTextArea'
						Container='spnOtherComment'
						Rows='5'
						Cols='40' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderPersonID'>
				 	<Control ID='ctlStaffReaderPersonID' 
						Type='cDropDown' 
						Container='spnStaffReaderPersonID'
						DisplayValue='LastNameFirstName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='EasylistReviewsReviewersView'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='1' />
						</Filters>
						<Sort>
							<Argument PropertyKey='LastNameFirstNameMiddleName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewDate'>
					<Control ID='ctlReviewDate' 
						Type='cDateTextBox' 
						Container='spnReviewDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Review Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Review Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
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
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		 <DataObject Key='OCEReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='OrganizationID' DataObjectPropertyKey='OrganizationID' >
					<RelatedProperty PropertyKey='vLSCCompWftaOrgServareaYear' />
				</Argument>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' PropertyKey='TimePeriodID' DataObjectPropertyKey='TimePeriodID' >
					<RelatedProperty PropertyKey='vLSCCompWftaOrgServareaYear' />
				</Argument>
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='74' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='75' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnComplianceIssues'
						Type='cDataListCtl'>
						<DisplayProperty PropertyKey='vLSCCompWftaOrgServareaYear.ServiceArea' ColumnHeader='Service Area'  Width='25%'/>
						<DisplayProperty PropertyKey='LscOceDirReviewAuditCompliance.ComplianceIssues' ColumnHeader='YesNo' Format='YesNo' Width='20%'/>
						<DisplayProperty PropertyKey='LscOceDirReviewAuditCompliance.ComplianceIssuesComment' ColumnHeader='Comment' >
							<Control ID='lblComplianceIssuesComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlAuditIssues'
						Container='spnAuditIssues'
						Type='cDataListCtl'>
						<DisplayProperty PropertyKey='vLSCCompWftaOrgServareaYear.ServiceArea' ColumnHeader='Service Area'  Width='25%'/>
						<DisplayProperty PropertyKey='LscOceDirReviewAuditCompliance.AuditIssues' ColumnHeader='YesNo' Format='YesNo' Width='20%'/>
						<DisplayProperty PropertyKey='LscOceDirReviewAuditCompliance.AuditIssuesComment' ColumnHeader='Comment' >
							<Control ID='lblAuditIssuesComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
	</ModuleSection>
</span>

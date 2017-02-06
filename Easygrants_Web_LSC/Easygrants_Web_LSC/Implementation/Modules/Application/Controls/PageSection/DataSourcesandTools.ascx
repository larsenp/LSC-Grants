<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />


<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Legal Needs Assessment Data Sources and Tools</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area 1, Criterion 1 - <i>Periodic comprehensive assessment and ongoing consideration of the most pressing legal needs</i></b> </td>
	</tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
        <td colspan="4" >&nbsp;</td>
 </tr>
 <tr>
	<td>
		<p>Use the RFP Chart to indicate whether the applicant used data from the sources or tools identified.</p>
		<p style="color:red">For those applying to multiple service areas: This RFP Chart is <i>not</i> linked across service areas. Applicants should enter information into this form that is specific to this service area.</p>
		<p>All fields are required fields. When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return.</p>
		<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>
	</td>
	<td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/>
    </td>
 </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td  colspan='4' class="SeparatorHdg" >Legal Needs Assessment Data Sources and Tools</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>1.  Census data (e.g. demographic data, employment data)<%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnCensusData' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>2.  Other legal needs studies (e.g. statewide needs studies, needs studies of similar service areas) <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnOtherLegalNeedsStudies' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>3. Geographic Information Systems (GIS) mapping <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnGISMapping' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>4. Other information (e.g. other government data, studies conducted by academics, business groups, or nonprofits) <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnOtherInformation' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>5. Intake data on cases not accepted <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnIntakeDataNotAccepted' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>6. CMS data regarding case types/ problem codes closed with extended or limited service  <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnCMSDataClosed' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>7. CMS data showing geographic location of Applicants for service and clients  <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnCMSDataShowing' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><b>8. Other (Specify)  <%=kDenoteRequiredField%> </b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr>
       <td width='5%'>&nbsp;</td>
	   <td width='60%'><span runat="server" id='spnOtherText' /></td>
	   <td>&nbsp;</td>
	   <td width='30%'><span runat="server" id='spnOtherSelection' /></td>
	   <td width='5%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br />
<br />
<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveCloseStd' />
			<span runat='server' id='spnSaveClosePPQV' />
		</td>
	</tr>
</table>






<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	     	    
	    <DataObject Key='LscAssessmentDataSources' DataObjectDefinitionKey='LscAssessmentDataSources' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
			     <DisplayProperty PropertyKey='CensusData'>
					<Control ID='ctlCensusData'
						Container='spnCensusData'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='OtherLegalNeedsStudies'>
					<Control ID='ctlOtherLegalNeedsStudies'
						Container='spnOtherLegalNeedsStudies'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='GISMapping'>
					<Control ID='ctlGISMapping'
						Container='spnGISMapping'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='OtherInformation'>
					<Control ID='ctlOtherInformation'
						Container='spnOtherInformation'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='IntakeDataNotAccepted'>
					<Control ID='ctlIntakeDataNotAccepted'
						Container='spnIntakeDataNotAccepted'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='CMSDataClosed'>
					<Control ID='ctlCMSDataClosed'
						Container='spnCMSDataClosed'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CMSDataShowing'>
					<Control ID='ctlCMSDataShowing'
						Container='spnCMSDataShowing'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherText'>
					<Control ID='txtOtherText'
						Type='cTextArea'
						Container='spnOtherText'
						Rows='5'
						MaxLength='400'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherSelection'>
					<Control ID='ctlOtherSelection'
						Container='spnOtherSelection'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
			 <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToCriterion'
						Type='cLabel'
						Container='spnReturnToCriterion'
						LabelText='Save and Return to Criterion Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToPA'
						Type='cLabel'
						Container='spnReturnToPA'
						LabelText='Save and Return to Performance Area Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
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
					<Control ID='btnSaveCloseStd'
						Type='cButton'
						Container='spnSaveCloseStd'
						Caption='Save and Return to Criterion Page'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="AppFormByCriterion"/>
								<Argument Type='QueryString' TypeKey='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClosePPQV'
						Type='cButton'
						Container='spnSaveClosePPQV'
						Caption='Save and Return to Performance Area Page'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="PostPQVPA1"/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
	</ModuleSection>
</span>
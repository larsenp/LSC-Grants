<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Private Attorney Involvement</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area Three, Criterion 2 - <i>Private attorney involvement : </i></b> </td>
	</tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
   <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td>
		  	<p>Use the RFP Chart to address the Applicant’s PAI participation.</p>  
				<p><font color='red'>For those applying to multiple service areas, this RFP Chart is <i>not</i> “linked” across service areas. Applicants should enter information into this form that is specific to this service area. </font></p>
				<p>All fields are required fields. When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return to the criterion.</p>
				<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>
		</td>
         <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
    </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td colspan='3' class="SeparatorHdg" >Private Attorney Involvement Chart</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr style="background-color:#DDDDDD">
        <td width='5%'>&nbsp;</td>
        <td width='55%'><b></b></td>
		<td width='40%'><b>Number</b></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>1. The number of attorneys admitted to practice in the service area who are in active status. <%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement1' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>2. The number of attorneys who actively  participated in the PAI project  as pro bono attorneys in the last year by  taking cases, participating in clinics, hotlines, with intake or with other  services.<%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement2' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>3. The number of attorneys who actively participated in the PAI project as contract attorneys and/or Judicare attorneys in the last year by taking cases, participating in clinics, hotlines, with intake or with other services.<%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement3' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>4.Enter the number of attorneys who made a monetary donation to applicant in lieu of participating in the PAI project in the last twelve months.<%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement9' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>5. The number of partnerships established with law schools since last year.<%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement10' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>6. The number of partnerships established with business leaders since last year.<%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement11' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<%--<tr>
	    <td>&nbsp;</td>
	    <td><b>4. The number of attorneys who actively participated in the PAI project  as judicare attorneys in the last year by taking cases, participating in clinics, hotlines, with intake or with other services.<%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement4' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>5. The number of attorneys who made a monetary donation to Applicant in lieu of participating in the PAI project in the last year<%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement5' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>6. The number of new attorney participants recruited by the Applicant last year<%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement6' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	<tr>
	    <td>&nbsp;</td>
	    <td><b>7. The number of PAI subgrants awarded  <%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement7' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr> --%>
    <tr>
	    <td>&nbsp;</td>
	    <td><b>7. The number of law students, law graduates, and paralegals, and other professionals who provided pro bono legal assistance or legal information by taking cases, participating in clinics, on hotlines, with intake or with other services.<%=kDenoteRequiredField%></b></td>
	    <td><span runat='server' id='spnAttyInvolvement8' /></td>
	</tr>
	<tr> <td>&nbsp;</td></tr>
	
</table>
<br />
<br />
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
	    <DataObject Key='LSCRFPATTYINVOLVEMENT' DataObjectDefinitionKey='LSCRFPATTYINVOLVEMENT' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
	        <DisplayProperties>
	            <DisplayProperty PropertyKey='AttyInvolvement1'>
					<Control ID='txtAttyInvolvement1'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement1'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of attorneys admitted to practice in the service area who are in active status" must be a whole number'
						RegExErrorMessage='"The number of attorneys admitted to practice in the service area who are in active status" must be a whole number'
						Size='10'
						MaxLength='7'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement2'>
					<Control ID='txtAttyInvolvement2'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement2'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of attorneys who actively participated in the PAI project as pro bono attorneys in the last year by taking cases, participating in clinics, hotlines, with intake or with other services" must be a whole number'
						RegExErrorMessage='"The number of attorneys who actively participated in the PAI project as pro bono attorneys in the last year by taking cases, participating in clinics, hotlines, with intake or with other services" must be a whole number'
						Size='10'
						MaxLength='7' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement3'>
					<Control ID='txtAttyInvolvement3'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement3'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of attorneys who actively participated in the PAI project as contract attorneys and/or Judicare attorneys in the last year by taking cases, participating in clinics, hotlines, with intake or with other services" must be a whole number'						                        
						RegExErrorMessage='"The number of attorneys who actively participated in the PAI project as contract attorneys and/or Judicare attorneys in the last year by taking cases, participating in clinics, hotlines, with intake or with other services" must be a whole number'
						Size='10'
						MaxLength='7' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='AttyInvolvement4'>
					<Control ID='txtAttyInvolvement4'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement4'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of attorneys who currently participate in the PAI project as judicare attorneys" must be a whole number'	
						RegExErrorMessage='"The number of attorneys who currently participate in the PAI project as judicare attorneys" must be a whole number'	
						Size='10'
						MaxLength='7' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement5'>
					<Control ID='txtAttyInvolvement5'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement5'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of attorneys who make a monetary donation to Applicant in lieu of participating in the PAI project" must be a whole number'
						RegExErrorMessage='"The number of attorneys who make a monetary donation to Applicant in lieu of participating in the PAI project" must be a whole number'
						Size='10'
						MaxLength='7' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement6'>
					<Control ID='txtAttyInvolvement6'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement6'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of new attorney participants recruited by the Applicant last year" must be a whole number'	
						RegExErrorMessage='"The number of new attorney participants recruited by the Applicant last year" must be a whole number'	
						Size='10'
						MaxLength='7' />
				</DisplayProperty>--%>
				<!--<DisplayProperty PropertyKey='AttyInvolvement7'>
					<Control ID='txtAttyInvolvement7'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement7'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of PAI subgrants awarded" must be a whole number'	
						RegExErrorMessage='"The number of PAI subgrants awarded" must be a whole number'	
						Size='10'
						MaxLength='7' />
				</DisplayProperty> -->
                <DisplayProperty PropertyKey='AttyInvolvement8'>
					<Control ID='txtAttyInvolvement8'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement8'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of law students,law graduates and paralegals who provided pro bono legal assitance in last year by taking cases..." must be a whole number'	
						RegExErrorMessage='"The number of law students,law graduates and paralegals who provided pro bono legal assitance in last year by taking cases..." must be a whole number'	
						Size='10'
						MaxLength='7' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement9'>
					<Control ID='txtAttyInvolvement9'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement9'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"Enter “Yes” or “No” to indicate whether bar rules permit attorneys to make a monetary donation in lieu of participating in the PAI project." must be a whole number'	
						RegExErrorMessage='"Enter “Yes” or “No” to indicate whether bar rules permit attorneys to make a monetary donation in lieu of participating in the PAI project." must be a whole number'	
						Size='10'
						MaxLength='7' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement10'>
					<Control ID='txtAttyInvolvement10'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement10'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of partnerships established with law schools since last year." must be a whole number'
						RegExErrorMessage='"The number of partnerships established with law schools since last year." must be a whole number'
						Size='10'
						MaxLength='7' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AttyInvolvement11'>
					<Control ID='txtAttyInvolvement11'
						Type='cMoneyTextBox'
						Container='spnAttyInvolvement11'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='"The number of partnerships established with business leaders since last year." must be a whole number'	
						RegExErrorMessage='"The number of partnerships established with business leaders since last year." must be a whole number'	
						Size='10'
						MaxLength='7' />
				</DisplayProperty>
				
	        
	        </DisplayProperties>
	    </DataObject>
	    
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
			 <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
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
								<Argument Value="PostPQVPA3"/>
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



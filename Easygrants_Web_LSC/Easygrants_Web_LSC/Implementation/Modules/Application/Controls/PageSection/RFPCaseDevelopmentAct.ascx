<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Case Development Activities</h1></td>
	</tr>
     <tr>
		<td ><b>Performance Area Three, Criterion 1 - <i>Legal representation: </i></b> </td>
	</tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
   <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td><p>Use the RFP Chart to indicate the extent to which the listed case development activities, litigation strategies, and courtroom or litigation activities have been used by the applicant’s attorneys within the last twenty-four months.</p>  
			<p style="color:red">For those applying to multiple service areas: This RFP Chart is <em>not</em> linked across service areas. Applicants should enter information into this form that is specific to this service area</p> 
			<p>All fields are required fields. When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return.</p>
            <p>Email questions pertaining to this RFP chart to <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
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
        <td colspan='3' class="SeparatorHdg" >Case Development Activities Chart</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='50%'><b>1.  Complex litigation in Federal or state court <%=kDenoteRequiredField%> </b></td>
	   <td width='45%'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnCaseDevelopAct1' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='40%'><b>2.  Written discovery in the course of litigation (interrogatories, requests for admission, etc.) <%=kDenoteRequiredField%> </b></td>
	   <td width='55%'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnCaseDevelopAct2' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='40%'><b>3.  Depositions <%=kDenoteRequiredField%></b></td>
	   <td width='55%'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnCaseDevelopAct3' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='40%'><b>4.  Use of expert witnesses <%=kDenoteRequiredField%></b></td>
	   <td width='55%'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnCaseDevelopAct4' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='40%'><b>5.  Motions accompanied by written memoranda <%=kDenoteRequiredField%> </b></td>
	   <td width='55%'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnCaseDevelopAct5' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='40%'><b>6.  Jury trials <%=kDenoteRequiredField%></b></td>
	   <td width='55%'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnCaseDevelopAct6' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='40%'><b>7.  Appeals to appellate courts <%=kDenoteRequiredField%> </b></td>
	   <td width='55%'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnCaseDevelopAct7' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
       <td width='5%'>&nbsp;</td>
	   <td width='40%'><b>8.  Enforcement of judgments <%=kDenoteRequiredField%> </b></td>
	   <td width='55%'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnCaseDevelopAct8' /></td>
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
	    <DataObject Key='LSCRFPCASEDEVELOP' DataObjectDefinitionKey='LSCRFPCASEDEVELOP' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
	        <DisplayProperties>
				<DisplayProperty PropertyKey='CaseDevelopAct1'>
					<Control ID='ctlCaseDevelopAct1'
						Container='spnCaseDevelopAct1'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopAct2'>
					<Control ID='ctlCaseDevelopAct2'
						Container='spnCaseDevelopAct2'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopAct3'>
					<Control ID='ctlCaseDevelopAct3'
						Container='spnCaseDevelopAct3'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopAct4'>
					<Control ID='ctlCaseDevelopAct4'
						Container='spnCaseDevelopAct4'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopAct5'>
					<Control ID='ctlCaseDevelopAct15'
						Container='spnCaseDevelopAct5'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopAct6'>
					<Control ID='ctlCaseDevelopAct6'
						Container='spnCaseDevelopAct6'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopAct7'>
					<Control ID='ctlCaseDevelopAct7'
						Container='spnCaseDevelopAct7'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CaseDevelopAct8'>
					<Control ID='ctlCaseDevelopAct8'
						Container='spnCaseDevelopAct8'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
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

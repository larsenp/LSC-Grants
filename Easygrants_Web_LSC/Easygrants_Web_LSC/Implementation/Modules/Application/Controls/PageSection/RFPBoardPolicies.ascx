<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>

<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Board Policies and Practices</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area Four, Criterion 1 - <i>Board governance: </i></b> </td>
	</tr>
    <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
    <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td>
		  	<p>Use the RFP Chart to describe governing board policies and practices</p>  
				<p><font color='red'>For those applying to multiple service areas: This RFP Chart is linked across service areas. All information entered here will be automatically entered into applications for other service areas. </font></p>
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
		<td colspan="4" class="SeparatorHdg" >Board Policies and Practices</td>
	</tr>
	<tr>
          <td>&nbsp;</td>
    </tr>
	<tr>
	    <td width='5%'>&nbsp;</td>
		<td width='50%' >
			<b>1. Does the board have a written policy or practice that deals with conflicts of interest or potential conflicts of interest? <%=kDenoteRequiredField%> </b>
		</td>
		<td width='30%'><span runat="server" id='spnBoardPolicy1' /></td>
		<td width='15%'></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>2. In the last twenty-four months did a quorum of board members attend each scheduled board meeting? <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy2' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>If not, what was the number of meetings for which a quorum was not reached?</b>
		</td>
		<td><span runat='server' id='spnBoardPolicy2no' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>3. Is there a limitation on the number of terms board members can serve on the board? <%=kDenoteRequiredField%> </b>
		</td>
		<td><span runat='server' id='spnBoardPolicy3' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>4. Are board members given an orientation on board responsibilities? <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy4' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>5. Have board members received copies of the 2007 LSC Performance Criteria? <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy5' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>6. Have board members received copies of the LSC Act and Regulations? <%=kDenoteRequiredField%></b>
		</td>
		<td><span runat='server' id='spnBoardPolicy6' /></td>
		<td >&nbsp;</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<%--7. Does the board have a finance committee? <%=kDenoteRequiredField%></b>
		<span runat='server' id='spnBoardPolicy7' />
		8. Does the board have an audit committee?  <%=kDenoteRequiredField%></b>
        <span runat='server' id='spnBoardPolicy8' />  has been removed in 2013 cycle--%>
	<tr>
	    <td >&nbsp;</td>
		<td>
			<b>7. Does the board have at least one member with expertise in accounting or auditing? <%=kDenoteRequiredField%> </b>
		</td>
		<td><span runat='server' id='spnBoardPolicy9' /></td>
		<td >&nbsp;</td>
	</tr>
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
	
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	    
	    <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	
	    <DataObject Key='LSCRFPBOARDPOLICIES' DataObjectDefinitionKey='LSCRFPBOARDPOLICIES' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</DefaultValues>
            <DisplayProperties>
	            <DisplayProperty PropertyKey='RFPBoardPolicy1'>
					<Control ID='ctlBoardPolicy1'
						Container='spnBoardPolicy1'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy2'>
					<Control ID='ctlBoardPolicy2'
						Container='spnBoardPolicy2'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy2NO'>
					<Control ID='ctlBoardPolicy2no'
						Container='spnBoardPolicy2no'
						Type='cTextBox'
						MaxLength='3'
						Size='10' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy3'>
					<Control ID='ctlBoardPolicy3'
						Container='spnBoardPolicy3'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy4'>
					<Control ID='ctlBoardPolicy4'
						Container='spnBoardPolicy4'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy5'>
					<Control ID='ctlBoardPolicy5'
						Container='spnBoardPolicy5'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RFPBoardPolicy6'>
					<Control ID='ctlBoardPolicy6'
						Container='spnBoardPolicy6'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			
				<DisplayProperty PropertyKey='RFPBoardPolicy9'>
					<Control ID='ctlBoardPolicy9'
						Container='spnBoardPolicy9'
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
								<Argument Value="PostPQVPA4"/>
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
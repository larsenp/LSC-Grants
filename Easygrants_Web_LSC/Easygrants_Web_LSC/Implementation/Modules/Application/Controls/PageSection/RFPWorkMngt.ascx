<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Legal Work Management</h1></td>
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
        <td><p>Use the RFP Chart to indicate how frequently the applicant uses the methods and/or resources listed to ensure that cases and other services are effectively handled. Complete this form by selecting the appropriate choice for each. If “other” is the appropriate choice, please explain.</p>
			 	<p style="color:red">For those applying to multiple service areas: This RFP Chart is <em>not</em> linked across service areas. Applicants should enter information into this form that is specific to this service area.</p>
				<p>All fields are required fields. When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return to the criterion.</p>
				<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>			</td>
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
        <td colspan='2' class="SeparatorHdg" >Legal Work Management Chart</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td width="45%"><b>1. Preparation of  opening and closing memoranda <%=kDenoteRequiredField%></b></td>
	   <td width="53%"></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td align="right"><span runat="server" id='spnMethod1' /></td>
	   <td align="left"><span runat="server" id='spnMethod1Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>2. Accompanying newer attorneys to hearings, trials, depositions, oral arguments, etc.<%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td align="right"><span runat="server" id='spnMethod2' /></td>
	    <td align="left"><span runat="server" id='spnMethod2Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>3. Review of written work (e.g., briefs, significant memoranda, and pleadings)<%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td align="right"><span runat="server" id='spnMethod3' /></td>
	    <td align="left"><span runat="server" id='spnMethod3Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>4. Case acceptance meetings<%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td align="right"><span runat="server" id='spnMethod4' /></td>
	    <td align="left"><span runat="server" id='spnMethod4Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>5. Case reviews with staff <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td align="right"><span runat="server" id='spnMethod5' /></td>
	    <td align="left"><span runat="server" id='spnMethod5Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>6. Electronic case reviews <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td align="right"><span runat="server" id='spnMethod6' /></td>
	    <td align="left"><span runat="server" id='spnMethod6Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>7. Mooting appellate arguments <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td align="right"><span runat="server" id='spnMethod7' /></td>
	    <td align="left"><span runat="server" id='spnMethod7Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>8. Supervisor review of files at time of closing <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td align="right"><span runat="server" id='spnMethod8' /></td>
	    <td align="left"><span runat="server" id='spnMethod8Period' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><b>9. Availability of a litigation fund (e.g., for depositions, expert witnesses, process servers, trial aids, interpreters, and translators) <%=kDenoteRequiredField%></b></td>
	    <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td align="right"><span runat="server" id='spnMethod9' /></td>
	    <td align="left"><span runat="server" id='spnMethod9Period' /></td>
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
	    <DataObject Key='LSCRFPWORKMGT' DataObjectDefinitionKey='LSCRFPWORKMGT' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
	        <DisplayProperties>
				<DisplayProperty PropertyKey='Method1'>
					<Control ID='ctlmethod1'
						Container='spnMethod1'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
							<Parameter StoredValue='5' DisplayValue='Other/Not Applicable'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='Method1TP'>
					<Control ID='txtMethod1TP'
						Type='cTextBox'
						Container='spnMethod1Period'
						Size='400'
						MaxLength='400' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='Method1TP'>
					<Control ID='txtMethod1TP'
						Type='cTextArea'
						Container='spnMethod1Period'
						Rows='5'
						MaxLength='400'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method2'>
					<Control ID='ctlmethod2'
						Container='spnMethod2'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
							<Parameter StoredValue='5' DisplayValue='Other/Not Applicable'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method2TP'>
					<Control ID='txtMethod2TP'
						Type='cTextArea'
						Container='spnMethod2Period'
						Rows='5'
						MaxLength='400'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method3'>
					<Control ID='ctlmethod3'
						Container='spnMethod3'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
							<Parameter StoredValue='5' DisplayValue='Other/Not Applicable'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method3TP'>
					<Control ID='txtMethod3TP'
						Type='cTextArea'
						Container='spnMethod3Period'
						Rows='5'
						MaxLength='400'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method4'>
					<Control ID='ctlmethod4'
						Container='spnMethod4'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
							<Parameter StoredValue='5' DisplayValue='Other/Not Applicable'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method4TP'>
					<Control ID='txtMethod4TP'
						Type='cTextArea'
						Container='spnMethod4Period'
						Rows='5'
						MaxLength='400'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method5'>
					<Control ID='ctlmethod5'
						Container='spnMethod5'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
							<Parameter StoredValue='5' DisplayValue='Other/Not Applicable'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method5TP'>
					<Control ID='txtMethod5TP'
						Type='cTextArea'
						Container='spnMethod5Period'
						Rows='5'
						MaxLength='400'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method6'>
					<Control ID='ctlmethod6'
						Container='spnMethod6'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
							<Parameter StoredValue='5' DisplayValue='Other/Not Applicable'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method6TP'>
					<Control ID='txtMethod6TP'
						Type='cTextArea'
						Container='spnMethod6Period'
						Rows='5'
						MaxLength='400'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method7'>
					<Control ID='ctlmethod7'
						Container='spnMethod7'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
							<Parameter StoredValue='5' DisplayValue='Other/Not Applicable'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method7TP'>
					<Control ID='txtMethod7TP'
						Type='cTextArea'
						Container='spnMethod7Period'
						Rows='5'
						MaxLength='400'
						Cols='60'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method8'>
					<Control ID='ctlmethod8'
						Container='spnMethod8'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
							<Parameter StoredValue='5' DisplayValue='Other/Not Applicable'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method8TP'>
					<Control ID='txtMethod8TP'
						Type='cTextArea'
						Container='spnMethod8Period'
						Rows='5'
						MaxLength='400'
						Cols='60' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method9'>
					<Control ID='ctlmethod9'
						Container='spnMethod9'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
							<Parameter StoredValue='5' DisplayValue='Other/Not Applicable'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Method9TP'>
					<Control ID='txtMethod9TP'
						Type='cTextArea'
						Container='spnMethod9Period'
						Rows='5'
						MaxLength='400'
						Cols='60' />
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
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Methods Used To Retain Volunteer Attorneys, Law graduates, Law Students, and Other Professionals</h1></td>
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
		  	<p>Use the RFP Chart to indicate how often the Applicant uses the methods listed to retain private attorney volunteers.</p>  
				<p><font color='red'>For those applying to multiple service areas, this RFP Chart is <i>not</i> linked across service areas. Applicants should enter information into this form that is specific to this service area. </font></p>
				<p>All fields are required fields. When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return.</p>
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
        <td colspan='3' class="SeparatorHdg" >Methods Used To Retain Volunteer Attorneys, Law graduates, Law Students, and Other Professionals</td>
    </tr>
</table>
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
	   <td width='325'><b>1.  Recognition ceremonies<%=kDenoteRequiredField %>  </b></td>
	   <td width='275'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnRetainMethod1' /></td>
	</tr>
	<tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td><b>2.  Recognition in publications or on websites<%=kDenoteRequiredField %> </b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnRetainMethod2' /></td>
	</tr>
	<tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td><b>3.  Malpractice insurance<%=kDenoteRequiredField %></b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnRetainMethod3' /></td>
	</tr>
	<tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td><b>4.  Mentoring, co-counseling<%=kDenoteRequiredField %>  </b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnRetainMethod4' /></td>
	</tr>
	<tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td><b>5.  Free or low cost training<%=kDenoteRequiredField %>  </b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnRetainMethod5' /></td>
	</tr>
	<tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td><b>6. Inclusion in substantive law task forces<%=kDenoteRequiredField %></b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnRetainMethod6' /></td>
	</tr>
	<tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td><b>7. Access to specialized research materials<%=kDenoteRequiredField %></b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnRetainMethod7' /></td>
	</tr>
	<tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td><b>8. Access to forms and document assembly<%=kDenoteRequiredField %></b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td>&nbsp;</td>
	   <td align='center'><span runat="server" id='spnRetainMethod9' /></td>
	</tr>
	<tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
	   <td><b>9. Other (please specify)<%=kDenoteRequiredField %></b></td>
	   <td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	   <td><span runat="server" id='spnOtherTxtbx' /></td>
	   <td align='center'><span runat="server" id='spnRetainMethod8' /></td>
	</tr>
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
	    <DataObject Key='LSCRFPRETAINPVTATTY' DataObjectDefinitionKey='LSCRFPRETAINPVTATTY' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
	        <DisplayProperties>
	            <DisplayProperty PropertyKey='RetainMethod1'>
					<Control ID='ctlRetainMethod1'
						Container='spnRetainMethod1'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
						    <Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainMethod2'>
					<Control ID='ctlRetainMethod2'
						Container='spnRetainMethod2'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
						    <Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				   </DisplayProperty>
				    <DisplayProperty PropertyKey='RetainMethod3'>
					<Control ID='ctlRetainMethod3'
						Container='spnRetainMethod3'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
						    <Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				  </DisplayProperty>
				
				 <DisplayProperty PropertyKey='RetainMethod4'>
					<Control ID='ctlRetainMethod4'
						Container='spnRetainMethod4'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
						    <Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				  </DisplayProperty>
				
				 <DisplayProperty PropertyKey='RetainMethod5'>
					<Control ID='ctlRetainMethod5'
						Container='spnRetainMethod5'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
						    <Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainMethod6'>
					<Control ID='ctlRetainMethod6'
						Container='spnRetainMethod6'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
						    <Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainMethod7'>
					<Control ID='ctlRetainMethod7'
						Container='spnRetainMethod7'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
						    <Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				  </DisplayProperty>
                  <DisplayProperty PropertyKey='RetainMethod9'>
					<Control ID='ctlRetainMethod9'
						Container='spnRetainMethod9'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
						    <Parameter StoredValue='1' DisplayValue='Always'/>
							<Parameter StoredValue='2' DisplayValue='Frequently'/>
							<Parameter StoredValue='3' DisplayValue='Rarely'/>
							<Parameter StoredValue='4' DisplayValue='Never'/>
						</Parameters>
					</Control>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainMethod8Name'>
					<Control ID='ctlOtherTxtbx'
						Container='spnOtherTxtbx'
						Type='cTextBox'
						MaxLength='30'
						Size='30'/>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='RetainMethod8'>
					<Control ID='ctlRetainMethod8'
						Container='spnRetainMethod8'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
						    <Parameter StoredValue='1' DisplayValue='Always'/>
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




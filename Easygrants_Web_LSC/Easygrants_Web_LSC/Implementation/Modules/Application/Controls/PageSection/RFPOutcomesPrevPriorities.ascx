<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Outcomes Met for Previous Priorities</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area One, Criterion 4 - <i>Outcomes Met for Previous Priorities </i></b> </td>
	</tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
		<td>
		  	<p>Review your response to Performance Area One, Criterion 2, “Priorities, Goals, Strategies and Desired Outcomes” from your last LSC  grant application, and identify the four most significant priorities listed in your response. Respond to the questions about outcomes achieved last year for those priorities using the text boxes below.</p> 
			<p style="color:red">For those applying to multiple service areas: This RFP Chart is <em>not</em> linked across service areas. Applicants should enter information into this form that is specific to this service area.</p>
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
        <td  colspan='2' class="SeparatorHdg" >Outcomes Met for Previous Priorities</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>

<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
       <td width='20%'><b>First Significant Priority <font color='red'>*</font></b></td>
       <td width='80%'><span runat='server' id='spnFirstSigniPriority' /></td>
    </tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
       <td>List all of the outcomes projected in the grant application for this priority.<font color='red'>*</font></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFirstPriorityOutcomes' /></td>
    </tr>
    <tr>
       <td>State whether, and the extent to which, the projected outcome(s) for this priority were met. <font color='red'>*</font></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFirstPriorityOutcomesMet' /></td>
    </tr>
    <tr>
       <td>If outcomes were not met, briefly explain why. <font color='red'>*</font></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFirstPriorityOutcomesNotMet' /></td>
    </tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
       <td width="20%" ><b>Second Significant Priority <font color='red'>*</font></b></td>
       <td width="80%" ><span runat='server' id='spnSecondSigniPriority' /></td>
    </tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
     <tr>
       <td>List all of the outcomes projected in the grant application for this priority.<font color='red'>*</font></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnSecondPriorityOutcomes' /></td>
    </tr>
    <tr>
       <td>State whether, and the extent to which, the projected outcome(s) for this priority were met. <font color='red'>*</font></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnSecondPriorityOutcomesMet' /></td>
    </tr>
    <tr>
       <td>If outcomes were not met, briefly explain why. <font color='red'>*</font></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnSecondPriorityOutcomesNotMet' /></td>
    </tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
       <td width="20%" ><b>Third Significant Priority <font color='red'>*</font></b></td>
       <td width="80%" ><span runat='server' id='spnThirdSigniPriority' /></td>
    </tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
     <tr>
       <td>List all of the outcomes projected in the grant application for this priority.<font color='red'>*</font></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnThirdPriorityOutcomes' /></td>
    </tr>
    <tr>
       <td>State whether, and the extent to which, the projected outcome(s) for this priority were met. <font color='red'>*</font></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnThirdPriorityOutcomesMet' /></td>
    </tr>
    <tr>
       <td>If outcomes were not met, briefly explain why. <font color='red'>*</font></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnThirdPriorityOutcomesNotMet' /></td>
    </tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
       <td  width="20%"><b>Fourth Significant Priority <font color='red'>*</font></b></td>
       <td  width="80%"><span runat='server' id='spnFourthSigniPriority' /></td>
    </tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
     <tr>
       <td>List all of the outcomes projected in the grant application for this priority.<font color='red'>*</font></td>
       <td>&nbsp;</td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFourthPriorityOutcomes' /></td>
       <td>&nbsp;</td>
    </tr>
    <tr>
       <td>State whether, and the extent to which, the projected outcome(s) for this priority were met. <font color='red'>*</font></td>
       <td>&nbsp;</td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFourthPriorityOutcomesMet' /></td>
       <td>&nbsp;</td>
    </tr>
    <tr>
       <td>If outcomes were not met, briefly explain why. <font color='red'>*</font></td>
       <td>&nbsp;</td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFourthPriorityOutcomesNotMet' /></td>
       <td>&nbsp;</td>
    </tr>
 </table>   
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
	
	  <DataObject Key='LscRFPOutcomePrevPriorities' DataObjectDefinitionKey='LscRFPOutcomePrevPriorities' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
	        <DisplayProperties>
	            <DisplayProperty PropertyKey='FirstSigniPriority'>
					<Control ID='ctlFirstSigniPriority'
						Container='spnFirstSigniPriority'
						Type='cTextBox'
						Size='60'>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='FirstPriorityOutcomes'>
					<Control ID='ctlFirstPriorityOutcomes' 
						Type='cTextArea' 
						Container='spnFirstPriorityOutcomes' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='FirstPriorityOutcomesMet'>
					<Control ID='ctlFirstPriorityOutcomesMet' 
						Type='cTextArea' 
						Container='spnFirstPriorityOutcomesMet' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='FirstPriorityOutcomesNotMet'>
					<Control ID='ctlFirstPriorityOutcomesNotMet' 
						Type='cTextArea' 
						Container='spnFirstPriorityOutcomesNotMet' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
	        
	              <DisplayProperty PropertyKey='SecondSigniPriority'>
					<Control ID='ctlSecondSigniPriority'
						Container='spnSecondSigniPriority'
						Type='cTextBox'
						Size='60'>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SecondPriorityOutcomes'>
					<Control ID='ctlSecondPriorityOutcomes' 
						Type='cTextArea' 
						Container='spnSecondPriorityOutcomes' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SecondPriorityOutcomesMet'>
					<Control ID='ctlSecondPriorityOutcomesMet' 
						Type='cTextArea' 
						Container='spnSecondPriorityOutcomesMet' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SecondPriorityOutcomesNotMet'>
					<Control ID='ctlSecondPriorityOutcomesNotMet' 
						Type='cTextArea' 
						Container='spnSecondPriorityOutcomesNotMet' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  
				  <DisplayProperty PropertyKey='ThirdSigniPriority'>
					<Control ID='ctlThirdSigniPriority'
						Container='spnThirdSigniPriority'
						Type='cTextBox'
						Size='60'>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='ThirdPriorityOutcomes'>
					<Control ID='ctlThirdPriorityOutcomes' 
						Type='cTextArea' 
						Container='spnThirdPriorityOutcomes' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='ThirdPriorityOutcomesMet'>
					<Control ID='ctlThirdPriorityOutcomesMet' 
						Type='cTextArea' 
						Container='spnThirdPriorityOutcomesMet' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='ThirdPriorityOutcomesNotMet'>
					<Control ID='ctlThirdPriorityOutcomesNotMet' 
						Type='cTextArea' 
						Container='spnThirdPriorityOutcomesNotMet' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  
				   <DisplayProperty PropertyKey='FourthSigniPriority'>
					<Control ID='ctlFourthSigniPriority'
						Container='spnFourthSigniPriority'
						Type='cTextBox'
						Size='60'>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='FourthPriorityOutcomes'>
					<Control ID='ctlFourthPriorityOutcomes' 
						Type='cTextArea' 
						Container='spnFourthPriorityOutcomes' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='FourthPriorityOutcomesMet'>
					<Control ID='ctlFourthPriorityOutcomesMet' 
						Type='cTextArea' 
						Container='spnFourthPriorityOutcomesMet' 
						Rows='4' 
						Cols='70'/>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='FourthPriorityOutcomesNotMet'>
					<Control ID='ctlFourthPriorityOutcomesNotMet' 
						Type='cTextArea' 
						Container='spnFourthPriorityOutcomesNotMet' 
						Rows='4' 
						Cols='70'/>
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


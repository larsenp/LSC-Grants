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
		  	<p>Review your response to Performance Area One, Criterion 4, “Evaluation and Adjustment” from your last LSC competitive grant application, and identify the four most significant priorities listed in your response. Respond to the questions about outcomes for those priorities using the text boxes below.</p> 
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
       <td><b>List all of the outcomes projected in the grant application for this priority.<font color='red'>*</font></b></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFirstPriorityOutcomes' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td><b>State whether, and the extent to which, the projected outcome(s) for this priority were met. <font color='red'>*</font></b></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFirstPriorityOutcomesMet' /></td>
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td><b>If outcomes were not met, briefly explain why. <font color='red'>*</font></b></td>
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
       <td><b>List all of the outcomes projected in the grant application for this priority.<font color='red'>*</font></b></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnSecondPriorityOutcomes' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td><b>State whether, and the extent to which, the projected outcome(s) for this priority were met. <font color='red'>*</font></b></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnSecondPriorityOutcomesMet' /></td>
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td><b>If outcomes were not met, briefly explain why. <font color='red'>*</font></b></td>
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
       <td><b>List all of the outcomes projected in the grant application for this priority.<font color='red'>*</font></b></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnThirdPriorityOutcomes' /></td>
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td><b>State whether, and the extent to which, the projected outcome(s) for this priority were met. <font color='red'>*</font></b></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnThirdPriorityOutcomesMet' /></td>
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td><b>If outcomes were not met, briefly explain why. <font color='red'>*</font></b></td>
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
       <td><b>List all of the outcomes projected in the grant application for this priority.<font color='red'>*</font></b></td>
       <td>&nbsp;</td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFourthPriorityOutcomes' /></td>
       <td>&nbsp;</td>
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td><b>State whether, and the extent to which, the projected outcome(s) for this priority were met. <font color='red'>*</font></b></td>
       <td>&nbsp;</td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFourthPriorityOutcomesMet' /></td>
       <td>&nbsp;</td>
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td><b>If outcomes were not met, briefly explain why. </b><font color='red'>*</font></td>
       <td>&nbsp;</td>
    </tr>
    <tr>
       <td><span runat='server' id='spnFourthPriorityOutcomesNotMet' /></td>
       <td>&nbsp;</td>
    </tr>
 </table>   

<span id='spnConfigXML' visible='false' runat='server'> 
	<ModuleSection> 
	
	    <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='2' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='66' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject>
	
	    <DataObject Key='LscRFPOutcomePrevPriorities' DataObjectDefinitionKey='LscRFPOutcomePrevPriorities' Updatable='False' CreateNew='False'>
             <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	        <DisplayProperties>
				 <DisplayProperty PropertyKey='FirstSigniPriority'>
					 <Control ID='spnFirstSigniPriority'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  
				 <DisplayProperty PropertyKey='FirstPriorityOutcomes'>
					 <Control ID='spnFirstPriorityOutcomes' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 
				  <DisplayProperty PropertyKey='FirstPriorityOutcomesMet'>
					 <Control ID='spnFirstPriorityOutcomesMet' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  
				  <DisplayProperty PropertyKey='FirstPriorityOutcomesNotMet'>
					 <Control ID='spnFirstPriorityOutcomesNotMet' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
	        
	             
				  <DisplayProperty PropertyKey='SecondSigniPriority'>
					 <Control ID='spnSecondSigniPriority' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 
				  <DisplayProperty PropertyKey='SecondPriorityOutcomes'>
					 <Control ID='spnSecondPriorityOutcomes' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 
				  <DisplayProperty PropertyKey='SecondPriorityOutcomesMet'>
					 <Control ID='spnSecondPriorityOutcomesMet' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  
				  <DisplayProperty PropertyKey='SecondPriorityOutcomesNotMet'>
					 <Control ID='spnSecondPriorityOutcomesNotMet' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  
				  
				  <DisplayProperty PropertyKey='ThirdSigniPriority'>
					 <Control ID='spnThirdSigniPriority' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				
				  <DisplayProperty PropertyKey='ThirdPriorityOutcomes'>
					 <Control ID='spnThirdPriorityOutcomes' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 
				  <DisplayProperty PropertyKey='ThirdPriorityOutcomesMet'>
					 <Control ID='spnThirdPriorityOutcomesMet' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 
				  <DisplayProperty PropertyKey='ThirdPriorityOutcomesNotMet'>
					 <Control ID='spnThirdPriorityOutcomesNotMet' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  
				  
				  <DisplayProperty PropertyKey='FourthSigniPriority'>
					 <Control ID='spnFourthSigniPriority' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 
				  <DisplayProperty PropertyKey='FourthPriorityOutcomes'>
					 <Control ID='spnFourthPriorityOutcomes' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  
				  <DisplayProperty PropertyKey='FourthPriorityOutcomesMet'>
					 <Control ID='spnFourthPriorityOutcomesMet' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 
				  <DisplayProperty PropertyKey='FourthPriorityOutcomesNotMet'>
					 <Control ID='spnFourthPriorityOutcomesNotMet' 
						Type='HtmlGenericControl' />
				  </DisplayProperty>
	        
	        </DisplayProperties>
	   </DataObject>
	   
		
	  
	    
	</ModuleSection>
</span>


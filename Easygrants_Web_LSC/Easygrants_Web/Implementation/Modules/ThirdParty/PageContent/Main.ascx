<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.ThirdParty.PageContent.cMain" CodeBehind="Main.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- 
<br>Complete the following information and the rating below.   All fields marked with a red 
asterisk (<font color=red>*</font>) are required.
<p>

<ul>
   <li>Click on the <b>Save</b> button to save and remain on this page. </li>     
   <li>Click on the <b>Save and Continue</b> button to save the information on this page and 
navigate to the next page.  Note that clicking the <b>Save and Continue</b> button requires that all fields are complete. </li>  
   <li>You can also use the navigation links to the left to navigate to another page. </li>        
</ul> 
<b>IMPORTANT:</b> navigating away from this page before clicking <b>Save</b> will cause you to lose any unsaved information.
<p>
-->

<br>
<span id='spnPageContent' runat='server'/>
<p>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td>
			<b><font color=red>*</font>Dates associated with applicant:</b>
			<b>From:</b>&nbsp;<span id='spnFrom' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td>
			<b>To:</b>&nbsp;<span id='spnTo' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b><font color=red>*</font>Capacity at that time (teacher, supervisor, etc.):</b>
		</td>
		<td>
			<span id='spnCapacity' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td NoWrap='true'>
			<b><font color=red>*</font>Position of applicant at that time (undergraduate, teaching asst., etc.):</b>&nbsp;
		</td>
		<td>
			<span id='spnApplicantPosition' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="9" class="SeparatorHdg"><b>Reference Rating</b></td>
	</tr>
</table>
<p>
Please rate the applicant relative to other individuals of similar training and experience 
with whom you have been associated.  Mark every line.  When you are finished with this 
page, click on the <b>Save and Continue</b> button below to be directed to the Letter of Support 
page.
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr><td></td>
		<td nowrap='true'>
			Outstanding&nbsp;&nbsp;&nbsp;
			Excellent&nbsp;&nbsp;&nbsp;
			Very Good&nbsp;&nbsp;&nbsp;
			Good/Average&nbsp;&nbsp;&nbsp;
			Fair/Below Average&nbsp;&nbsp;&nbsp;Insufficient Knowledge
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td valign='top'><font color=red>*</font>Research ability and potential</td>
		<td>
			<span id='spnResearch' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Knowledge in chosen field, familiarity with literature
		</td>
		<td>
			<hr><span id='spnKnowledge' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Written and verbal communication skills
		</td>
		<td>
			<hr><span id='spnCommunication' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Self-reliance and independence
		</td>
		<td>
			<hr><span id='spnIndependence' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Motivation and perseverance in pursuing goals
		</td>
		<td>
			<hr><span id='spnMotivation' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Ability to plan and conduct research, organize data
		</td>
		<td>
			<hr><span id='spnPlan' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Ability to work as a member of a research team
		</td>
		<td>
			<hr><span id='spnTeam' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Imagination, originality, creativity
		</td>
		<td>
			<hr><span id='spnImagination' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Accuracy
		</td>
		<td>
			<hr><span id='spnAccuracy' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Laboratory skills and techniques, if relevant
		</td>
		<td>
			<hr><span id='spnLabSkill' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Clinical proficiency, if relevant
		</td>
		<td>
			<hr><span id='spnClinical' runat='server'/>
		</td>
	</tr>
	<tr><td nowrap='true' valign='top'><hr><font color=red>*</font>Overall scientific ability
		</td>
		<td>
			<hr><span id='spnOverall' runat='server'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSave_and_Continue'/>		
		</td>
	</tr>
</table>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignmentReference' DataObjectDefinitionKey='WfTaskAssignmentReference' Updatable='True'  CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FromDate'>
					<Control ID='ctlFrom'
						Container='spnFrom'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='The From date entered is invalid or not formatted properly.'
						Size='35'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='From Date is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ToDate'>
					<Control ID='ctlTo'
						Container='spnTo'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='The To date entered is invalid or not formatted properly.'
						Size='35'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='To Date is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Capacity'>
					<Control ID='ctlCapacity'
						Container='spnCapacity'
						Type='cTextBox'
						Size='50'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Capacity is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ApplicantPosition'>
					<Control ID='ctlApplicantPosition'
						Container='spnApplicantPosition'
						Type='cTextBox'
						Size='50'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Applicant Position is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Research'>
					<Control ID='ctlResearch'
						Container='spnResearch'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Research Ability and potential is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Knowledge'>
					<Control ID='ctlKnowledge'
						Container='spnKnowledge'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Knowledge in chosen field, familiarity with literature is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Communication'>
					<Control ID='ctlCommunication'
						Container='spnCommunication'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Written and verbal communication skills is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Independence'>
					<Control ID='ctlIndependence'
						Container='spnIndependence'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Self-reliance and independence is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Motivation'>
					<Control ID='ctlMotivation'
						Container='spnMotivation'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Motivation and perseverance in pursuing goals is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PlanAbility'>
					<Control ID='ctlPlan'
						Container='spnPlan'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Ability to plan and conduct research, organize data is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='TeamPlayer'>
					<Control ID='ctlTeam'
						Container='spnTeam'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Ability to work as a member of a research team is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Imagination'>
					<Control ID='ctlImagination'
						Container='spnImagination'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Imagination, originality, creativity is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Accuracy'>
					<Control ID='ctlAccuracy'
						Container='spnAccuracy'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Accuracy is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LabSkill'>
					<Control ID='ctlLabSkill'
						Container='spnLabSkill'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Laboratory skills and techniques, if relevant is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ClinicalProficiency'>
					<Control ID='ctlClinical'
						Container='spnClinical'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Clinical proficiency, if relevant is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='OverallAbility'>
					<Control ID='ctlOverall'
						Container='spnOverall'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						RequiredField='True'
						ErrorMessage='Overall scientific ability is required.'>
						<Parameters>
							<Parameter StoredValue='5' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='4' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
							<Parameter StoredValue='0' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				
			</DisplayProperties>		
		</DataObject>
			
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton' GoToNextPage='True' />
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->

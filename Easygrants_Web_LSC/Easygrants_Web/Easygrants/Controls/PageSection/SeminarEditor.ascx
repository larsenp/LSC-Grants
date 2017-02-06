<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cSeminarEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="SeminarEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
Enter information about the seminar you have attended.  
All fields marked with an asterisk (<FONT color=red>*</FONT>)are required.
<br>
- Click on the <b>Save</b> button to save the information.
<br>
- Click on the <b>Close</b> button to close the <b>Seminars Editor</b> page 
and return to the Seminars page.
<br><br>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Seminar Editor</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b>Course Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnCourseName' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Course Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnCourseDate' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Description</b></td>
		<td><span id='spnCourseDescription' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='WfTaskAssignmentSeminar' DataObjectDefinitionKey='WfTaskAssignmentSeminar' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentSeminarID'
					PropertyKey='WfTaskAssignmentSeminarID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
			</DefaultValues>
			
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='CourseName'>
					<Control ID='ctlCourseName'
						Container='spnCourseName'
						Type='cTextBox'
						Size='50'
						MaxLength='250'
						RequiredField='True'
						ErrorMessage='Course Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CourseDate'>
					<Control ID='ctlCourseDate'
						Container='spnCourseDate'
						Type='cDateTextBox'
						DateFormat='MM/dd/yyyy'
						Width='8'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Course Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CourseDescription'>
					<Control ID='ctlCourseDescription'
						Container='spnCourseDescription'
						Type='cTextArea'
						Cols='50'
						Rows='5'
						MaxLength='5000'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>
<!-- End Embedded XML -->

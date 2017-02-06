<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Seminars Editor</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<!-- Control Label (for Organization information) -->
	<tr><td width='20'/>
		<td	valign="top" width="120"><b>Course Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnCourseName' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td width='20'/>
		<td	valign="top" width="120"><b>Course Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnCourseDate' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td width='20'/>
		<td	valign="top" width="120"><b>Description</b></td>
		<td>
			<span id='spnDescript' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr align='center'><td width='20'/>
		<td></td>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/> 
			<!-- Cancel Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProjectSeminar' DataObjectDefinitionKey='GranteeProjectSeminar' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectSeminarID'
					PropertyKey='GranteeProjectSeminarID'
					Value='' 
					bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='TaskID' Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CourseName'>
					<Control ID='ctlCourseName'
						Container='spnCourseName'
						Type='cTextBox'
						Size='80'
						MaxLength='80'
						RequiredField='True'
						ErrorMessage='Course Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='CourseDate'>
					<Control ID='ctlCourseDate'
						Container='spnCourseDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='35'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Course Date is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Descript'>
					<Control ID='ctlDescript'
						Container='spnDescript'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='500'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,500}$' ErrorMessage='Limit your Notes to 500 characters or less.' />
					</Control>
				</DisplayProperty>
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
<!-- End Embedded XML -->
</span>

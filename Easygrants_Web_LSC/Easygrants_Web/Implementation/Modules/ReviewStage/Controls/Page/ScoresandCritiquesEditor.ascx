<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cScoresandCritiquesEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!--Instructions-->
<br>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><span id='spnPageContent' runat='server' /></td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Applicant Information</b></td>
	</tr>
	
</table>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>

	<tr>
		<td width='10%' valign='bottom'><B>Name</B></td>
		<td width='25%'  valign='bottom'><span id='spnApplicantName' runat='server'/></td>
		<td width='10%' valign='bottom'><span id='SpnGrantID' runat='server'/></td>
		<td><span id='spnViewApp' runat='server'/></td>
	</tr>
	<tr>
		<td><B><%=GetLabel("Organization")%></B></td>
		<td><span id='spnOrganization' runat='server'/></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td><B><%=GetLabel("ProjectTitle")%></B></td>
		<td colspan='3'><span id='spnProjectTitle' runat='server'/></td>		
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td class="SeparatorHdg"><b>Score(s)</b></td>
	</tr>
	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>

	<tr>
		<td width='10%'><B>Scoring Scale:</B></td>
		<td>5 (best) to 1 (worst)</td>		
	</tr>
	<tr>		
		<td width='10%'><b>Score&nbsp;<%=kDenoteRequiredField%></b></td>
		<td><span id='spnScore' runat='server'/></td>
	</tr>	
</table>
<br>
<table id='tabComments' border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>	
	<tr>
		<td class="SeparatorHdg"><b>Critique&nbsp;<%=kDenoteRequiredField%></b></td>
	</tr>
		
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span id='spnComments' runat='server'/>
		</td>
	</tr>	
	<tr>		
		<td class='FieldLabel'>&nbsp;Limited to 5000 characters including spaces (approximately 500 words including spaces).</td>		
	</tr>		
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave' /><span runat='server' id='spnSaveAndClose'/><span runat='server' id='spnCancel' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	 <PageContent />
		<DataObject Key='ReviewWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</Filters>
		</DataObject>		
		<DataObject Key='ExternalReviewApplicationsList' DataObjectDefinitionKey='ExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='QueryString' TypeKey='AppWftaID' PropertyKey='AppWftaID' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' />
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ApplicantName'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ApplicantName'>
					<Control ID='spnApplicantName' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AppWfta.GranteeProject.GranteeProjectID'>
					<Control ID='SpnGrantID' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AppWfta.GranteeProject.GrantTitle'>
					<Control ID='spnProjectTitle' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnOrganization' Type='HtmlGenericControl'/>
				</DisplayProperty>					
				<DisplayProperty PropertyKey=''>
					<Control ID='btnView'
						Type='cButton'
						Container='spnViewApp'
						Caption='View PDF'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='ViewReviewerPDF'>
							<Parameters>
								<Argument Type='Object' ObjectType = 'DataObject' ObjectKey='ExternalReviewApplicationsList' />							
							</Parameters>
						</Action>
					</Control>										
				</DisplayProperty>								
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>	
			<Filters>	
				<Argument Type='DataObjectCollection' TypeKey='ExternalReviewApplicationsList' DataObjectPropertyKey='RevWftaID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>			
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewRating' >							
					<Control ID='ctlRating'
						Container='spnScore'
						Type='cTextBox'
						Size='3'
						MaxLength='3'>
					    <Validation Type='RegularExpression'
							ValidationExpression='^([12345]{1})|(([12345]{1}).[0-9])$'
							
							ErrorMessage='Score is a whole number between 1-5.' />
					</Control>							
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>		
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>	
			<Filters>	
				<Argument Type='DataObjectCollection' TypeKey='ExternalReviewApplicationsList' DataObjectPropertyKey='RevWftaID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='ExternalReviewApplicationsList' DataObjectPropertyKey='RevWftaID' PropertyKey='WfTaskAssignmentID'/>
				<Argument Type='DataObjectCollection' TypeKey='ExternalReviewApplicationsList' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlComments'
						Container='spnComments'
						Type='cTextArea'
						Rows='15'
						Cols='120'
						MaxLength='5000'/>						
				</DisplayProperty>
			</DisplayProperties>
		</DataObject> 
		
		<!-- Save, Close buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey=''>
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
                            Method='DataPresenter_Reload_After_Save'>							    								
							<Parameters>								
								<Argument Type='DataObjectCollection' TypeKey='ExternalReviewApplicationsList' DataObjectPropertyKey='AppWftaID' PropertyKey='AppWftaID' BaseValue='AppWftaID='/>									
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
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
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close' Confirmation='Click OK to close without saving data changes since last save.  Click Cancel to return to page and save data.'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
</span>
<!-- End Embedded XML -->
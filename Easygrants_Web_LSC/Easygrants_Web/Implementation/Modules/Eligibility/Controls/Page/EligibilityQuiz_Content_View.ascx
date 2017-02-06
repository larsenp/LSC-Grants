<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Eligibility.Controls.Page.cEligibilityQuiz_Content_ViewImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Contact_Notes_View.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	
	<tr>
		<td width='2%'><span id="spnQuestionNumber" runat='server'/></td>
	    <td width='2%'><span id="spnQuestionID" runat='server'/></td>		
		<td width='75%'><span id="spnQuestion" runat='server'/></td>		
		<td><span id="spnAnswerList" runat='server'/> <asp:CustomValidator 
				                id='valQuestion'
				                runat='server'
				                OnServerValidate='ValidateQuestions'
				                ErrorMessage='Other is required.'
				                Display='None'/></td>
	</tr>	
	<tr>
		<td colspan='4'><HR></td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		
					
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='EligibilityQuestion' Key='EligibilityQuestion1'>
		
			<DisplayProperties>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='ctlQuestionNumber'
						Container='spnQuestionNumber'
						Type='cLabel'>
					</Control>	
				</DisplayProperty> 
			    <DisplayProperty PropertyKey='QuestionID'>
					<Control ID='ctlQuestionID'
						Container='spnQuestionID'
						Type='cLabel'>
					</Control>	
				</DisplayProperty> 			   
			    <DisplayProperty PropertyKey='EligibilityQuestion.Description'>
					<Control ID='ctlQuestion'
						Container='spnQuestion'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>    				
			    <DisplayProperty PropertyKey=''>
						<Control ID='ctlAnswerList'
						Container='spnAnswerList'
						Type='cRadioButtonList'
						DataObjectDefinitionKey='EligibilityAnswer'
						StoredValue='EligibilityAnswerID'
						DisplayValue='Description'
						RepeatDirection='Horizontal'
						RepeatColumns='0'	/>					
				    </DisplayProperty>					
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>

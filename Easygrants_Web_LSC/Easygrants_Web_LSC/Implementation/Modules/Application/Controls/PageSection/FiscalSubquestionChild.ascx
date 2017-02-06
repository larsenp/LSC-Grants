<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<span runat='server' id='spnAlpha'/>. <span runat='server' id='spnQuestionText'/>
<br />
<span runat='server' id='spnLscCompFiscalAnswerID'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscCompApplFiscalAnswer' Key='LscCompApplFiscalAnswer' DataObjectDefinitionKey='LscCompApplFiscalAnswer' Updatable='True' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscCompFiscalSubquestion.Alpha'>
					<Control ID='spnAlpha'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscCompFiscalSubquestion.QuestionText'>
					<Control ID='spnQuestionText'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscCompFiscalAnswerID'>
					<Control ID='rdoLscCompFiscalAnswerID'
						Type='cRadioButtonList'
						Container='spnLscCompFiscalAnswerID'
						DataObjectDefinitionKey='LscCompFiscalAnswer'
						StoredValue='LscCompFiscalAnswerID'
						DisplayValue='AnswerText'
						RepeatDirection='Vertical'
						RepeatColumns='0'>
						<Filters>
							<Argument Type='DataObjectCollection' 
								TypeKey='LscCompApplFiscalAnswer' 
								DataObjectPropertyKey='LscCompFiscalSubquestion.LscCompFiscalSubquestionID' 
								PropertyKey='LscCompFiscalSubquestionID'/>
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>

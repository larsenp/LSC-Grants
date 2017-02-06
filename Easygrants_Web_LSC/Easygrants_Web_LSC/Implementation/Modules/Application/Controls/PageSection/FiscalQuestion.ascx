<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.PageSection.cFiscalQuestion" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<p>Fiscal Question</p>

<span runat='server' id='spnQuestion'/>
<br />
<span runat='server' id='spnLscCompFiscalAnswerID'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscCompFiscalQuestion' DataObjectDefinitionKey='LscCompFiscalQuestion' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='PartNum' PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='LscCompFiscalPart'/>
				</Argument>
				<Argument Type='DataPresenter' TypeKey='QuestionNum' PropertyKey='Number'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='QuestionText'>
					<Control ID='spnQuestion'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='LscCompApplFiscalAnswer' DataObjectDefinitionKey='LscCompApplFiscalAnswer' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='OrganizationID' PropertyKey='OrganizationID'/>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument Type='DataObjectCollection' TypeKey='LscCompFiscalQuestion' DataObjectPropertyKey='LscCompFiscalQuestionID' PropertyKey='LscCompFiscalQuestionID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='OrganizationID' PropertyKey='OrganizationID'/>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument Type='DataObjectCollection' TypeKey='LscCompFiscalQuestion' DataObjectPropertyKey='LscCompFiscalQuestionID' PropertyKey='LscCompFiscalQuestionID'/>
			</DefaultValues>
			<DisplayProperties>
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
							<Argument Type='DataObjectCollection' TypeKey='LscCompFiscalQuestion' DataObjectPropertyKey='LscCompFiscalQuestionID' PropertyKey='LscCompFiscalQuestionID'/>
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>

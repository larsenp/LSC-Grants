<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.PageSection.cFiscalQuestion" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<span runat='server' id='spnQuestionNum'/>. <span runat='server' id='spnQuestion'/>
<br />
<span runat='server' id='spnSubquestions'/>

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
				<DisplayProperty PropertyKey='Number'>
					<Control ID='spnQuestionNum'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QuestionText'>
					<Control ID='spnQuestion'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscInsLscCompApplFiscalAnswer' DataObjectDefinitionKey='LscInsLscCompApplFiscalAnswer' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='wf_task_assignment_id'/>
				<Argument Type='DataObjectCollection' TypeKey='LscCompFiscalQuestion' DataObjectPropertyKey='LscCompFiscalQuestionID' PropertyKey='question_id'/>
			</Filters>
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
				<Argument Type='DataObjectCollection' TypeKey='LscCompFiscalQuestion' DataObjectPropertyKey='LscCompFiscalQuestionID' PropertyKey='LscCompFiscalQuestionID'>
					<RelatedProperty PropertyKey='LscCompFiscalSubquestion'/>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='Alpha'>
					<RelatedProperty PropertyKey='LscCompFiscalSubquestion'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSubquestions'
						Type='cDataPresenterList'
						Container='spnSubquestions'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/FiscalSubquestionChild.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

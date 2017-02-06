<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.Eligibility.Controls.Page.cEligibilityQuiz_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server' />

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table runat='server' width='100%'>	
	<tr>
		<td><span id='spnPageContent' runat='server'/></td>
	</tr>
</table>
<Core:cUserCtlLoader CtlID='ctlEligibilityQuizImpl' 
	Src='Implementation\Modules\Eligibility\Controls\Page\EligibilityQuizImpl.ascx'
	runat='server'/>
<table id="Table1" runat='server' width='100%'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><span runat='server' id='spnEligibilityQuestionsList'/></td>
	</tr>
	
	<tr>
		<td colspan='4'>Upon submission of this page, you will see the outcome of your Eligibility Quiz. 
		If you are eligible to apply for this award, you will have a corresponding To Do item on your <b>Home</b> 
		page. If you do not wish to apply for this award at this time, click <b>Cancel</b>.</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='4'><b>Important:</b> Please proof your answers carefully. You will not be able to revise your answers after submitting.
		</td>
	</tr>
	<tr>
		
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' ID="Table3">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave' />
		</td>
		<td>&nbsp;</td>
		<td align='center'>
			<span runat='server' id='spnCancel' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' ID="Table4">
	<tr>
		<td align='center'>
			<span runat='server' id='spnSubmit' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<PageContent/>
		<DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
					<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='PersonID' Value=''/>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
					<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
			</Filters>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
		</DataObject>
		
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='False'>
            <Filters>
                <Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' />
                <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID' />
            </Filters>
        </DataObject>
			
		<DataObject Key='EligibilityQuestion' DataObjectDefinitionKey='WFProjectTaskEligibilityAnswer' Updatable='False'>
			<Filters>
                <Argument Type='DataObjectCollection' TypeKey='WfProjectTask' DataObjectPropertyKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' />                
            </Filters>	
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlEligibilityQuestionsList' 
						Container='spnEligibilityQuestionsList' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Eligibility/Controls/Page/EligibilityQuiz_Content_View.ascx' />
				</DisplayProperty>				               
			</DisplayProperties>
		</DataObject>	
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='' >
					<Control ID='ctlEligibilityQuizImpl' Type='cUserCtlLoader'/>
				</DisplayProperty>
                <DisplayProperty PropertyKey=''>
                    <Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save' EnterKey='True'>
                        <Action PostBack='True' AutoSave='True' Object='EventController'
                            Method='EventController_NavigateToModulePageKey'>
                            <Parameters>
                                <Argument Type='' TypeKey = '' Value='Eligibility' />
                                <Argument Type='' TypeKey = '' Value='EligibilityModuleConfig' />
                                <Argument Type='' TypeKey = '' Value='' />
                                <Argument Type='' TypeKey = '' Value='' />
                            </Parameters>
                        </Action>
                    </Control>
                </DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes.'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='ModulePage'
							Method='Submit'>
							<Parameters>
								<Argument Type='Object' ObjectType = 'DataObject' ObjectKey='Person' />
								<Argument Type='' TypeKey = '' Value='Home' />
								<Argument Type='' TypeKey = ''  Value='HomeModuleConfig' />
								<Argument Type='' TypeKey = '' Value='Home' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Cancel' Confirmation='Are you sure you want to cancel?'>
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Home' />
								<Argument Value='HomeModuleConfig' />
								<Argument Value='Home' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

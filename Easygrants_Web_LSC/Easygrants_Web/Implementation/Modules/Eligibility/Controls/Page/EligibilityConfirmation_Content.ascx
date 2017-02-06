<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.Eligibility.Controls.Page.cEligibilityConfirmation_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server' />

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<span id='spnPageContent' runat='server'/>
<p>

<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->

    <table border='0' cellpadding='0' cellspacing='0' runat='server' width='100%'>
	    <tr>
		    <td class="SeparatorHdg"><b>Eligibility Quiz Answers</b></td>
	    </tr>
	    <tr>
		    <td>&nbsp;</td>
	    </tr>
    </table>
    <table border='0' cellspacing='0' cellpadding='2' runat='server' Width='100%'>
        <tr>		
		    <td >
		        <span id='spnEligibleLabel' visible='false' runat='server'/>
		        <span id='spnEmailLabel1' visible='false' runat='server'/>
		        <b><span id='spnEmailClick' visible='true' runat='server'/></b>
		        <span id='spnEmailLabel2' visible='false' runat='server'/>
		    </td>		
	    </tr>
	    <tr>
		    <td>
			    <span runat='server' id='spnEligibility' />
		    </td>
	    </tr>
    </table>
    <Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlEligibilityConfirmationImpl' 
				Src='Implementation/Modules/Eligibility/Controls/Page/EligibilityConfirmationImpl.ascx'
				runat='server'/>
    <!-- END USER MODIFIABLE CONTENT AREA -->
    <table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' ID="Table3">
	    <tr>
		    <td align='center'>
			    <span runat='server' id='spnContinue' />
		    </td>
	    </tr>
    </table>
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
			
			<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
				<Filters>
						<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='PersonID' Value=''/>
						<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
						<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
				</Filters>
			</DataObject>
			
			<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
				<Filters>
					<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				</Filters>
			</DataObject>
			
			<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask'>
            <Filters>
                <Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' />
                <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID' />
            </Filters>
        </DataObject>
			
			<DataObject Key='Eligibility' DataObjectDefinitionKey='Eligibility' Updatable='False'>
				<Filters>
					<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' bool=''/>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''	bool=''/>					
					<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' DataObjectPropertyKey='WfProjectTaskID' PropertyKey='WfProjectTaskID'/>
				</Filters>
				<Sort>
                    <Argument PropertyKey='EligibilityID' Direction='Descending'/>
                </Sort>
			    <DisplayProperties>
				    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					    <Control ID='ctlEligibility'
						    Container='spnEligibility'
						    Type='cDataListCtl'						    
						    SeparatorWidth='2' >
						    <DisplayProperty PropertyKey='QualifiedAnswer.SortOrder'  ColumnHeader=' ' Width='2%' />	
						    <DisplayProperty PropertyKey='Question.Description'  ColumnHeader=' ' Width='68%'/>						   
						    <DisplayProperty PropertyKey='EligibilityAnswer.Description' DataAlign='Middle' HeaderAlign='Middle' ColumnHeader='Your Answers'  Width='15%' />						    					  
					        <DisplayProperty PropertyKey='QualifiedAnswer.EligibilityAnswer.Description'   DataAlign='Middle' HeaderAlign='Middle' ColumnHeader='Qualified Answers' Width='15%' />						       
					     </Control>
				    </DisplayProperty>
			    </DisplayProperties>
		   </DataObject>
			<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
				<DisplayProperties>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnContinue' Container='spnContinue' Type='cButton' Image='Continue'>
							<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
								<Parameters>
									<Argument Value='Home' />
									<Argument Value='HomeModuleConfig' />
									<Argument Value='Home' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
                        <Control ID='lnkEmail' Type='cLink' Container='spnEmailClick' Caption='click here to request an exception.'>
 						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ShowEligibilityException'/>
                       </Control>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

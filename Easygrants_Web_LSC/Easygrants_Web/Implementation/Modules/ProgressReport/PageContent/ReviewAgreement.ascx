<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ReviewAgreement.ascx.vb" Inherits="Easygrants_Web.Modules.ProgressReport.PageContent.cReviewAgreement" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>


<br><br>
<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
<span id='spnPageContent' runat='server' />

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/ProgressReport/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
	

<br>

<table width='100%' border='0'>
	<tr>
		<td class='SeparatorHdg'><b>View Grant Agreement</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	    <td><span id='spnGALink' runat='server' /></td>
	</tr>
</table>


<br><br>


<table id="Table11" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Agreement Terms</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
        <td>I have read the terms and conditions of the grant as detailed in the grant agreement. </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><span id='spnAgreeToTerms' runat='server' /></td></tr>
</table>

<br><br>


<table id="Table2" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Comments</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr><td><span id='spnRAComment' runat='server' /></td></tr>
</table>



<table id='tblButtons' border='0' width='100%' cellspacing='0' cellpadding='3' runat='server' visible='True'>
<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id="spnSave" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id="spnSaveAndClose" />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
	
<!-- Embedded XML Page Functionality - please do not edit -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<%--
		<DataObject Key='RAWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		<DataObject Key='RAWfTaskAssignment1' DataObjectDefinitionKey='WfTaskAssignment'>
		    <Filters>
		        <Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Type='DataObjectCollection' TypeKey='RAWfTaskAssignment' DataObjectPropertyKey='WfTask.WorkFlowBuilderList.PrevWfTask.WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
		</DataObject>		
		<DataObject Key='RAReportOutputDefinition' DataObjectDefinitionKey='ReportOutputDefinition'>
			<Filters>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGALink'
					    Container='spnGALink'
						Type='cButton'
						Image='View Grant Agreement'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='Export_Word'>
						    <Parameters>
						        <Argument Type='DataObjectCollection' TypeKey='RAWfTaskAssignment1' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' BaseValue=''/>
							    <Argument Type='' TypeKey = '' PropertyKey='DefinitionID' Value='4' />
						    </Parameters>
				        </Action>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>	
		</DataObject>--%>
		
		
		<DataObject Key='CreateRASubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='True' CreateNew='False'>
            <Filters>
                <Argument Type='' TypeKey='' PropertyKey='FileTypeID' Value='1001' />
            </Filters>
            <DisplayProperties>
                <DisplayProperty PropertyKey=''>
                    <Control ID='ctlGALink'
                        Container='spnGALink'
                        Type='cButton'
                        Image='View Grant Agreement'>
                            <Action
                                PostBack='True'
                                Object='DataPresenter'
                                Method='DocumentList_ViewConvertedUploadedFile'>
                            </Action>
                    </Control>
                </DisplayProperty>
            </DisplayProperties>
        </DataObject>

		
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AgreeToTerms'>
					<Control ID='ctlAgreeToTerms'
						Container='spnAgreeToTerms'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Vertical'
						RepeatColumns='0'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='I agree to the terms and conditions.'/>
							<Parameter StoredValue='0' DisplayValue='I disagree to the terms and conditions.'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='RAWfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlRAComment'
						Container='spnRAComment'
						Type='cTextArea'
						Rows='5'
						Cols='100'
						MaxLength='4000'>
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
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='URL' TypeKey='PathAndQuery'/>
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
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='Home'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>	
				
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>

<!-- End Embedded XML -->
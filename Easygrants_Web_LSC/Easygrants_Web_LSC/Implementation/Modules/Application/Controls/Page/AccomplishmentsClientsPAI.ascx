<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
	  <td colspan="4"><h1>Accomplishments through PAI</h1></td>
  </tr>
	<tr>
	  <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" >
			 	<p>Describe the three most significant accomplishments for clients in cases or other services through PAI within the last twelve months. Describe the issue(s), outcome(s) and benefit to other low-income people with a similar problem, or for the client population as a whole.</p>
				<p>If the applicant does not have a PAI project for this service area, enter “Not Applicable” for each example.  </p>
				<p><font color='red'>For those applying to multiple service areas, this RFP Chart is <i>not</i> linked across service areas. Applicants should enter information into this form that is specific to this service area. </font></p>
				<p>All fields are required fields. When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return to the criterion.</p>
				<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>
			</td>
          
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
        <td class="SeparatorHdg" >Accomplishments through PAI</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td> Example 1: Accomplishments for Clients through PAI in the last year</td></tr>
    <tr><td><p>Example Type <%=kDenoteRequiredField%> &nbsp;&nbsp;&nbsp;<span runat='server' id='spnExample1Type' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the problem or challenge.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample1Problems' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the the actions taken with pro bono services.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample1Actions' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the effects, results or outcomes of the program’s actions.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample1Outcomes' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Example 2: Accomplishments for Clients through PAI in the last year</p></td></tr>
	<tr><td><p>Example Type <%=kDenoteRequiredField%> &nbsp;&nbsp;&nbsp;<span runat='server' id='spnExample2Type' /></p></td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the problem or challenge.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample2Problems' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the the actions taken with pro bono services.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample2Actions' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the effects, results or outcomes of the program’s actions.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample2Outcomes' /></p></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
   <%-- <tr><td><p>Example 3</p></td></tr>
	<tr><td><p>Example Type <%=kDenoteRequiredField%> &nbsp;&nbsp;&nbsp;<span runat='server' id='spnExample3Type' /></p></td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the problem or challenge.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample3Problems' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the the actions the program took.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample3Actions' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the effects, results or outcomes of the program’s actions.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample3Outcomes' /></p></td></tr>--%>
     <tr><td><p>Example 3: Accomplishments for the Program through PAI (since the November 2014 revision to 45 C.F.R. Part 1614) </p></td></tr>
	<tr><td><p>Example Type <%=kDenoteRequiredField%> &nbsp;&nbsp;&nbsp;<span runat='server' id='spnExample4Type' /></p></td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the problem or challenge.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample4Problems' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the the actions taken.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample4Actions' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Describe the effects, results or outcomes of the actions taken.</p></td></tr>
    <tr><td><p><span runat='server' id='spnExample4Outcomes' /></p></td></tr>
</table>
<br />
<br />
<table id="Table2" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr align='center'>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveCloseStd' />
			<span runat='server' id='spnSaveClosePPQV' />
		</td>
	</tr>
</table>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	   <DataObject Key='LscSignificantAccomplishments' DataObjectDefinitionKey='LscSignificantAccomplishments' Updatable='True' CreateNew='True'>
	            <Filters>
				    <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			    </Filters> 
			    <DefaultValues>
			        <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    </DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Example1ClientsPAIType'> 
					<Control ID='ctlExample1Type'
						Container='spnExample1Type'
						Type='cDropDown'
						DataObjectDefinitionKey='LscExampleType'
						StoredValue='LscExampleTypeID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Filters>
						   <Argument Type='Data' PropertyKey='AccomplishmentsTypeID' Value='2' />
						</Filters>
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			   <DisplayProperty PropertyKey='Example1ClientsPAIProblems'>
					<Control ID='txtExample1Problems' 
						Type='cTextArea' 
						Container='spnExample1Problems' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Example1ClientsPAIActions'>
					<Control ID='txtExample1Actions' 
						Type='cTextArea' 
						Container='spnExample1Actions' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Example1ClientsPAIOutcomes'>
					<Control ID='txtExample1Outcomes' 
						Type='cTextArea' 
						Container='spnExample1Outcomes' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				
				
				<DisplayProperty PropertyKey='Example2ClientsPAIType'> 
					<Control ID='ctlExample2Type'
						Container='spnExample2Type'
						Type='cDropDown'
						DataObjectDefinitionKey='LscExampleType'
						StoredValue='LscExampleTypeID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Filters>
						   <Argument Type='Data' PropertyKey='AccomplishmentsTypeID' Value='2' />
						</Filters>
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Example2ClientsPAIProblems'>
					<Control ID='txtExample2Problems' 
						Type='cTextArea' 
						Container='spnExample2Problems' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Example2ClientsPAIActions'>
					<Control ID='txtExample2Actions' 
						Type='cTextArea' 
						Container='spnExample2Actions' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Example2ClientsPAIOutcomes'>
					<Control ID='txtExample2Outcomes' 
						Type='cTextArea' 
						Container='spnExample2Outcomes' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
			    
				<%--<DisplayProperty PropertyKey='Example3ClientsPAIType'> 
					<Control ID='ctlExample3Type'
						Container='spnExample3Type'
						Type='cDropDown'
						DataObjectDefinitionKey='LscExampleType'
						StoredValue='LscExampleTypeID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Filters>
						   <Argument Type='Data' PropertyKey='AccomplishmentsTypeID' Value='2' />
						</Filters>
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Example3ClientsPAIProblems'>
					<Control ID='txtExample3Problems' 
						Type='cTextArea' 
						Container='spnExample3Problems' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Example3ClientsPAIActions'>
					<Control ID='txtExample3Actions' 
						Type='cTextArea' 
						Container='spnExample3Actions' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Example3ClientsPAIOutcomes'>
					<Control ID='txtExample3Outcomes' 
						Type='cTextArea' 
						Container='spnExample3Outcomes' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>--%>
				
				<DisplayProperty PropertyKey='Example4ProgramPAIType'> 
					<Control ID='ctlExample4Type'
						Container='spnExample4Type'
						Type='cDropDown'
						DataObjectDefinitionKey='LscExampleType'
						StoredValue='LscExampleTypeID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Filters>
						   <Argument Type='Data' PropertyKey='AccomplishmentsTypeID' Value='2' />
						</Filters>
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Example4ProgramPAIProblems'>
					<Control ID='txtExample4Problems' 
						Type='cTextArea' 
						Container='spnExample4Problems' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Example4ProgramPAIActions'>
					<Control ID='txtExample4Actions' 
						Type='cTextArea' 
						Container='spnExample4Actions' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Example4ProgramPAIOutcomes'>
					<Control ID='txtExample4Outcomes' 
						Type='cTextArea' 
						Container='spnExample4Outcomes' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	    
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
			 <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToCriterion'
						Type='cLabel'
						Container='spnReturnToCriterion'
						LabelText='Save and Return to Criterion Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToPA'
						Type='cLabel'
						Container='spnReturnToPA'
						LabelText='Save and Return to Performance Area Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
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
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveCloseStd'
						Type='cButton'
						Container='spnSaveCloseStd'
						Caption='Save and Return to Criterion Page'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="AppFormByCriterion"/>
								<Argument Type='QueryString' TypeKey='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClosePPQV'
						Type='cButton'
						Container='spnSaveClosePPQV'
						Caption='Save and Return to Performance Area Page'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="PostPQVPA3"/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	    
				
				
				
	</ModuleSection>
</span>
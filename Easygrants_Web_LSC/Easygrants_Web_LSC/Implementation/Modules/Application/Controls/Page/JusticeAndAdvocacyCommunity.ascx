<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
	  <td colspan="4"><h1>Involvement with Justice and Advocacy Community</h1></td>
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
			 	<p>From the last twelve months, describe applicant�s three most significant efforts or examples of active involvement with the judiciary, organized bar, government agencies, social service agencies, academic and research centers, state and national legal advocacy organizations and other organizations that work with or have an impact on the eligible client population.</p>
				<p><font color='red'>For those applying to multiple service areas: This RFP Chart is linked across service areas. All information entered here will be automatically entered into applications for other service areas. </font></p>
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
        <td class="SeparatorHdg" >Involvement with Justice and Advocacy Community</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td> Example 1</td></tr>
    <tr><td><p>Example Type <%=kDenoteRequiredField%> &nbsp;&nbsp;&nbsp;<span runat='server' id='spnExample1Type' /></p></td></tr>
    <tr><td><p><span runat='server' id='spnExample1desc' /></p></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td><p>Example 2</p></td></tr>
	<tr><td><p>Example Type <%=kDenoteRequiredField%> &nbsp;&nbsp;&nbsp;<span runat='server' id='spnExample2Type' /></p></td></tr>
	<tr><td><p><span runat='server' id='spnExample2desc' /></p></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr><td><p>Example 3</p></td></tr>
	<tr><td><p>Example Type <%=kDenoteRequiredField%> &nbsp;&nbsp;&nbsp;<span runat='server' id='spnExample3Type' /></p></td></tr>
	<tr><td><p><span runat='server' id='spnExample3desc' /></p></td></tr>
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
	    
	     <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	    
	    <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	    
	    <DataObject Key='LscSignificantAccomplishments' DataObjectDefinitionKey='LscSignificantAccomplishments' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</DefaultValues>
            <DisplayProperties>
                <DisplayProperty PropertyKey='Example1JusticeType'> 
					<Control ID='ctlExample1Type'
						Container='spnExample1Type'
						Type='cDropDown'
						DataObjectDefinitionKey='LscExampleType'
						StoredValue='LscExampleTypeID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Filters>
						   <Argument Type='Data' PropertyKey='AccomplishmentsTypeID' Value='3' />
						</Filters>
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			     <DisplayProperty PropertyKey='Example1JusticeDesc'>
					<Control ID='txtExample1Desc' 
						Type='cTextArea' 
						Container='spnExample1Desc' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Example2JusticeType'> 
					<Control ID='ctlExample2Type'
						Container='spnExample2Type'
						Type='cDropDown'
						DataObjectDefinitionKey='LscExampleType'
						StoredValue='LscExampleTypeID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Filters>
						   <Argument Type='Data' PropertyKey='AccomplishmentsTypeID' Value='3' />
						</Filters>
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			     <DisplayProperty PropertyKey='Example2JusticeDesc'>
					<Control ID='txtExample2Desc' 
						Type='cTextArea' 
						Container='spnExample2Desc' 
						Rows='4' 
						Cols='70'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='Example3JusticeType'> 
					<Control ID='ctlExample3Type'
						Container='spnExample3Type'
						Type='cDropDown'
						DataObjectDefinitionKey='LscExampleType'
						StoredValue='LscExampleTypeID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Filters>
						   <Argument Type='Data' PropertyKey='AccomplishmentsTypeID' Value='3' />
						</Filters>
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			     <DisplayProperty PropertyKey='Example3JusticeDesc'>
					<Control ID='txtExample3Desc' 
						Type='cTextArea' 
						Container='spnExample3Desc' 
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
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Controls.PageSection.cManagementReviewListItem" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table width='750' border='0'>
	<tr>
		<td width='25'>
			<asp:CheckBox id='chkSubmit' Visible="false" runat='server'/>
			<a href='javascript:void(0);' class='popup' runat='server' id='lnkValidation' visible='false'>
				<img src="/EasyGrants_Web_LSC/Core/images/x.gif" />
				<span runat='server' id='spnValidation'></span>
			</a>
		</td>
		<td width='75' style="text-align:Left" >
			<span runat='server' id='spnRecipientID' />
		</td>
		<td width='200' style="text-align:Left">
			<span runat='server' id='spnOrganization' />
		</td>
		<td width='50' style="text-align:Left">
			<span runat='server' id='spnServiceArea' />
		</td>
		<td width='125' style="text-align:Left">
			<span runat='server' id='spnFundingRec' />
		</td>
		<td width='125' style="text-align:Left">
			<span runat='server' id='spnFundingTermRec' />
		</td>
		<td width='25' style="text-align:Left">
			<b>SGC:</b>
		</td>
		<td width='125' style="text-align:Left">
			<span runat='server' id='spnSpecialGrant' />
		</td>
	</tr>
</table>
<br />
<table width='900'>
	<tr>
		<td width='20'>&nbsp;</td>
		<td width='100' style="text-align:Left">
			<span runat='server' id='spnPresidentName' />
		</td>
		<td width='230'style="text-align:Left">
			<span runat='server' id='spnDate' />
		</td>
		<td style="width:550px; vertical-align::top">
			<span style="vertical-align:top"><b>Comment</b></span><span runat='server' id='spnComment' />
		</td>
	</tr>
	<tr><td class='MinorSeparatorHdg' colspan="4">&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscToDoListRenewalAppReview' Key='LscToDoListRenewalAppReview' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RecipientID' ColumnHeader='Recipient ID'>
					<Control ID='ctlLink2'
						Type='cLink'
						Container='spnRecipientID'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='SwitchWfTA'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
								<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignment.GranteeProjectID' />
							</Parameters>	
						</Action>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='VPCompReview' />
							</Parameters>
						</Action>
									</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='spnOrganization'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ServiceArea'>
					<Control ID='spnServiceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
		   <Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		   </Filters>
		   <DisplayProperties>
		        <DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlRecommendationID'
						Type='cDropDown'
						Container='spnFundingRec'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome' >
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' />
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual' />
						</Filters>
					</Control>
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
		    <Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		   </Filters>
		   <DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
		   </DefaultValues>
		    <DisplayProperties>
		       <DisplayProperty PropertyKey='LscFundingTermID'>
					<Control ID='ctlFundingTerm'
						Type='cDropDown'
						Container='spnFundingTermRec'
						DataObjectDefinitionKey='LscFundingTerm'
						StoredValue='LscFundingTermID'
						DisplayValue='Description' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpecialGrant'>
					<Control ID='rdoSpecialGrant'
						Type='cRadioButtonList'
						Container='spnSpecialGrant'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='SpecialGrantComment'>
					<Control ID='txtComment'
						Type='cTextArea'
						Container='spnComment'
						Rows='2'
						Cols='50' />
				</DisplayProperty>
			  </DisplayProperties>
		  </DataObject>
		  
		  <DataObject Key='LscOA1' DataObjectDefinitionKey='LscOA1' Updatable='True' CreateNew='True'>
		    <Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		   </Filters>
		   <DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
		    </DefaultValues>
		    <DisplayProperties>
		       <DisplayProperty PropertyKey='StaffReaderPersonID'>
					<Control ID='ctlOPPDirName' 
						Type='cDropDown' 
						Container='spnPresidentName'
						DataObjectDefinitionKey='ReviewCommitteeMember'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='6' />
						</Filters>
					</Control>
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='StaffReaderDate'>
					<Control ID='ctlStaffReaderDate' 
						Type='cDateTextBox' 
						Container='spnDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='LSC Staff Reader Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='LSC Staff Reader Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
			    </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
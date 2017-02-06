<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table width='900' border='0'>
	<tr>
		<td width='50' style="text-align:Left" ><span runat='server' id='spnRecipientID' /></td>
		<td width='200' style="text-align:Left"><span runat='server' id='spnOrganization' /></td>
		<td width='25' style="text-align:Left"><span runat='server' id='spnServiceArea' /></td>
		<td width='200' style="text-align:Left"><span runat='server' id='spnTask' /></td>
		<td width='100' style="text-align:Left"><span runat='server' id='spnFundingRec' /></td>
		<td width='50' style="text-align:Left"><span runat='server' id='spnSpecialGrant' /></td>
	</tr>
</table>
<br />
<table width='500'>
	<tr>
		<%--<td width='100' style="text-align:Left">
			<span runat='server' id='spnStatus' />
		</td>--%>
		<td width='200' style="text-align:Left">
			<span runat='server' id='spnPresidentName' />
		</td>
		<td width='200' style="text-align:Left">
			<span runat='server' id='spnDate' />
		</td>
	</tr>
</table>
<table width='900'>
	<tr><td class='MinorSeparatorHdg'>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	     <DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscToDoListRenewalAppReview' Key='LscToDoListRenewalAppReview' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RecipientID' ColumnHeader='Recipient ID'>
						    <Control ID='ctlLink2'
										Type='cLink'
										Container='spnRecipientID'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='ModuleName' PropertyKey='ModuleName' />
												<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='ModuleConfigFilename' PropertyKey='ModuleConfigFilename'  />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
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
				<DisplayProperty PropertyKey='WfTask'>
					<Control ID='spnTask'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			<%--	<DisplayProperty PropertyKey='WfTaskStatus'>
					<Control ID='spnStatus'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
			</DisplayProperties>
		</DataObject>
		
		 <DataObject Key='LscRenewalRec' DataObjectDefinitionKey='LscRenewalRec' Updatable='True' CreateNew='True'>
		   <Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		   </Filters>
		     <DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListRenewalAppReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
		   </DefaultValues>
		   <DisplayProperties>
		        <DisplayProperty PropertyKey='LscRenewalRecommendationID'>
					<Control ID='ctlRecommendationID'
						Type='cDropDown'
						Container='spnFundingRec'
						DataObjectDefinitionKey='LscRenewalRecommendation'
						StoredValue='LscRenewalRecommendationID'
						DisplayValue='Description' >
						<Filters>
							<Argument PropertyKey='LscRenewalRecommendationID' Value='2'  Operator='NotEqual' />
						</Filters>
					  </Control>
				 </DisplayProperty>
				  <DisplayProperty PropertyKey='YesNoSpecialGrantCond'>
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
				<DisplayProperty PropertyKey='PrimaryReaderPersonID'>
					<Control ID='ctlLSCPresidentName' 
						Type='cDropDown' 
						Container='spnPresidentName'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='ReviewCommitteeMember'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='4' />
						</Filters>
					</Control>
			    </DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderDate'>
					<Control ID='ctlPrimaryReaderDate' 
						Type='cDateTextBox' 
						Container='spnDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
	         </DisplayProperties>
	      </DataObject>
		
	</ModuleSection>
</span>
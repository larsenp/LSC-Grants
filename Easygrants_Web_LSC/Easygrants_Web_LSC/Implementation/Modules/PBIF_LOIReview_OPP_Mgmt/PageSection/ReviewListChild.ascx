<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Controls.PageSection.cManagementReviewListItem" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table width='800' border='0'>
	<tr>
		<td width='25px'>
			<asp:CheckBox id='chkSubmit' Visible="false" runat='server'/>
			<a href='javascript:void(0);' class='popup' runat='server' id='lnkValidation' visible='false'>
				<img src="/EasyGrants_Web_LSC/Core/images/x.gif" />
				<span runat='server' id='spnValidation'></span>
			</a>
		</td>
		<td width='75px' style="text-align:Left" >
			<strong><span runat='server' id='spnLoiScore' /></strong>
		</td>
		<td width='75px' style="text-align:Left" >
			<span runat='server' id='spnGrantNumber' />
		</td>
		<td width='650px' style="text-align:Left">
			<span runat='server' id='spnOrganization' />
		</td>
	</tr>
	<tr>
		<td width='25px'>&nbsp;</td>
		<td width='775px' style="text-align:Left" colspan='3'>
			<strong>Recommend?</strong>&nbsp;<span runat='server' id='spnWfTaskOutcomeID' />
		</td>
	</tr>
	<tr>
		<td width='25px'>&nbsp;</td>
		<td style="vertical-align:top" colspan='3'>
			<strong>Comments</strong>&nbsp;<span runat='server' id='spnOverallComment' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3'>
			<strong>Reviewed&nbsp;by</strong>&nbsp;<span runat='server' id='spnStaffReaderPersonID'/>
			&nbsp;&nbsp;
			<strong>Date</strong>&nbsp;<span runat='server' id='spnDate' />
		</td>
	</tr>
	<tr><td class='MinorSeparatorHdg' colspan="4">&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscToDoListProBonoAppReviewDetail' Key='LscToDoListProBonoAppReviewDetail' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantNumber' ColumnHeader='Grant Number'>
					<Control ID='ctlLink2'
						Type='cLink'
						Container='spnGrantNumber'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='SwitchWfTA'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='LscToDoListProBonoAppReviewDetail' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
								<Argument Type='DataObjectCollection' TypeKey='LscToDoListProBonoAppReviewDetail' DataObjectPropertyKey='WfTaskAssignment.GranteeProjectID' />
							</Parameters>	
						</Action>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ReviewLOI' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OrganizationName'>
					<Control ID='spnOrganization'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LOIScore' Format='0'>
					<Control ID='spnLOIScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	    <DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
		   <Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListProBonoAppReviewDetail' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		   </Filters>
		   <DisplayProperties>
		        <DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlWfTaskOutcomeID'
						Type='cDropDown'
						Container='spnWfTaskOutcomeID'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome' >
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='LscToDoListProBonoAppReviewDetail' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' />
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual' />
						</Filters>
					</Control>
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<%--<DataObject Key='LscProBonoScoreByLoi' DataObjectDefinitionKey='LscProBonoScoreByLoi' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WeightedScore' Format='0'>
					<Control ID='spnLOIScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>--%>

		  <DataObject Key='LscOA1' DataObjectDefinitionKey='LscOA1' Updatable='True' CreateNew='True'>
		    <Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListProBonoAppReviewDetail' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		   </Filters>
		   <DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListProBonoAppReviewDetail' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
		    </DefaultValues>
		    <DisplayProperties>
		       <DisplayProperty PropertyKey='StaffReaderPersonID'>
					<Control ID='ctlStaffReaderPersonID' 
						Type='cDropDown' 
						Container='spnStaffReaderPersonID'
						DataObjectDefinitionKey='ReviewCommitteeMember'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='3' />
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

		<DataObject Key='LscPbifProgReview' DataObjectDefinitionKey='LscPbifProgReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListProBonoAppReviewDetail' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscToDoListProBonoAppReviewDetail' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='txtOverallComment'
						Type='cTextBox'
						Container='spnOverallComment'
						Size='100'/>
				</DisplayProperty>
			</DisplayProperties>		
		</DataObject>
	</ModuleSection>
</span>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>  Include Instructions.</p>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview_OCEStaff/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
	
<div class='SeparatorHdg' width='100%'>
	Other Required Review
</div>
<br />
<table>
   <tr>
      <td width='50%'><b> Special Grant Conditions Proposed:<%=kDenoteRequiredField %></b> </td>
      <td width='50%' align="left"><span runat='server' id='spnSpecialGrant' /></td>
   </tr>
</table>
<table>
   <tr>
      <td><b> If yes, enter the proposed special grant conditions below:</b> </td>
   </tr>
   <tr>
      <td align="left"><span runat='server' id='spnSpecialGrantComment' /></td>
   </tr>
</table>
<br />
<table width='100%'>
    <tr>
		<td><b>OCE Staff reviewer<%=kDenoteRequiredField %></b>&nbsp;&nbsp;&nbsp;<span runat='server' id='spnStaffReaderPersonID' /></td>
	</tr>
	<tr>
		<td><b>Date<%=kDenoteRequiredField %></b>&nbsp;&nbsp;&nbsp;<span runat='server' id='spnStaffReaderDate' /></td>
	</tr>
</table>
<br />
<table>
	<tr><td><b>Evaluation Comments</b></td></tr>
	<tr><td><span runat='server' id='spnEvaluationComments' /></td></tr>
</table>


<table width='100%'>
    <tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan=3 align=center>
			<span runat="server" id='spnSave' />&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='EvaluationComments'>
					<Control ID='txtEvaluationComments'
						Type='cTextArea'
						Container='spnEvaluationComments'
						Rows='5'
						Cols='80' />
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
						Container='spnSpecialGrantComment'
						Rows='6'
						Cols='80' />
				</DisplayProperty>
		   </DisplayProperties>
        </DataObject>
        
        <DataObject Key='LscOA1' DataObjectDefinitionKey='LscOA1' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='StaffReaderPersonID'>
				 	<Control ID='ctlStaffReaderPersonID' 
						Type='cDropDown' 
						Container='spnStaffReaderPersonID'
						DisplayValue='LastNameFirstName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='EasylistReviewsReviewersView'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='1' />
						</Filters>
						<Sort>
							<Argument PropertyKey='LastNameFirstNameMiddleName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderDate'>
					<Control ID='ctlStaffReaderDate' 
						Type='cDateTextBox' 
						Container='spnStaffReaderDate'
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
			
        <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False' >
			<DisplayProperties>
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'
						Enter='False'
						Caption='Save and Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
        	
    </ModuleSection>
</span>        			
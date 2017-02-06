<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantPages' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPages.ascx'
	runat='server'/>
<br />
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	AutoVDateType='Last' Key='GrantsEditor' LinkTitle='TIG' runat='server'/>
	<br /><br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>
<br />
<div width='600' class='SeparatorHdg'>Project Details</div>
<table cellspacing='0' cellpadding='2' border='0' width='100%'>
	<tr>
		<td width='100'>
			<b>Project Area</b>
		</td>
		<td width='200'>
			<span runat='server' id='spnProjectArea' />
		</td>
		<td width='100'>
			<b>Purpose</b>
		</td>
		<td width='200'>
			<span runat='server' id='spnPurpose' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Conference Fee</b>
		</td>
		<td>
			$<span runat='server' id='spnConFee' />
		</td>
		<td>
			<b>First Priority</b>
		</td>
		<td>
			<span runat='server' id='spnFirstPriority' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Grant Conference Amount</b>
		</td>
		<td>
			<span runat='server' id='Span1' />
		</td>
		<td>
			<b>Second Priority</b>
		</td>
		<td>
			<span runat='server' id='spnSecondPriority' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Recommended Amount</b>
		</td>
		<td>
			$<span runat='server' id='spnRecommendedAmount' />
		</td>
	</tr>
	<tr>
		<td valign='top'>
			<b>Partners</b>
		</td>
		<td colspan='3'>
			<span runat='server' id='spnPartners' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg' colspan='4'>
			Process Details
		</td>
	</tr>
	<tr>
		<td>
			<b>Date Received</b>
		</td>
		<td>
			<span runat='server' id='spnDateReceived' />
		</td>
		<td align='right'>
			<b>Application checked and complete</b>
		</td>
		<td>
			<span runat='server' id='spnAppChecked' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Date Acknowledged</b>
		</td>
		<td>
			<span runat='server' id='spnDateAcknowledged' />
		</td>
		<td align='right'>
			<b>PAI oriented</b>
		</td>
		<td>
			<span runat='server' id='spnPAIOriented' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Date Notified</b>
		</td>
		<td>
			<span runat='server' id='spnDateNotified' />
		</td>
		<td align='right'>
			<b>SJI Interest</b>
		</td>
		<td>
			<span runat='server' id='spnSJIInterest' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Date Contract Received</b>
		</td>
		<td>
			<span runat='server' id='spnDateContrRecd' />
		</td>
		<td align='right'>
			<b>OLA review is indicated</b>
		</td>
		<td>
			<span runat='server' id='spnOLAReview' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
		<td align='right'>
			<b>Administrative Plan Required</b>
		</td>
		<td>
			<span runat='server' id='spnAdministrativePlanReq' />
		</td>
	</tr>
	<tr>
	</tr>
	<tr>
		<td valign='top'>
			<b>Panel/Staff Review Comments</b>
		</td>
		<td colspan='3'>
			<span runat='server' id='spnReviewComments' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg' colspan='4'>
			Comments
		</td>
	</tr>
	<tr>
		<td valign='top'>
			<b>Staff Grant Description</b>
		</td>
		<td colspan='3'>
			<span runat='server' id='spnCommentsUpdated' />
		</td>
	</tr>
	<tr>
		<td valign='top'>
			<b>Status and Next Steps</b>
		</td>
		<td colspan='3'>
			<span runat='server' id='spnStatusNextSteps' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4' align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscGranteeProjectTig' DataObjectDefinitionKey='LscGranteeProjectTig' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.PrimaryAddress.State.LscStateProv.OppRegion.Description'>
					<Control ID='spnProjectArea'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Purpose'>
					<Control ID='txtPurpose'
						Container='spnPurpose'
						Type='cTextBox'
						MaxLength='255'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ConFee'>
					<Control ID='txtConFee' 
						Format='#,0'
						Type='cMoneyTextBox'
						Container='spnConFee'
						MaxLength='6'
						Size='5'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Conference Fee" must be a whole number.'
						RegExErrorMessage='The value for "Conference Fee" must be a whole number.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FirstPriority'>
					<Control ID='txtFirstPriority'
						Container='spnFirstPriority'
						Type='cTextBox'
						MaxLength='50'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SecondPriority'>
					<Control ID='txtSecondPriority'
						Container='spnSecondPriority'
						Type='cTextBox' 
						MaxLength='50'
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Partners'>
					<Control ID='txtPartners'
						Container='spnPartners'
						Type='cTextArea' 
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DateReceived' Format='M/d/yyyy'>
					<Control ID='spnDateReceived'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AppChecked'>
					<Control ID='ctlAppChecked'
						Type='cRadioButtonList'
						Container='spnAppChecked'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PAIOriented'>
					<Control ID='ctlPAIOriented'
						Type='cRadioButtonList'
						Container='spnPAIOriented'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SJIInterest'>
					<Control ID='ctlSJIInterest'
						Type='cRadioButtonList'
						Container='spnSJIInterest'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OLAReview'>
					<Control ID='ctlOLAReview'
						Type='cRadioButtonList'
						Container='spnOLAReview'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AdministrativePlanReq'>
					<Control ID='ctlAdministrativePlanReq'
						Type='cRadioButtonList'
						Container='spnAdministrativePlanReq'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DateAcknowledged' Format='M/d/yyyy'>
					<Control ID='txtDateAcknowledged'
						Container='spnDateAcknowledged'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Date Acknowledged must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Date Acknowledged must be in mm/dd/yyyy format.'
						Size='10'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DateNotified' Format='M/d/yyyy'>
					<Control ID='txtDateNotified'
						Container='spnDateNotified'
						Type='cDateTextBox' 
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Date Notified must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Date Notified must be in mm/dd/yyyy format.'
						Size='10'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DateContrRecd' Format='M/d/yyyy'>
					<Control ID='txtDateContrRecd'
						Container='spnDateContrRecd'
						Type='cDateTextBox' 
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Date Contract Received must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Date Contract Received must be in mm/dd/yyyy format.'
						Size='10'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewComments'>
					<Control ID='txtReviewComments'
						Container='spnReviewComments'
						Type='cTextArea' 
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommentsUpdated'>
					<Control ID='txtCommentsUpdated'
						Container='spnCommentsUpdated'
						Type='cTextArea' 
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StatusNextSteps'>
					<Control ID='txtStatusNextSteps'
						Container='spnStatusNextSteps'
						Type='cTextArea' 
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
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
					<Control ID='btnCancel'
						Type='cButton'
						Container='spnCancel'
						Caption='Cancel'>
						<Action
							PostBack='True'
							Object='ModulePage'
							Method='Redirect'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecommendedAmount' Format='$#,#'>
					<Control ID='txtRecommendedAmount'
						Container='spnRecommendedAmount'
						Type='cMoneyTextBox' 
						Format='#,0'
						MaxLength='10'
						Size='5'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='The value for "Recommended Amount" must be a whole number.'
						RegExErrorMessage='The value for "Recommended Amount" must be a whole number.'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscStateProv' DataObjectDefinitionKey='LscStateProv' Updatable='False' CreateNew='False'></DataObject>
		<DataObject Key='LscOppRegion' DataObjectDefinitionKey='LscStateProv' Updatable='False' CreateNew='False'></DataObject>
	</ModuleSection>
</span>


<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="AddressEditorb.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
<br>
<span id='spnPageContent' runat='server'/>
<p>
<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Info</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr><td><b>Project Title</b></td>
		<td>
			<span runat='server' id='spnTitle'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><b>Project Description</b></td>
		<td>
			<span runat='server' id='spnDescription'></span>
		</td>
	</tr>
	<tr><td></td>
		<td class='FieldLabel'>Limit of 700 Characters</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' visible='false'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Membership Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<span id='oldAHAMemberText' runat='server' visible='false'>
	Please provide the  Council Membership numbers for yourself and your sponsor (if applicable).  
	<p>
	If you do not have an  Council Membership number, following the instructions below.
	<p>
	To obtain your membership number or join the , please visit 
	<span runat='server' id='spnHelp'/> or call the customer service center at 1-800-787-8984 (inside the U.S.) or 1-301-223-2307 (outside U.S.)  If you need to join the , we suggest you do so at least one week prior to submitting your application due to the time needed to process the membership number that is required below.
	<p>
	<table border='0' cellspacing='0' cellpadding='0' runat='server'>
		<tr><td><b>Applicant  Membership Identification Number</b>&nbsp;&nbsp;</td>
			<td>
				<span runat='server' id='spnAppl'></span>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td><b>Sponsor  Membership Identification Number</b></td>
			<td>
				<span runat='server' id='spnSponsor'></span>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
	</table>
</span>

<table align='center'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnSave_and_Continue'/>
			<span runat='server' id='spnClose'/> 
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
			<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True'>
				<Filters>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				</Filters>
				<DisplayProperties>	
					<DisplayProperty PropertyKey='GrantTitle'>
						<Control ID='ctlTitle'
							Container='spnTitle'
							Type='cTextBox'
							Size='80'
							MaxLength='500'
							RequiredField='False'
							ErrorMessage='Project Number is required.'>
						</Control>
					</DisplayProperty>	
					<DisplayProperty PropertyKey='GrantDescription'>
						<Control ID='ctlDescription'
							Container='spnDescription'
							Type='cTextArea'
							Rows='13'
							Cols='62'
							MaxLength='700'>
							<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,700}$' ErrorMessage='Limit your Project Description to 700 characters or less.' />
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey='ApplicantAHAID'>
						<Control ID='ctlAppl'
							Container='spnAppl'
							Type='cTextBox'
							Size='20'
							MaxLength='12'
							RequiredField='False'
							ErrorMessage='Project Number is required.'>
							<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{1,}\s?$' ErrorMessage='Enter whole numbers only for the Applicant Membership ID.' />
						</Control>
					</DisplayProperty>	
					<DisplayProperty PropertyKey='SponsorAHAID'>
						<Control ID='ctlSponsor'
							Container='spnSponsor'
							Type='cTextBox'
							Size='20'
							MaxLength='12'
							RequiredField='False' 
							ErrorMessage='Project Number is required.'>
							<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{1,}\s?$' ErrorMessage='Enter whole numbers only for the Sponsor Membership ID.' />
						</Control>
					</DisplayProperty>	
					<DisplayProperty PropertyKey=''>
						<Control Container='spnHelp' 
							ID='ctlHelp'
							Type='cLink'
							Caption='http://my.americanheart.org/portal/authentication/html//sendmembershipnumber.jsp'>
							<Action
								PostBack='False'
								URL='http://my.americanheart.org/portal/authentication/html//sendmembershipnumber.jsp'
								Target='Blank'>
							</Action>		
						</Control>
					</DisplayProperty>				
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave'
							Container='spnSave'
							Type='cButton'
							Image='Save'>
							<Action
								PostBack='True'
								AutoSave='True'/>
						</Control>
					</DisplayProperty>			
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' GoToNextPage='True' >
						</Control>	
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnClose'
							Container='spnClose'
							Type='cButton'
							Image='Close'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>	
								<Parameters>
									<Argument AttributeName='PageKey' Value='Main'/>
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>			
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
	
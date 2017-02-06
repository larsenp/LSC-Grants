<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cPolicyBoardStructureEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->
<br/>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr><td><h1>Policy Board Structure (Form F-1)</h1></td>
	</tr>
	<tr>
	  <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
        <tr>
          <td valign="top" ><p><font color="#990000"><strong>Applicants who currently have a governing/policy body that conforms to 45 C.F.R. Part 1607 must complete Policy Board Structure (Form F-1).</strong></font> Enter the following information:</p>
              <ul>
                <li> The total number of board members stipulated by the Applicant's Bylaws or Articles of Incorporation for McCollum Attorneys, Other Attorneys, Client Members, and Other members.</li>
                <li>The total number of current vacancies for each category based on the length of vacancy at the bottom. </li>
                <li>To save the data, click <strong>Save</strong>.</li>
                <li>To return to the previous page, click <strong>Close</strong>.</li>
              </ul>
              <p><strong>Follow the steps below for assistance on this form: </strong></p>
              <ol>
                <li> Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href="mailto:techsupport@lsc.gov"> techsupport@lsc.gov</a>. </li>
                <li>Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a>.</li>
                <li>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov">haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours.</li>
              </ol></td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
        <tr>
          <td valign="top" >&nbsp;</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td valign="top" >&nbsp;</td>
        </tr>
      </table></td>
  </tr>
	
	
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Control Label (for Name information) -->

	<tr>
		<td colspan="5" class="SeparatorHdg">Governing/Policy Board Positions</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr id='trNewApplicant'>
		<td colspan="5">
			<span runat='server' id='spnNewApplicantNoBylaws' />&nbsp;
			I am a new applicant and do not have bylaws.
		</td>
	</tr>
	<tr>
		<td width='30%'>&nbsp;</td>
		<td>
			<b>McCollum Attorneys<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<b>Other Attorneys<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<b>Client Members<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<b>Other Members<%=kDenoteRequiredField%></b>
		</td>
	</tr>
	<tr>
		<td>
			<b>No. of Bylaws Positions<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<span runat='server' id='spnMcCollumAttyBylaw' />
		</td>
		<td>
			<span runat='server' id='spnOtherAttyBylaw' />
		</td>
		<td>
			<span runat='server' id='spnClientMemberBylaw' />
		</td>
		<td>
			<span runat='server' id='spnOtherMemberBylaw' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="5" class="SeparatorHdg">Governing/Policy Board Vacancies</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<b>No. of Positions Vacant</b>
		</td>
		<td>
			<b>McCollum Attorneys<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<b>Other Attorneys<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<b>Client Members<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<b>Other Members<%=kDenoteRequiredField%></b>
		</td>
	</tr>	
	<tr>
		<td>
			<b>Less than 90 days<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<span runat='server' id='spnMcCollumAttyLess90' />
		</td>
		<td>
			<span runat='server' id='spnOtherAttyLess90' />
		</td>
		<td>
			<span runat='server' id='spnClientMemberLess90' />
		</td>
		<td>
			<span runat='server' id='spnOtherMemberLess90' />
		</td>
	</tr>
	<tr>
		<td>
			<b>90 days to 1 year<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<span runat='server' id='spnMcCollumAtty90Day1Yr' />
		</td>
		<td>
			<span runat='server' id='spnOtherAtty90Day1Yr' />
		</td>
		<td>
			<span runat='server' id='spnClientMember90Day1Yr' />
		</td>
		<td>
			<span runat='server' id='spnOtherMember90Day1Yr' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Greater than 1 year<%=kDenoteRequiredField%></b>
		</td>
		<td>
			<span runat='server' id='spnMcCollumAttyGreater1Yr' />
		</td>
		<td>
			<span runat='server' id='spnOtherAttyGreater1Yr' />
		</td>
		<td>
			<span runat='server' id='spnClientMemberGreater1Yr' />
		</td>
		<td>
			<span runat='server' id='spnOtherMemberGreater1Yr' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='5' align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnClose' />
		</td>
	</tr>
</table>	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='LscBoardStructure' DataObjectDefinitionKey='LscBoardStructure' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='OrganizationID' 
					DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='TimePeriodID' 
					DataObjectPropertyKey='TimePeriodID' />
				<Argument PropertyKey='LscBoardInfoSourceID' Value='1' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='OrganizationID' 
					DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='TimePeriodID' 
					DataObjectPropertyKey='TimePeriodID' />
				<Argument PropertyKey='LscBoardInfoSourceID' Value='1' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NewApplicantNoBylaws'>
					<Control ID='chkNewApplicantNoBylaws'
						Type='cCheckBox'
						Container='spnNewApplicantNoBylaws'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='McCollumAttyBylaw'>
					<Control ID='txtMcCollumAttyBylaw'
						Type='cMoneyTextBox'
						Container='spnMcCollumAttyBylaw' 
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherAttyBylaw'>
					<Control ID='txtOtherAttyBylaw'
						Type='cMoneyTextBox'
						Container='spnOtherAttyBylaw'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClientMemberBylaw'>
					<Control ID='txtClientMemberBylaw'
						Type='cMoneyTextBox'
						Container='spnClientMemberBylaw'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherMemberBylaw'>
					<Control ID='txtOtherMemberBylaw'
						Type='cMoneyTextBox'
						Container='spnOtherMemberBylaw'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='McCollumAttyLess90'>
					<Control ID='txtMcCollumAttyLess90'
						Type='cMoneyTextBox'
						Container='spnMcCollumAttyLess90'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherAttyLess90'>
					<Control ID='txtOtherAttyLess90'
						Type='cMoneyTextBox'
						Container='spnOtherAttyLess90'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClientMemberLess90'>
					<Control ID='txtClientMemberLess90'
						Type='cMoneyTextBox'
						Container='spnClientMemberLess90'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherMemberLess90'>
					<Control ID='txtOtherMemberLess90'
						Type='cMoneyTextBox'
						Container='spnOtherMemberLess90' 
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='McCollumAtty90Day1Yr'>
					<Control ID='txtMcCollumAtty90Day1Yr'
						Type='cMoneyTextBox'
						Container='spnMcCollumAtty90Day1Yr'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherAtty90Day1Yr'>
					<Control ID='txtOtherAtty90Day1Yr'
						Type='cMoneyTextBox'
						Container='spnOtherAtty90Day1Yr'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClientMember90Day1Yr'>
					<Control ID='txtClientMember90Day1Yr'
						Type='cMoneyTextBox'
						Container='spnClientMember90Day1Yr'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherMember90Day1Yr'>
					<Control ID='txtOtherMember90Day1Yr'
						Type='cMoneyTextBox'
						Container='spnOtherMember90Day1Yr'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='McCollumAttyGreater1Yr'>
					<Control ID='txtMcCollumAttyGreater1Yr'
						Type='cMoneyTextBox'
						Container='spnMcCollumAttyGreater1Yr'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherAttyGreater1Yr'>
					<Control ID='txtOtherAttyGreater1Yr'
						Type='cMoneyTextBox'
						Container='spnOtherAttyGreater1Yr' 
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ClientMemberGreater1Yr'>
					<Control ID='txtClientMemberGreater1Yr'
						Type='cMoneyTextBox'
						Container='spnClientMemberGreater1Yr'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherMemberGreater1Yr'>
					<Control ID='txtOtherMemberGreater1Yr'
						Type='cMoneyTextBox'
						Container='spnOtherMemberGreater1Yr'  
						DecimalErrorMessage='Form fields must be whole numbers.'
						RegExErrorMessage='Form fields must be whole numbers.'
						Size='3'
						MaxLength='10'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PolicyBoardStructure' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Image='Close'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PolicyBoardStructure' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

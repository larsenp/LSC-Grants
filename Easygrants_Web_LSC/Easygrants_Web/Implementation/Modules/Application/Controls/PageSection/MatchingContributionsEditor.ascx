<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="TableTop">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
 <span id='spnPageContent' runat='server' />
<br><br>

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td class="SeparatorHdg" colspan='3' ><b>Matching Contribution</b></td>
	</tr>
	<tr>
	    <td colspan='3'>&nbsp;</td>
	</tr>    
	<tr>
		<td width='23%'><b>Matching Contribution Amount</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%' align="right">$</td>		
		<td><span runat='server' id='spnContributionAmount' /></td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td class="FieldLabel">Enter numbers only, no dollar signs, decimals, US currency value only. Example: 10,000</td>
	</tr>
	<tr>
		<td width='23%'><b>Matching Contribution Type</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%'></td>		
		<td><span runat='server' id='spnContributionType' /></td>
	</tr>
	<tr>
		<td width='23%'><b>Matching Contribution Source</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%'></td>	
		<td><span runat='server' id='spnContributionSource' /></td>
	</tr>	
	<tr>
		<td colspan="2"></td>
		<td class="FieldLabel">Enter the name of the person or <%=GetLabel("Organization")%> providing the matching contribution.</td>
	</tr>
	<tr>
		<td width='23%'><b>Matching Contribution Source Type</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%'></td>		
		<td><span runat='server' id='spnContributionSourceType' /></td>
	</tr>
	<tr>
		<td width='23%'><b>Matching Contribution Status</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%'></td>		
		<td><span runat='server' id='spnContributionStatus' /></td>
	</tr>
	<tr>
		<td width='23%' valign="Top"><b>Matching Contribution Description/Notes</b>&nbsp;<%=kDenoteRequiredField%><br></td>
		<td width='2%'></td>		
		<td><span runat='server' id='spnContributionDescription' /></td>
	</tr>
	<tr>
		<td width='23%' valign="Top"></td>
		<td width='2%'></td>		
		<td class="FieldLabel">Limit to 200 characters (including spaces).</td>
	</tr>
	
</table>

<br/>			
<table id="Table2" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
				




<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProjectMatchingContribution' DataObjectDefinitionKey='GranteeProjectMatchingContribution' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectMatchingContributionID' PropertyKey='ProjectMatchingContributionID' Value='' Bool=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool='AND'/>
			</Filters>
			<DefaultValues>
			    <Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='ContributionAmount'>
					<Control ID='ctlContributionAmount'
						Container='spnContributionAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0'
						Size='20'
						MaxInputDecimalPlaces='0'
						RegExErrorMessage='Enter a whole number for the Matching Contribution Amount, without decimals or dollar signs; US currency value only. Example: 10,000'
						DecimalErrorMessage='Enter a whole number for the Matching Contribution Amount, without decimals or dollar signs; US currency value only. Example: 10,000'
						CommaErrorMessage='Enter a whole number for the Matching Contribution Amount, without decimals or dollar signs; US currency value only. Example: 10,000'
						RequiredField='True'
						ErrorMessage='Amount is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContributionTypeID'>
					<Control ID='ctlContributionType' 
						Container='spnContributionType'
						Type='cDropDown'
						DataObjectDefinitionKey='MatchingContributionType'
						StoredValue='MatchingContributionTypeID'
						DisplayValue='Abbr'
						RequiredField='True'
						ErrorMessage='Type is required.'
						DisplayText='Select'>
					    <Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContributionSource'>
					<Control ID='ctlContributionSource' 
						Type='cTextBox' 
						Container='spnContributionSource' 
						Size='50' 
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='Source is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContributionSourceTypeID'>
					<Control ID='ctlContributionSourceType' 
						Container='spnContributionSourceType'
						Type='cDropDown'
						DataObjectDefinitionKey='MatchingContributionSourceType'
						StoredValue='MatchingContributionSourceTypeID'
						DisplayValue='Abbr'
						RequiredField='True'
						ErrorMessage='Source Type is required.'
						DisplayText='Select'>
					    <Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContributionStatusID'>
					<Control ID='ctlContributionStatus' 
						Container='spnContributionStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='MatchingContributionStatus'
						StoredValue='MatchingContributionStatusID'
						DisplayValue='Abbr'
						RequiredField='True'
						ErrorMessage='Status is required.'
						DisplayText='Select'>
					    <Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContributionDescription'>
					<Control ID='ctlContributionDescription'
						Container='spnContributionDescription'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='250'
						RequiredField='True'
						ErrorMessage='Description/Notes is required.'/>
				</DisplayProperty>	
		   </DisplayProperties>
		</DataObject>
			
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>		
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>							
							        <Argument AttributeName='PageKey' Value='MatchingContributionsEditor'/>
									<Argument Type='' TypeKey='ProjectMatchingContributionID' AttributeName='ProjectMatchingContributionID' BaseValue='ProjectMatchingContributionID='/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProjectMatchingContribution' DataObjectPropertyKey='ProjectMatchingContributionID' PropertyKey='ProjectMatchingContributionID' BaseValue='ProjectMatchingContributionID='/>
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>							    					
						</Action>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				 <DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='MatchingContributions'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>			
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>



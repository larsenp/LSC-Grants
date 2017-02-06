<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectAbstractRenewal.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cProjectAbstractRenewal" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Abstract and Start Date</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td colspan="4">
			Enter the abstract of your proposed research.  Please limit your 
			abstract to 500 words or less.
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Abstract&nbsp;<font color='red'>*</font></b>&nbsp;&nbsp;&nbsp;
		</td>
		<td  colspan="3">
			<span id='spnProjectAbstract' runat='server'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td colspan="3">
		(Spell out scientific notation and other symbols (e.g., Beta).  
		Scientific notation is not supported in this field.)
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Projected Start Date&nbsp;<font color='red'>*</font></b>
			&nbsp;&nbsp;&nbsp;
		</td>	
		<td  colspan="3">
			<span id='spnProjectedStartDate' runat='server'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td colspan="3">(MM/DD/YYYY)</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>

	<tr id='trSaveAndCancel' visible='true'>
		<td align="center">
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser'
					TypeKey='GranteeProjectID' 
					PropertyKey='AppGranteeProjectID'
					Value=''
					Bool=''/>
			</Filters>
			<DisplayProperties/>
		</DataObject>	
		
		<DataObject Key='GranteeProjectWHCF' DataObjectDefinitionKey='GranteeProjectWHCF' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProjectAbstract'>
					<Control ID='ctlProjectAbstract'
						Container='spnProjectAbstract'
						Type='cTextArea'
						Rows='10'
						Cols='50'
						MaxLength='5000'
						RequiredField='True'
						ErrorMessage='Abstract is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,5000}$' ErrorMessage='Limit your Project Abstract to 5000 characters (500 words) or less.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectedStartDate'>
					<Control ID='ctlProjectedStartDate'
						Container='spnProjectedStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='10'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Projected Start Date is required.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'	AutoSave='True'/>
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

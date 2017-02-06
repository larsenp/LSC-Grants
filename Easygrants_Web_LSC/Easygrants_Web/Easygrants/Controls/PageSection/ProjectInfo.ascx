<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cProjectInfo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td colspan="4" class="SeparatorHdg"><b>Project Details</b></td></tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
<!-- Control Label (for Project information) -->
	<tr>
		<td	valign="top" width='200'><b><%=GetLabel("ProjectTitle")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnFullTitle' runat='server'/></td>
	</tr>
	<tr>		
		<td>&nbsp;</td>
		<td  class="FieldLabel" >Limit: 300 characters</td>	
	</tr>
	<tr>
		<td	valign="top" width='200'><b>Brief Project Description</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnDescription' runat='server'/></td>
	</tr>
	<tr>
		<td	valign="top" ><b>Project Start Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnDurationStart' runat='server'/></td>
	</tr>
	<tr>		
		<td>&nbsp;</td>
		<td class="FieldLabel">(mm/dd/yyyy)</td>	
	</tr>
	<tr>
		<td	valign="top" ><b>Project End Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnDurationEnd' runat='server' /></td>
	</tr>
	<tr>		
		<td>&nbsp;</td>
		<td class="FieldLabel">(mm/dd/yyyy)</td>	
	</tr>	
	<tr>
		<td	valign="top" ><b>Total Requested Amount</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnDollarRequest' runat='server'/></td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1b">
	<tr><td class="SeparatorHdg"><b>Project Subject and Focus Area(s)</b></td></tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1c">
	<tr>
		<td><b>Subject Area </b></td>
		<td><span id='spnSubjectArea' runat='server'/>
		    <asp:CustomValidator  id='valSubjectArea' runat='server' OnServerValidate='ValidatevalSubjectArea' Display='None'
				ErrorMessage='Subject Area has been selected as other. Enter the Other subject area in the provided field.'/>
		</td>
	</tr>
	<tr>
		<td><b>Other </b></td>
		<td><span id='spnOther' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>If other, enter the subject area.</td>
	</tr>	
	<tr>
	    <td colspan='2'><b>Focus Area(s) </b></td>
	</tr>
	<tr>
		<td colspan='2'><span id='spnResearchAreas' runat='server'/>
		    <asp:CustomValidator  id='valResearchAreas' runat='server' OnServerValidate='ValidatevalResearchAreas' Display='None'
				ErrorMessage='Focus Area has been selected as other. Enter the Other Focus Area in the provided field.'/>
		</td>
	</tr>
	<tr>
		<td><b>Other </b></td>
		<td><span id='spnResearchOther' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>If other, enter the Focus Area.</td>
	</tr>	
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser'  TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'  Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantTitle'>					
					<Control ID='ctlFullTitle' Container='spnFullTitle' Type='cTextBox' Size='75'
					 MaxLength='300' RequiredField='True'
						ErrorMessage='Project Title is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='GranteeProjectResearchArea'>
					<Control ID='CtlResearchAreas'
						Container='spnResearchAreas'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='ResearchArea'
						DisplayValue='Description'
						StoredValue='ResearchAreaID'
						StoredDisplayValue='ResearchArea.Description' 
						Height='15' Sort='True'
						DisplayNone='False' DisplayMoveAll='True'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='OtherResearchArea'>
					<Control ID='ctlResearchOther' Container='spnResearchOther' Type='cTextBox' Size='45' MaxLength='50'></Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser'  TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'  Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription' Container='spnDescription' Type='cTextArea'
						Rows='9' Cols='50' MaxLength='2000'
						TooLongMessage='Limit your Brief Description to 100 words.'
						RequiredField='True'
						ErrorMessage='Brief Project Description is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DurationStart'>
					<Control ID='ctlDurationStart'
						Container='spnDurationStart'
						Type='cDateTextBox'
						DateFormat='MM/dd/yyyy'
						Calendar='True'
						Size='25'
						MaxLength='25'
						RequiredField='True'
						ErrorMessage='Project Start Date is required.'
						NotSupportedDateErrorMessage='Enter a valid Project Start Date.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DurationEnd'>
					<Control ID='ctlDurationEnd'
						Container='spnDurationEnd'
						Type='cDateTextBox'
						DateFormat='MM/dd/yyyy'
						Calendar='True'
						Size='25'
						MaxLength='25'
						RequiredField='True'
						ErrorMessage='Project End Date is required.'
						NotSupportedDateErrorMessage='Enter a valid Project End Date.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DollarRequest'>
					<Control ID='ctlDollarRequest'
						Container='spnDollarRequest'
						Type='cTextBox'
						Size='10'
						MaxLength='12'
						RequiredField='True'
						ErrorMessage='Enter the Grant Request Amount.'>
						<Validation Type='RegularExpression' ValidationExpression='^[+]?\d*$' ErrorMessage='Enter a valid Grant Request Amount. Do not use decimals or commas.' />
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectResearchCategory' DataObjectDefinitionKey='GranteeProjectResearchCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser'  TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'  Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
		    <DisplayProperties>	
    			    <DisplayProperty PropertyKey='ResearchCategoryID'>
					    <Control ID='CtlSubjectArea' Container='spnSubjectArea' Type='cDropDown'
						   DataObjectDefinitionKey='ResearchCategory' DisplayValue='Description'
						   StoredValue='ResearchCategoryID' StoredDisplayValue='ResearchCategory.Description'
						   DisplayNone='False' DisplayText='Select'>
						    <Sort> 
						        <Argument PropertyKey='Description'/>
						    </Sort>
					    </Control>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='OtherResearchCategory'>
					<Control ID='ctlOther' Container='spnOther' Type='cTextBox' Size='45' MaxLength='50'></Control>
				    </DisplayProperty>
			</DisplayProperties>
	    </DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

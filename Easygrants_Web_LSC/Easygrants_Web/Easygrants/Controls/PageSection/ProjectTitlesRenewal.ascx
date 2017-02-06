<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectTitlesRenewal.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cProjectTitlesRenewal" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Title</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td>
			<b><%=GetLabel("ProjectTitle")%>&nbsp;<font color='red'>*</font></b>&nbsp;&nbsp;&nbsp;
		</td>	
		<td  colspan="3">
			<span id='spnFullTitle' runat='server'/>
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
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='AppGranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantTitle'>					
					<Control ID='ctlFullTitle'
						Container='spnFullTitle'
						Type='cTextBox'
						Size='75'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Title is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,200}$' ErrorMessage='Limit your Full Title to 200 characters (20 words) or less.'/>
					</Control>
				</DisplayProperty>	
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
						<Action PostBack='True'	AutoSave='False'/>
					</Control>
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		<!--
		<DataObject Key='GranteeProjectWHCF' DataObjectDefinitionKey='GranteeProjectWHCF' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProjectedStartDate'>
					<Control ID='ctlProjectedStartDate'
						Container='spnProjectedStartDate'
						Type='cDateTextBox'
						DateFormat='MM/dd/yyyy'
						Size='15'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='You must enter a Projected Start Date.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		-->
	</ModuleSection>
</span>
<!-- End Embedded XML -->

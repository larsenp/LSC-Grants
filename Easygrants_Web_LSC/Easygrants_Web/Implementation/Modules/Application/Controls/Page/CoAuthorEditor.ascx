<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Control Language="vb" AutoEventWireup="true" Codebehind="CoAuthorEditor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cCoAuthorEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<Easygrants:ValSumm id='ctlValSumm' runat='server' />
<br>
<!-- Page Content - Top Of Page -->
Please complete all required information for the Additional Contact 
information. All fields marked with an asterisk (<font color="red">*</font>) 
are required. 
<!-- Dashed list changed to a bulleted list by Basil Eliopoulos June 23, 2005 8:07 p.m. per QA task -->
<ul>
	<li>
		Click <b>Save</b>
	to save the information.
	<li>
		Click <b>Close</b> to close the Co-Authors Editor page without saving.</li>
</ul>
<p>
	<!-- Page Content - Controls -->
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
		<tr>
			<td colspan="4" class="SeparatorHdg"><b>Co-Authors Contact Information</b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<table border='0' cellspacing='0' cellpadding='0' runat='server'>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td valign="top" width="120"><b>Name</b></td>
			<td><span id='spnPrefix' runat='server' /></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<table border='0' cellspacing='0' cellpadding='0'>
					<tr>
						<td><span id='spnFirst' runat='server' /></td>
						<td><span id='spnMiddle' runat='server' /></td>
						<td><span id='spnLast' runat='server' /></td>
					</tr>
					<tr>
						<td>First&nbsp;<font color='red'>*</font></td>
						<td>Middle</td>
						<td>Last&nbsp;<font color='red'>*</font></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" align='center'>
				<span runat='server' id='spnSave' /><span runat='server' id='spnCancel' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<!-- Embedded XML Page Functionality - please do not edit -->
	<span id='spnConfigXML' visible='false' runat='server'>
		<ModuleSection>
			<DataObject Key='GranteeProjectCoAuthor' DataObjectDefinitionKey='GranteeProjectCoAuthor' Updatable='True'
				CreateNew='True'>
				<Filters>
					<Argument Type='QueryString' TypeKey='GranteeProjectCoAuthorID' PropertyKey='GranteeProjectCoAuthorID'
						Value='' Bool='' />
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				</Filters>
				<DefaultValues>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				</DefaultValues>
				<DisplayProperties>
					<DisplayProperty PropertyKey='FirstName'>
						<Control ID='ctlFirst' Container='spnFirst' Type='cTextBox' Size='25' MaxLength='50' RequiredField='True'
							ErrorMessage='First Name is required.'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey='MiddleName'>
						<Control ID='ctlMiddle' Container='spnMiddle' Type='cTextBox' Size='15' MaxLength='50'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey='LastName'>
						<Control ID='ctlLast' Container='spnLast' Type='cTextBox' Size='25' MaxLength='50' RequiredField='True'
							ErrorMessage='Last Name is required.'></Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save'>
							<Action PostBack='True' AutoSave='True' Object='EventController' Method='EventController_NavigateToURL'>
								<Parameters>
									<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
								<Parameters>
									<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
				</DisplayProperties>
			</DataObject>
		</ModuleSection>
	</span>
	<!-- End Embedded XML --></p>

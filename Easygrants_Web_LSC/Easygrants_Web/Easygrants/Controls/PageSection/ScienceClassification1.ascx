<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cEGDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<asp:RequiredFieldValidator
		runat='server'
		id='valScience1'
		ControlToValidate='ctlGranteeProjectScience1'
		Display='None'
		ErrorMessage='Select at least one Science Classification (1).'/>
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnGranteeProjectScience1'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectScience1'>
					<Control ID='ctlGranteeProjectScience1'
						Container='spnGranteeProjectScience1'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='Science'
						DisplayValue='Description'
						StoredValue='ScienceID'
						StoredDisplayValue='Science.Description' 
						Height='9'
						MaxSelected='6'
						TooManyMessage='You can only choose up to six Sub-Classifications.'
						DisplayNone='False'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
						</DefaultValues>
						<Filters>
							<Argument Type='QueryString' 
								TypeKey='Class1'
								PropertyKey='ClassID' 
								Value='' 
								bool=''>
							</Argument>
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>

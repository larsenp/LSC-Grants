<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cEGDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Control Label (for Name information) -->
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Contact</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>	
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td	valign="top" width="120"><b>Name</b></td>
		<td>
			<span id='spnPrefix' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
		</td>
		<td>Prefix</td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnFirst' runat='server'/>
		</td>
		<td>
			<span id='spnMiddle' runat='server'/>
		</td>	
		<td>
			<span id='spnLast' runat='server'/>
		</td> 	
	</tr>
	<tr>
		<td></td>	
		<td>
			First&nbsp;<%=kDenoteRequiredField%>
		</td>	
		<td>Middle</td>
		<td>
			Last&nbsp;<%=kDenoteRequiredField%>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnSuffix' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Suffix</td>	
	</tr>
	<tr>
		<td></td>
		<td>
			<span id='spnDegree' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>Degrees</td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Primary E-mail:&nbsp;&nbsp;</b></td>
		<td colspan=3>
			<span id='spnPersonPrimaryEmail' runat='server'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Web Address:&nbsp;&nbsp;</b></td>
		<td colspan=3>
			<span id='spnWebAddr' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/> 
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<!--	Key: index into cDataPresenter.mDataObjHash
				DataObjectDefinitionKey: index into DataDefinition.xml
		-->
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayValue='Prefix'>
							<Sort>
	                            <Argument PropertyKey='SortOrder'/>
                            </Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='75'
						RequiredField='True'
						ErrorMessage='First Name is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='MiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
						MaxLength='75'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='25'
						MaxLength='75'
						RequiredField='True'
						ErrorMessage='Last Name is required.'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='SuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayValue='Suffix'>
						<Sort>
	                            <Argument PropertyKey='SortOrder'/>
                        </Sort>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Degree'>
					<Control ID='ctlDegree'
						Container='spnDegree'
						Type='cTextBox'
						Size='30'
						MaxLength='50'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1'>
					<Control ID='spnPersonPrimaryEmail'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WebAddr'>
					<Control ID='ctlWebAddr'
						Container='spnWebAddr'
						Type='cTextBox'
						Size='50'
						MaxLength='100'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
	</ModuleSection>
</span>
<!-- End Embedded XML -->

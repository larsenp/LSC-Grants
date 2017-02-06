<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.PageSection.cContactDetails" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"  EnableViewState="false" %>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td colspan="4" align="Center" class="SeparatorHdg"><b>Easygrants Manager</b></td>
	</tr>
	<tr>
		<td colspan="4" align="Center" class="SeparatorHdg"><b>Matching Person Contact Details</b></td>
	</tr>	
</table>
<br>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Summary</b></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'>
			<b>Name</b>
		</td>
		<td width='35%'>
			<span id='spnPersonName' runat='server'/>
		</td>
		<td width='5%'>&nbsp;</td>
		<td width='10%'>
			<b>Address</b>
		</td>
		<td width='20%'>
			<span id='spnAddress' runat='server'/>
		</td>
		<td>
		    <font color='red'><b><span id="spnDoNotContact" runat='server' /></b></font>
		</td>
	</tr>
	<tr valign='top'>
		<td>
			<b>Primary <%=GetLabel("Organization")%></b>
		</td>
		<td>
			<span id='spnOrgLink' runat='server'/>
		</td>
		<td>&nbsp;</td>
		<td >&nbsp;</td>
		<td>
			<span id='spnCityStateZip' runat='server'/>
		</td>
		<td>
		    <font color='red'><b><span id="spnDeceased" runat='server' /></b></font>
		</td>
	</tr>
	<tr>
		<td>
			<b>Title</b>
		</td>
		<td>
			<span id='spnTitle' runat='server'/>
		</td>
		<td>&nbsp;</td>
		<td >&nbsp;</td>
		<td>
			<span id='spnCountry' runat='server'/>
		</td>
		<td>
		    &nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<b>E-mail</b>
		</td>
		<td>
			<span id='spnEmail' runat='server'/>
		</td>
		<td >&nbsp;</td>
		<td >
			<b>Web Address</b>
		</td>
		<td>
			<span id='spnURL' runat='server'/>
		</td>
		<td>
		    &nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<b>Primary Phone</b>
		</td>
		<td colspan='4'>
			<span id='spnPhone' runat='server'/>
		</td>
		<td>
		    &nbsp;
		</td>
	</tr>
</table>
<br/>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr valign='top'>
		<td width='15%'><b>Created on</b></td>
		<td width='15%'><span id="spnCreateDate" runat='server'/></td>
		<td width='10%'><b>Modified on</b></td>
		<td width='15%'><span id="spnChangeDate" runat='server'/></td>
		<td width='10%'><b>Modified by</b></td>
		<td><span id="spnModifiedBy" runat='server'/></td>
	</tr>
</table>
<br>


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table3">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Affiliated <%=GetLabel("Organization")%>s</b></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table5">
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<br>


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>E-mail Address</b></td>
	</tr>	
</table> 
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td ><span runat='server' id='spnDataListEmail'></span>	
		</td>
	</tr>
</table>

<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Telephone/Fax</b></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td >
			<span runat='server' id='spnDataListPhone'></span>	
		</td>
	</tr>
</table>
<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Address</b></td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataListAddress' visible='true'></span>
		</td>
	</tr>
</table>

<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Web Address</b></td>
	</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataListWebAddress'></span>
		</td>
	</tr>
</table>

<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Category Affiliation</b></td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td ><span runat='server' id='spnDataListCategory'></span>	
		</td>
	</tr>
</table>

<br>
<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td align='center'><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<!-- End Embedded XML -->
	<ModuleSection>
		
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value='' bool=''/>
			</Filters>
			<DefaultValues />
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPersonName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnOrgLink'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Title'>
					<Control ID='ctlTitle'
						Container='spnTitle'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreateDate' Format='M/d/yyyy'>
					<Control ID='spnCreateDate'
						Type='HtmlGenericControl'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='M/d/yyyy'>
					<Control ID='spnChangeDate'
						Type='HtmlGenericControl'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.FirstNameLastName'>
					<Control ID='spnModifiedBy'
						Type='HtmlGenericControl'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Email' DataObjectDefinitionKey='Email' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ContactValue1'>
					<Control ID='spnEmail'
						Type='HtmlGenericControl'/>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Phone' DataObjectDefinitionKey='Phone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument PropertyKey='IsPrimary' Value='True'/>
			</Filters>
		</DataObject>
		<DataObject Key='vFormattedPhone' DataObjectDefinitionKey='vFormattedPhone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Phone' DataObjectPropertyKey='PhoneID' PropertyKey='PhoneID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='ctlPhone'
						Container='spnPhone'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WebAddress' DataObjectDefinitionKey='WebAddress' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WebAddress'>
					<Control ID='spnURL'
						Type='HtmlGenericControl'/>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Address' DataObjectDefinitionKey='Address' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
				<Argument PropertyKey='IsPrimary' Value='True'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='ctlAddress'
						Container='spnAddress'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='CityStateZip'>
					<Control ID='ctlCityStateZip'
						Container='spnCityStateZip'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Country' DataObjectDefinitionKey='Country' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Address' DataObjectPropertyKey='CountryID' PropertyKey='CountryID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CountryDesc'>
					<Control ID='ctlCountry'
						Container='spnCountry'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ContactPOAList' DataObjectDefinitionKey='PersonOrganizationAffiliation'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID' 
					PropertyKey='PersonID' 
					Value='' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>							
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='PersonOrganizationAffiliation'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary' Width='10%'/>
						<DisplayProperty PropertyKey='Type.Description' ColumnHeader='Type' Width='20%'/>
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='20%' />
						<DisplayProperty PropertyKey='Title' ColumnHeader='Job Title'  Width='30%'/>
						<DisplayProperty PropertyKey='AffiliationDescription' ColumnHeader='Affiliation Description' Width='20%'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ListEmail' DataObjectDefinitionKey='Email'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataListEmail'
						Container='spnDataListEmail'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Email'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary' Width='20%'/>
						<DisplayProperty PropertyKey='EmailType.TypeName' ColumnHeader='Type'  Width='30%'/>
						<DisplayProperty PropertyKey='ContactValue1' ColumnHeader='E-mail Address'  Width='50%'>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ListPhone' DataObjectDefinitionKey='Phone'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataListPhone'
						Container='spnDataListPhone'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Phone'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary'  Width='20%'/>
						<DisplayProperty PropertyKey='PhoneType.TypeName' ColumnHeader='Type'  Width='30%'/>
						<DisplayProperty PropertyKey='vFormattedPhone.PhoneNumber' ColumnHeader='Number'  Width='50%'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ListAddress' DataObjectDefinitionKey='Address'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataListAddress'
						Container='spnDataListAddress'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Address'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary'  Width='10%'/>
						<DisplayProperty PropertyKey='AddressType.AddressAbbr' ColumnHeader='Type' Width='15%'/>
						<DisplayProperty PropertyKey='Address1' ColumnHeader='Address' Width='20%'/>
						<DisplayProperty PropertyKey='City' Width='15%'/>
						<DisplayProperty PropertyKey='State.StateAbbr' ColumnHeader='State' Width='15%'/>
						<DisplayProperty PropertyKey='Zip' ColumnHeader='Zip' Width='10%'/>
						<DisplayProperty PropertyKey='Country.CountryDesc' ColumnHeader='Country' Width='15%'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ListWebAddress' DataObjectDefinitionKey='WebAddress'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='EntityTypeID' Value='1'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataListWebAddress' 
						Container='spnDataListWebAddress' 
						Type='cDataListCtl' 
						DataObjectDefinitionKey='WebAddress'
						SeparatorWidth='2' 
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary' Width='20%' />
						<DisplayProperty PropertyKey='WebAddressType.TypeName' ColumnHeader='Type' Width='30%'/>
						<DisplayProperty PropertyKey='WebAddress' ColumnHeader='Web Site Address' Width='50%'>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ListCategory' DataObjectDefinitionKey='ContactCategoryMember'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='EntityID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Title'>	
					<RelatedProperty PropertyKey='ContactCategory'/>
				</Argument>
			</Sort>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataListCategory'
						Container='spnDataListCategory'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ContactCategoryMember'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='ContactCategory.Title' ColumnHeader='Category' Width='50%'/>
						<DisplayProperty PropertyKey='ContactCategory.Description' ColumnHeader='Description' Width='50%'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

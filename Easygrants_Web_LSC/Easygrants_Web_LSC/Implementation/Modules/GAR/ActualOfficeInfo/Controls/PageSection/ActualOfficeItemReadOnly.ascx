<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ActualOfficeInfo.Controls.PageSection.cActualOfficeEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='500'>
	<tr>
		<td width='250'>
			<b>Office #<span runat='server' id='spnOffID' /></b>
		</td>
	</tr>
	<tr>
		<td>
			Office Name&nbsp;
		</td>
		<td>
			<span runat="server" id='spnOffName' />
		</td>
	</tr>
	<tr>
		<td width='250'>
			Office Address
		</td>
		<td>
			<span runat="server" id='spnAddr1Off' />
		</td>
	</tr>
	<tr>
		<td>
			&nbsp;
		</td>
		<td>
			<span runat="server" id='spnAddr2Off' />
		</td>
	</tr>
	<tr>
		<td>
			&nbsp;
		</td>
		<td>
			<span runat="server" id='spnCityOff' />, 
			<span runat="server" id='spnStateProvinceIDOff' />&nbsp;&nbsp;
			<span runat="server" id='spnZipOff' />
		</td>
	</tr>
	<tr>
		<td>
			Person in Charge
		</td>
		<td>
			<span runat="server" id='spnPersonInCharge' />
		</td>
	</tr>
	<tr>
		<td>
			E-mail Address
		</td>
		<td>
			<span runat="server" id='spnEmail' />
		</td>
	</tr>
	<tr>
		<td>
			Telephone Number
		</td>
		<td>
			<span runat="server" id='spnPhone' />
		</td>
	</tr>
	<tr>
		<td>
			Fax Number 
		</td>
		<td>
			<span runat="server" id='spnFax' />
		</td>
	</tr>
	<tr>
		<td>
			Regular Full Time Work Week (hours)
		</td>
		<td>
			<span runat="server" id='spnWorkWeek' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;
			<span runat='server' id='spnClose' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='OfficeType' DataObjectDefinitionKey='OfficeType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='OffTypeID' PropertyKey='OfficeTypeID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnOfficeType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscOffice' Key='LscOffice' DataObjectDefinitionKey='LscOffice' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OffName'>
					<Control ID='spnOffName'
						Type='HtmlGenericControl'
						Container='spnOffName'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='OffID'>
					<Control ID='spnOffID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Addr1Off'>
					<Control ID='spnAddr1Off'
						Type='HtmlGenericControl'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='Addr2Off'>
					<Control ID='spnAddr2Off'
						Type='HtmlGenericControl'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='CityOff'>
					<Control ID='spnCityOff'
						Type='HtmlGenericControl'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='StateProvinceOff.StateAbbr'>
					<Control ID='spnStateProvinceIDOff'
						Type='HtmlGenericControl'
						Container='spnStateProvinceIDOff'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ZipOff'>
					<Control ID='spnZipOff'
						Type='HtmlGenericControl'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='PersonInCharge'>
					<Control ID='spnPersonInCharge'
						Type='HtmlGenericControl'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='Email'>
					<Control ID='spnEmail'
						Type='HtmlGenericControl'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='Phone'>
					<Control ID='spnPhone'
						Type='HtmlGenericControl'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='Fax'>
					<Control ID='spnFax'
						Type='HtmlGenericControl'/>
					</DisplayProperty>
				<DisplayProperty PropertyKey='WorkWeek'>
					<Control ID='spnWorkWeek'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>

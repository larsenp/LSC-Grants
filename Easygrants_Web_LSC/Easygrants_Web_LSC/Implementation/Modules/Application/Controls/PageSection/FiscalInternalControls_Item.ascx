<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table style="width:600px">
	<tr>
		<td style='width:250px'>
			<span runat='server' id='spnLscFiscalInternalCtlArea'/>
		</td>
		<td style='width:100px'>
			<span runat='server' id='spnIsInstituted'/>
		</td>
	</tr>
</table>




<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscFiscalIntCtlsInstituted' Key='LscFiscalIntCtlsInstituted' DataObjectDefinitionKey='LscFiscalIntCtlsInstituted' Updatable='True' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscFiscalInternalCtlAreaLKP.Description'>
					<Control ID='spnLscFiscalInternalCtlArea'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsInstituted'>
					<Control ID='rdoIsInstituted'
						Container='spnIsInstituted'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

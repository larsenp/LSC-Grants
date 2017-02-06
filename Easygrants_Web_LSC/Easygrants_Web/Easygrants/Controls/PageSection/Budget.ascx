<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Budget</b></td>
	</tr>
	<tr>
		<td>
			Budget Information:<br>
			
		</td>
	</tr>
	<tr>
		<td><span runat='server' id='ctlDescription'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='BudgetID' 
					PropertyKey='BudgetID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>																		
			</DisplayProperties>																		
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	
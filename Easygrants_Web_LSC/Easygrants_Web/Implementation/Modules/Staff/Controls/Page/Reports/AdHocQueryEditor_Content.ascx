<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Reports.cAdHocQueryEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="False" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>
<BR>
<P>
	Use the Query Editor to build a new query or modify a saved query. For help using the Query Editor, click <b>Help</b> in the left navigation. To return to the Query/Report List page, click <b>Close</b>
	at the bottom of the page.
</P>


<table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Step 1:  Field Group
		</td>
	</tr>
	
	<tr>
		<td>
		You selected <b><span id='spnCategory' runat='server'/></b> as the Query Field Group. 
	For a list of fields in each group, click <b><span id='spnHelp' runat='server'/></b>
		 If you wish to work with a different field group, click <b>Close</b> to return to the main Queries page, where you can create a new query with the desired field group. 
		</td>
	</tr>
</table>
<br>

<table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Step 2:  Select Fields
		</td>
	</tr>
	<tr>
		<td>
			Select at least one field from the list below. Order the fields in the way you wish to view them. To return query results without duplicate information, check
			<b>Exclude Duplicate Rows</b>. <span id='spnMoreDistinct' runat='server'/>
		</td>
	</tr>
</table>
<br>
<table runat='server' width='100%'>
<tr><td>
Field Group:&nbsp;&nbsp;<b><span id='spnCategorySelected' runat='server'/></b></td>
<td><asp:CheckBox runat='server' id='chkDistinct'/>&nbsp;
Exclude duplicate rows
<asp:CustomValidator
	runat='server'
	id='valCusDistinctSort'
	Display='None'
	OnServerValidate='ValidateDistinctSort'
	ErrorMessage='When using the "Exclude duplicate rows" option, you may only sort by fields that appear in the "Select Fields" list.'/>
	</td></tr>

	</table><br><br>
<!-- contained in span below -->
<span runat='server' id='spnSelect' visible='false'>
	<Core:cUserCtlLoader CtlID='ctlSelect' 
		Type='cDoubleListBox'
		Properties='Size=10'
		runat='server'/>
	<asp:RequiredFieldValidator
		runat='server'
		id='valReqSelect'
		ControlToValidate='ctlSelect'
		Display='None'
		ErrorMessage='Designate at least one Select Field before running a query.'/></span>
	<br><br>

<table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Step 3: Group Query Results
		</td>
	</tr>
	<tr>
		<td>
			If you would like to group your query results by a particular field, select from the following drop-down list and click on the <b>Add</b> button. (This step is optional.)
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlGroupFields' 
				Type='cDropDown'
				runat='server'/>
			<Core:cUserCtlLoader id='ctlGroupLoader' CtlID='btnAddGroup'
				Src='Core/Controls/Base/CSSButton.ascx'
				Properties='Caption=Add&CausesValidation=False'
				runat='server'/>
		</td>
	</tr>
</table><br><br>

<table runat='server' width='50%' id='tabGroupBy'>
	
</table>

<table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Step 4: Sort Query Results
		</td>
	</tr>
	<tr>
		<td>
			To sort the data in the query result output, select a field in the Available list box. Data 
			will be sorted in ascending order starting with the first field in the Selected list. To change 
			the sort field order, click on a field name in the Selected list box and then click on either 
			the <b>Up</b> or <b>Down</b> button.
		</td>
	</tr>
</table>
<br>

<!-- contained in span below -->
	<Core:cUserCtlLoader Container='spnSort' ContainerIndex='0' CtlID='ctlSort' 
		Type='cDoubleListBox'
		Properties='Size=10'
		runat='server'/>
<span runat='server' id='spnSort' visible='false'>
	<br><br>
</span>

<table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			<a name='Filters'/>
			Step 5: Narrow Query Results with Filters
		</td>
	</tr>
	<tr>
		<td>
		Filters allow you to narrow your query results by creating conditions.  Specify your conditions and click <b>Add</b> to apply a filter to your query. Click <b>Edit</b> button to modify a filter. Click <b>Delete</b> to remove a filter from the query.
		</td>
	</tr>
	<tr>
			<td>
				<a href="../../../Implementation/Modules/Staff/Controls/Page/Reports/FilterPopUp_Content.aspx" target="_blank">
					More on filters...</a>
			</td>
		</tr>
</table>
<br>

<span runat='server' id='spnFilters' visible='false'>
	<table runat='server' width='100%'>
		<tr>
			<td >
				Boolean
			</td>
			<td >
				Field
			</td>
			<td >
				Operator
			</td>
			<td >
				Value
			</td>
		</tr>
		<tr>
			<td>
				<asp:DropDownList runat='server' id='ctlBoolean'/>
			</td>
			<td>
				<asp:DropDownList runat='server' id='ctlField'/>
			</td>
			<td>
				<asp:DropDownList runat='server' id='ctlOperator'/>
			</td>
			<td>
				<asp:TextBox runat='server' id='txtValue'/>
				<asp:RequiredFieldValidator
					runat='server'
					id='valReqValue'
					ControlToValidate='txtValue'
					ErrorMessage='Specify a value before adding a filter.'
					Display='None'/>
			</td>
			<td>
				<Core:cUserCtlLoader id='ctlLoader' CtlID='btnAddFilter' 
					Src='Core/Controls/Base/CSSButton.ascx'
					Properties='Caption=Add&CausesValidation=False'
					runat='server'/>
				<Core:cUserCtlLoader id='ctlSaveFilterLoader' CtlID='btnSaveFilter' 
					Src='Core/Controls/Base/CSSButton.ascx'
					Properties='Caption=Save&CausesValidation=False'
					runat='server'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
	</table>
	<table runat='server' width='100%' id='tabFilters'>
		<tr class='ModuleHdg'>
			<td>
				<b>Boolean</b>
			</td>
			<td>
				<b>Field</b>
			</td>
			<td>
				<b>Operator</b>
			</td>
			<td>
				<b>Value</b>
			</td>
			<td colspan='2'>
				&nbsp;
			</td>
		</tr>
	</table>
	<br><br>
</span>

<table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Finish: Query Results
		</td>
	</tr>
	<tr>
		<td>
			You can view or export your query results now; save your query for future use; or save it under a different name.
			<span id='spnMoreActions2' runat='server'/>
		</td>
	</tr>
</table>
<BR>
<Core:cUserCtlLoader CtlID='lnkView' Type='cLink' Properties='Caption=View Results (HTML)&CausesValidation=False' runat='server' />
&nbsp;&nbsp;&nbsp;
<Core:cUserCtlLoader CtlID='lnkExcel' Type='cLink' Properties='Caption=Excel&CausesValidation=False' runat='server'/>
&nbsp;&nbsp;&nbsp;
<Core:cUserCtlLoader CtlID='lnkEmailUtility' Type='cLink' Properties='Caption=E-mail&CausesValidation=False' runat='server'/>
&nbsp;&nbsp;&nbsp;
<Core:cUserCtlLoader CtlID='lnkMerge' Type='cLink' Properties='Caption=Word Merge&CausesValidation=False' runat='server'/>
<br><br>

<table runat='server' width='100%'>

	<tr>
		<td>
		To save the query, enter a name and brief description and select the appropriate Query Type. To save the query for your personal use only, check <b>Private</b>. After all selections are entered, click on the <b>Save</b> button. 
		</td>
	</tr>
	<tr>
		<td>
			If you have edited a previously saved query and would like to save the changes under a new query name, click on the <b>Save As</b> button.
		</td>
	</tr>
</table>
<br>

<table width='50%'>
	<tr>
		<td>
			<span runat='server' id='spnSave' visible='false'>
				<b>Query Name</b>&nbsp;<font color='red'>*</font>&nbsp;
		</td>
		<td>
				<asp:TextBox runat='server' id='txtQueryName' size='50' MaxLength='50' />		
				<asp:RequiredFieldValidator
					runat='server'
					id='valReqQueryName'
					ControlToValidate='txtQueryName'
					ErrorMessage='Query name is required.'
					Display='None'/>
		</td>
	</tr>
	<tr>
		<td>
				<b>Query Description&nbsp;</b>
		</td>
		<td>
			<asp:TextBox runat='server' id='txtQueryDescription' size='50' MaxLength='100'/>
		</td>			
	</tr>
	<tr>
		<td>
			<b>Query Type</b>&nbsp;<font color='red'>*</font>&nbsp;
		</td>
		<td>
			<asp:DropDownList runat='server' id='ddlQueryGroup' AutoPostBack='True' EnableViewState='True'/>
			<asp:RequiredFieldValidator
				runat='server'
				id='valReqQueryGroup'
				ControlToValidate='ddlQueryGroup'
				ErrorMessage='Query Group is required.'
				Display='None'/>	
		</td>			
	</tr>
	<tr>
		<td>
			<b>Private&nbsp;</b>
		</td>
		<td>
			<asp:checkbox runat='server' id='chkPrivate'/>
		</td>			
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
				<Core:cUserCtlLoader CtlID='btnSave' 
					Type='cButton'
					Properties='Caption=Save&CausesValidation=False'
					runat='server'/>
				&nbsp;&nbsp;
				<Core:cUserCtlLoader CtlID='btnSaveAs' 
					Type='cButton'
					Properties='Caption=Save As&CausesValidation=False'
					runat='server'/>
			</span> 
		</td>
	</tr>
</table>
<asp:CustomValidator
	runat='server'
	id='valCusSave'
	Display='None'
	OnServerValidate='ValidateUniqueNameSave'
	ErrorMessage='The query name you have chosen already exists in the system. Please choose a different name.'/>
<asp:CustomValidator
	runat='server'
	id='valCusSaveAs'
	Display='None'
	OnServerValidate='ValidateUniqueNameSaveAs'
	ErrorMessage='The query name you have chosen already exists in the system. Please choose a different name.'/>

<br><br>
<table width='100%'>
	<tr>
		<td align='center'>
			<Core:cUserCtlLoader CtlID='btnCancel' 
				Type='cButton'
				Properties='Caption=Close&CausesValidation=False'
				runat='server'/>
		</td>
	</tr>
</table>

<Core:cUserCtlLoader CtlID='ctlViewResults' Src='Core/Controls/Base/NewWindowOpener.ascx' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlViewExcel' Src='Core/Controls/Base/NewWindowOpener.ascx' runat='server'/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='QueryType' DataObjectDefinitionKey='QueryType' Updatable='False'>
            <Filters>
                <Argument Type='' TypeKey='' PropertyKey='EndDate' Value='Null' />			            
            </Filters>
			<Sort>
				<Argument PropertyKey='Description' />
			</Sort>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
			<DisplayProperty PropertyKey=''>
				<Control Container='spnHelp' 
					ID='ctlHelp'
					Type='cLink'
					Caption='here.'>
					<Action
						PostBack='False'
						URL='../../../Easygrants/Controls/Base/pgQTFields.aspx'
						Target='Blank'>
					</Action>		
				</Control>
			</DisplayProperty>	
				
			
			<DisplayProperty PropertyKey=''>
				<Control ID='ctlMoreDistinct'
					Container='spnMoreDistinct'
					Type='cTextPopUp'
					PopUpCloseImage='Close'
					PopUpTitle='Select Fields Additional Information'
					Height='200'
					Width='400'>
					<InstructionHtml>
						<ul>
								<li>If you click the Select Distinct checkbox (defaults to checked), the sort fields selected must also be in the selected fields list.</li>
								<li>Large text content cannot be exported as distinct. Please uncheck the box if you are slecting large text content fields.</li>
						</ul>
					</InstructionHtml>		
					<Action PostBack='False'>
					</Action>
				</Control>
			</DisplayProperty>
					
			<DisplayProperty PropertyKey=''>
				<Control ID='ctlMoreActions2'
					Container='spnMoreActions2'
					Type='cTextPopUp'
					PopUpCloseImage='Close'
					PopUpTitle='Query Results Actions Additional Information'
					Height='200'
					Width='600'>
					<InstructionHtml>
					  <ul>
						<li>Click the View Results (HTML) link to display the results in a new window in HTML format.</li>
						<li>Click the Excel link to export the query results to Microsoft Excel.</li>
						<li>Click the E-mail link to send a bulk e-mail using the Easygrants Send E-mail page.</li>
						<li>Click the Word Merge link to create a Microsoft Word Mail Merge with the query results.</li>
					  </ul>
					</InstructionHtml>
					<Action PostBack='False'>
					</Action>
				</Control>
			</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<a name='PDFReport'/>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>PDF Report Information</b></td>
	</tr>

	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnPDFList' visible='true'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PDFList' DataObjectDefinitionKey='WfProjectTaskPDF' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='PDFReportEditor'/>
									<Argument Type='Data' TypeKey='' BaseValue='WfProjectTaskPDFID=0' Value=''/>
									<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									<Argument Type='Data' TypeKey='' BaseValue='Anchor=PDFReport' Value=''/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPDFList'
						Container='spnPDFList'
						Type='cDataListCtl'
						SeparatorWidth='2'
						DataObjectDefinitionKey='WfProjectPDF'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Lock Generated PDFs' Width='30%' >
							 <Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FinalPDFReportKeyLink.Description' ColumnHeader='PDF Key' Width='30%' >
							 <Sortable>
								<Argument PropertyKey='Description'>
								        <RelatedProperty PropertyKey='FinalPDFReportKeyLink'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PDFGenerationID' ColumnHeader='PDF Generation' Format='YesNo' Width='20%' >
							 <Sortable>
								 <Sortable>
								<Argument PropertyKey='PDFGenerationID'/>
							</Sortable>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center' Width='20%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PDFReportEditor'/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskPDFID' AttributeName='WfProjectTaskPDFID' BaseValue='WfProjectTaskPDFID='/>
										<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' AttributeName='ReturnURL' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='Data' TypeKey='' BaseValue='Anchor=PDFReport' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfProjectTaskPDFID' AttributeName='WfProjectTaskPDFID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
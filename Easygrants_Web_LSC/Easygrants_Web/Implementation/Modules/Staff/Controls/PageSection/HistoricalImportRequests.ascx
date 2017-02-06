<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cHistoricalImportRequests" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="HistoricalImportRequests.ascx.vb" %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='..\..\..\..\..\Core\Controls\Base\NewWindowOpener.ascx' %>
<Core:cNewWindowOpener runat='server' id='ctlShow'/>

<br /><br />
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	AutoVDateType='Last' Key='HistoricalImportRequests' LinkTitle='Historical Import Requests' runat='server'/>


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan='4' class="SeparatorHdg">
			<b>Historical Requests</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'><td colspan='3'><span id='spnClose' runat='server' /></td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='HistoricalImportList' DataObjectDefinitionKey='ImportedFile'>
			<Filters>
				<Argument Type='' TypeKey='' PropertyKey='ImportStatusID' Value='4' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SubmitDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ImportedFile'
						SeparatorWidth='2'
						NoRecordMessage='No historical import requests were found.'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='Import Request'>
							<Control ID='btnView'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='OnView'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='ImportedFileID' AttributeName='ImportedFileID' />
										<Argument Type='DataObject' TypeKey='ImportTypeID' AttributeName='ImportTypeID' />
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='SourceFileName'/>
							</Sortable>						
						</DisplayProperty>						
						<DisplayProperty PropertyKey='ImportType.Abbr' ColumnHeader='Import Types'>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='ImportType' />
								</Argument>
							</Sortable>						
						</DisplayProperty>						
						<DisplayProperty PropertyKey='SubmitDate' Format='M/d/yyyy' ColumnHeader='Import Date'>
							<Sortable>
								<Argument PropertyKey='SubmitDate'/>
							</Sortable>						
						</DisplayProperty>						
						<DisplayProperty PropertyKey='ImportStatus.Abbr' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='ImportStatus' />
								</Argument>
							</Sortable>						
						</DisplayProperty>							
					<!--	<DisplayProperty PropertyKey='' ColumnHeader='Options'>
							<Control ID='btnView'
								Type='cButton'
								Image='View'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='OnView'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='ImportedFileID' AttributeName='ImportedFileID' />
										<Argument Type='DataObject' TypeKey='ImportTypeID' AttributeName='ImportTypeID' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty> -->
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Import'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

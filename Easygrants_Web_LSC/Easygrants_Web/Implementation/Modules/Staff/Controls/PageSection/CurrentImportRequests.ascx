<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cCurrentImportRequests" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='..\..\..\..\..\Core\Controls\Base\NewWindowOpener.ascx' %>
<Core:cNewWindowOpener runat='server' id='ctlShow'/>

<br>
Listed below are all imports that are still processing or have encountered an error during processing. 
To view any updates to the list, refresh the page. Once the file has finished processing, you may click 
<B>View</B> to review the data before committing to the import. If there is an error in the validation of the 
file, click <B>View</B> for details. To remove a request with an error, click <B>Delete</B>. To complete the import 
of a valid file, click <B>Commit</B>.  
<br><br>
<b>IMPORTANT:</b> Once you click <b>Commit</b>, you will not be able to undo the import.</font>
<br><br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan='4' class="SeparatorHdg">
			<b>Current Requests</b>
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
		<DataObject Key='ImportedFileList' DataObjectDefinitionKey='ImportedFile'>
			<Filters>
				<Argument Type='' TypeKey='' PropertyKey='ImportStatusID' Value='0' />
				<Argument Type='' TypeKey='' PropertyKey='ImportStatusID' Value='2' Bool='Or' />
				<Argument Type='' TypeKey='' PropertyKey='ImportStatusID' Value='-1' Bool='Or' />
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
						NoRecordMessage='No current import requests were found.'
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
							<Parameters>
								<Argument Value='0' ValueKey='ImportStatusID'  DisplayValue='Processing'/>
								<Argument Value='0' Operator='NotEqual' ValueKey='ImportStatusID' PropertyKey='ImportStatus.Abbr' />
							</Parameters>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='ImportStatus' />
								</Argument>
							</Sortable>						
						</DisplayProperty>						
						<!--<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' 
						             HeaderColspan='3' HeaderAlign='Center' DataAlign='Center' Width='10%'>
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
						
						<DisplayProperty PropertyKey='' Width='10%'>
							<Parameters>
							    <Argument Value='Error' ValueKey='ImportStatus.Description' Operator='Equal' DisplayValue='' />
								<Argument Value='2' ValueKey='ImportStatusID' DisplayValue='Control'>	
									<Control ID='btnCommit'
										Type='cButton'
										Image='Commit'
										Confirmation='WARNING: You cannot undo an import after you Commit. Are you sure you want to proceed?'>
										<Action
											PostBack='True'
											Object='DataPresenter'
											Method='CommitImport'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='ImportedFileID' AttributeName='ImportedFileID' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='' Width='10%'>
						    <Parameters>
								<Argument Value='Error' ValueKey='ImportStatus.Description' DisplayValue='Control'>	
							        <Control ID='btnDelete'
								        Type='cButton'
								        Image='Remove'
								        Confirmation='Are you sure you want to remove this import request?'>
								        <Action
									        PostBack='True'
									        Object='EventController'
									        Method='EventController_Delete'>
									        <Parameters>
										        <Argument Type='DataObject' TypeKey='ImportedFileID' AttributeName='ImportedFileID'/>
										        <RelatedDataObjects>
											        <RelatedDataObject DataObjectDefinitionKey='ImportedFileData'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='ImportedFileID' childProperty='ImportedFileID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='PaymentImport'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='ImportedFileID' childProperty='ImportedFileID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
										        </RelatedDataObjects>
									        </Parameters>
								        </Action>
							        </Control>
							    </Argument>
							    <Argument Value='2' ValueKey='ImportStatusID' DisplayValue='Control'>	
							        <Control ID='btnDelete2'
								        Type='cButton'
								        Image='Remove'
								        Confirmation='Are you sure you want to remove this import request?'>
								        <Action
									        PostBack='True'
									        Object='EventController'
									        Method='EventController_Delete'>
									        <Parameters>
										        <Argument Type='DataObject' TypeKey='ImportedFileID' AttributeName='ImportedFileID'/>
										        <RelatedDataObjects>
											        <RelatedDataObject DataObjectDefinitionKey='ImportedFileData'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='ImportedFileID' childProperty='ImportedFileID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='PaymentImport'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='ImportedFileID' childProperty='ImportedFileID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
										        </RelatedDataObjects>
									        </Parameters>
								        </Action>
							        </Control>
							    </Argument>
							</Parameters>
						</DisplayProperty>	
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

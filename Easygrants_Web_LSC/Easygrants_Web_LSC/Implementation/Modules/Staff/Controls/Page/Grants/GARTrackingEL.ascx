<%@ Register Tagprefix='Core' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProgressReportEL.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Grants.cProgressReportEL_LSC" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br>
<br>
<span id='spnHideText' runat='server' visible='true'>
	<Easygrants:ValSumm id='ctlValSumm' runat='server' />

<Core:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true' AutoVDateType='Root' Key='GARTrackingEL'
		LinkTitle='GAR Tracking Easylist' runat='server' />
   <table id="Table1" width='100%' runat='server'>
		<tr class='SeparatorHdg'>
			<td colspan='2'>
				<span runat='server' id='spnHide' visible='true' /><span runat='server' id='spnHideLink' visible='false' />
				<span runat='server' id='spnShow' visible='true' /><span runat='server' id='spnShowLink' visible='true' />
				(clicking on this link will display Easylist search criteria if it is hidden)
			</td>
		</tr>
		<tr id='trNoResults' visible='false'>
			<td colspan='2'>
				<font color='red'><b>No results were found matching your search criteria. </font>
				</B>
				<br>
				<br>
			</td>
		</tr>
	</table>
	<table id='tbSearchParameters' width='100%' runat='server' visible='true'>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<b>GAR Cycle</b>
			</td>
			<td>
				<span runat='server' id='spnGARCycle' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Recipient Number</b>
			</td>
			<td>
				<span runat='server' id='spnRecipientNum' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Task</b>
			</td>
			<td>
				<span runat='server' id='spnTask' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Status</b>
			</td>
			<td>
				<span runat='server' id='spnStatus' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Due Date</b>
			</td>
			<td>
				<span runat='server' id='spnDueDate' />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
		<td colspan='3' align='center'>
			<span runat='server' id='spnFind'/>&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClear'/>
			<br><br>
		</td>
	</tr>
	</table>
	<table id="Table2" width='100%' runat='server'>
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnList' />
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnNoResult' />
			</td>
		</tr>
	</table>
</span>


<span id='spnConfigXML' visible='false' runat='server'>
   <ModuleSection>
	    <ResultLists>
			<ResultList Key='GARList'>Tasks</ResultList>
		</ResultLists>
		
	<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
          <DisplayProperties>
                <DisplayProperty PropertyKey=''>
					    <Control ID='ctlGARCycle' 
					             Type='cDropDown' 
					             Container='spnGARCycle' 
					             DataObjectDefinitionKey='LscGarCycle'
						         StoredValue='LscGarCycleID' 
						         DisplayValue='Abbr'
						         DisplayNone='False'
						         FilterKey='LscGarCycleID'>
						        <FilterList List='GARList' Property='LscGarCycleID' />
						        <Sort>
							        <Argument PropertyKey='SortOrder' Direction='Descending' />
						        </Sort>
					    </Control>
				  </DisplayProperty>
				  	
				 <DisplayProperty PropertyKey=''>
					  <Control ID='txtRecipientNum' Type='cTextBox' Container='spnRecipientNum' FilterKey='LegacyOrganizationID'
						Size='20'>
						<FilterList List='GARList' Property='LegacyOrganizationID' />
					  </Control>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey=''>
					    <Control ID='ctlTask' 
					             Type='cDropDown' 
					             Container='spnTask' 
					             DataObjectDefinitionKey='LscWfTask'
						         StoredValue='WfTaskID' 
						         DisplayValue='WfTask.WfTask'
						         DisplayNone='False'
						         DisplayText='All' 
						         FilterKey='WfTaskID'>
						        <FilterList List='GARList' Property='WfTaskID' />
						        <Filters>
							        <Argument PropertyKey='FormNumber' Operator='NotEqual'  Value='' />
							        <%--<Argument PropertyKey='WfTaskTypeID' Value='3' />--%>
						        </Filters>
						        <Sort>
							        <Argument PropertyKey='WfTaskAbbr' Direction='Ascending' >
							            <RelatedProperty PropertyKey='WfTask' />
							        </Argument>
						        </Sort>
					    </Control>
				  </DisplayProperty>
				  	
				  <DisplayProperty PropertyKey=''>
					    <Control ID='ctlStatus' 
					             Type='cDropDown' 
					             Container='spnStatus' 
					             DataObjectDefinitionKey='WfTaskStatus'
						         StoredValue='WfTaskStatusID' 
						         DisplayValue='WfTaskStatusAbbr' 
						         DisplayNone='False'
						         DisplayText='All' 
						         FilterKey='WfTaskStatusID'>
						        <FilterList List='GARList' Property='WfTaskStatusID' />
					    </Control>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey=''>
					  <Control ID='txtDuedate' Type='cTextBox' Container='spnDueDate' FilterKey='DueDate'
						Size='20'>
						<FilterList List='GARList' Property='DueDate' />
					  </Control>
				  </DisplayProperty>
				  <DisplayProperty PropertyKey=''>
					<Control ID='btnShow' Type='cButtonImage' Container='spnShow' Image='Show.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkShow' Type='cLink' Container='spnShowLink' Caption='Easylist Search'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHide' Type='cButtonImage' Container='spnHide' Image='Hide.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHide' Type='cLink' Container='spnHideLink' Caption='Easylist Search'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>		
				  <DisplayProperty PropertyKey=''>
					   <Control ID='btnFind' Type='cButton' Container='spnFind' Image='Find'>
						    <Action PostBack='True' Object='ModulePageContent' Method='FilterListDataPresenter_Find' />
					  </Control>
				  </DisplayProperty>
			</DisplayProperties>
	</DataObject>
	
	<DataObject Key='GARList' DataObjectDefinitionKey='LSCGARTrackingEL' Updatable='False' GetData='False'>
	    <Filters>
		</Filters>
		<Sort>
		</Sort>
		<DisplayProperties>
		     <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList' Type='cDataListCtl' Container='spnList' DataObjectDefinitionKey='LSCGARTrackingEL'
						SeparatorWidth='2' MaxPerPage='22'>
						<HeaderHtml>
							GAR Tracking Search Results
						</HeaderHtml>
		            <DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='200'>
							<Control ID='ctlActions' Type='cDropDown' DataObjectDefinitionKey='EasylistAction' StoredValue='EasylistActionID'
								DisplayValue='EasylistAction' DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='GARTracking'>
										<RelatedProperty PropertyKey='EasylistActionType' />
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
								</Sort>
							</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo' Type='cButton' Image='Go'>
								<Action PostBack='True' Object='DataPresenter' Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl' />
										<Argument Type='Object' ObjectType='EventSource' />
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' />
										<ActionParameters>
										    <Argument AttributeName='PrintPageKey' Type='DataObject' TypeKey='PrintPageKey' BaseValue='Page=' />
										    <Argument AttributeName='EditablePageKey' Type='DataObject' TypeKey='EditablePageKey' BaseValue='Page=' />
										</ActionParameters>
									</Parameters>
								</Action>
							</Control>
					</DisplayProperty>
		
		            <DisplayProperty PropertyKey='LegacyOrganizationID' ColumnHeader='Recipient ID'>
							<Sortable>
								<Argument PropertyKey='LegacyOrganizationID' />
							</Sortable>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='ServiceArea' ColumnHeader='Service Area'>
							<Sortable>
								<Argument PropertyKey='ServiceArea'/>
							</Sortable>
					   </DisplayProperty>
		            <DisplayProperty PropertyKey='WfTask' ColumnHeader='Task'>
							<Sortable>
								<Argument PropertyKey='WfTask'/>
							</Sortable>
					 </DisplayProperty>
					 <DisplayProperty PropertyKey='Abbr' ColumnHeader='GAR Cycle'>
							<Sortable>
								<Argument PropertyKey='Abbr'/>
							</Sortable>
					 </DisplayProperty>
					  
					   
					 <DisplayProperty PropertyKey='DueDate' ColumnHeader='Due Date' Format='M/d/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='DueDate'/>
							</Sortable>
					 </DisplayProperty>
					 <DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'/>
							</Sortable>
					 </DisplayProperty>
		              <%-- <DisplayProperty PropertyKey=''>
					              <Control ID='btnSubmit'
						                    Type='cLink'
						                     Caption='Submit'>
						                  <Action PostBack='True'
						                        Object='DataPresenter'
							                    Method='Submit_UnSubmit'>
							                    <Parameters>
							                        
							                        <Argument AttributeName='WfTaskAssignmentID' Type='DataObject' TypeKey='WfTaskAssignmentID'  />
							                        
							                    </Parameters>
							              </Action>
						          </Control>
						</DisplayProperty>--%>
			        </Control>
			 </DisplayProperty>
		</DisplayProperties>
	</DataObject>
	
  </ModuleSection>
</span>
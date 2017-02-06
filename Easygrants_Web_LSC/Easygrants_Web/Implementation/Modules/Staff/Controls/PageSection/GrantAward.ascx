<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantAward" Codebehind="GrantAward.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

				

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Grant Award and Amendments</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trAdd' runat='server'>
		<td>
			<span runat='server' id='spnAdd'/>		          
		</td>		
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList'/>	
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<asp:panel id='PnlAmendments' runat='server' Visible='true'>
    <table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	    <tr>
		    <td class="MinorSeparatorHdg"><b>Amendments</b></td>
	    </tr>
	    <tr><td>&nbsp;</td></tr>
	    <tr>
		    <td>
			    <span runat='server' id='spnAmendAdd'/>		          
		    </td>		
	    </tr>
	    <tr>
		    <td>
			    <span runat='server' id='spnAmendDataList'/>	
		    </td>
	    </tr>
    </table>
</asp:panel>


<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GrantDetailsGrantAward' DataObjectDefinitionKey='GrantAwardAndAmendment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='InitialAwardAmount' Value='null' Operator='NotEqual'/>
			</Filters>
			<DisplayProperties>	
			    <DisplayProperty PropertyKey=''>
			        <Control ID='ctlAdd'
				        Container='spnAdd'
				        Type='cButton'
				        Image='Add'>
				        <Action
					        AutoSave='False'
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
					        <Parameters>
					            <Argument AttributeName='PageKey' Value='GrantAwardEditor'/>								
						        <Argument Type='' TypeKey='' AttributeName='' Value='GrantAwardAndAmendmentID=0'/>
						        <Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
						        <Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>								
					        </Parameters>
				        </Action>
			        </Control>
		        </DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GrantAwardAndAmendment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='GranteeProject.GrantAwardDate' ColumnHeader='Award Date' NoWrap='true' Width='20%' Format='MM/dd/yyyy'/>
						<DisplayProperty PropertyKey='InitialAwardAmount' ColumnHeader='Initial Award Amount' width='10%' NoWrap='True' Width='20%'  Format='$#,0.00;($#,0.00)'>
						 <NegativeNumberFormat>&lt;font color=&quot;red&quot; &gt;~&lt;/font&gt;</NegativeNumberFormat>
						 </DisplayProperty>
						<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstNameMiddleName' ColumnHeader='Created By' NoWrap='true' Width='20%'/>
                        <DisplayProperty PropertyKey='CreateDate' ColumnHeader='Created On' NoWrap='true'  Width='20%' Format='MM/dd/yyyy'/>	
                        <DisplayProperty PropertyKey='' ColumnHeader='Options'  HeaderAlign='Center' DataAlign='Center' Width='20%'>
							<Control ID='btnAwardEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantAwardEditor'/>
										<Argument Type='DataObject' TypeKey='GrantAwardAndAmendmentID' AttributeName='GrantAwardAndAmendmentID' BaseValue='GrantAwardAndAmendmentID='/>								
										 <Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				 
			</DisplayProperties>
		</DataObject>

	    <DataObject Key='GrantDetailsCalculateAwardAmounts' DataObjectDefinitionKey='CalculateAwardAmounts'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<Sort>
			    <Argument PropertyKey='EffectiveDate' Direction='Descending' />
			    <Argument PropertyKey='SortOrder' Direction='Descending' />
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
			        <Control ID='ctlAmendAdd'
				        Container='spnAmendAdd'
				        Type='cButton'
				        Image='Add'>
				        <Action
					        AutoSave='False'
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
					        <Parameters>
					            <Argument AttributeName='PageKey' Value='GrantAmendmentEditor'/>							
						        <Argument Type='' TypeKey='' AttributeName='' Value='GrantAwardAndAmendmentID=0'/>
						        <Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
						        <Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>								
					        </Parameters>
				        </Action>
			        </Control>
		        </DisplayProperty>
		        <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlAmendList'
						Container='spnAmendDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GrantAwardAndAmendment'
						NoRecordMessage='No amendments have been added to this grant.'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='EffectiveDate' ColumnHeader='Effective Date' NoWrap='true' Width='20%' Format='MM/dd/yyyy'>
						    <Sortable>
						         <Argument PropertyKey='EffectiveDate' />    
						    </Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AmendmentAmount' ColumnHeader='Amendment Amount' width='25%' NoWrap='True'  Format='$#,0.00;($#,0.00)' >
							<NegativeNumberFormat>&lt;font color=&quot;red&quot; &gt;~&lt;/font&gt;</NegativeNumberFormat>
						    <Sortable>
						         <Argument PropertyKey='AmendmentAmount' />    
						    </Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AwardAmount' ColumnHeader='Award Amount' width='25%' NoWrap='True'  Format='$#,0.00;($#,0.00)'>
							<NegativeNumberFormat>&lt;font color=&quot;red&quot; &gt;~&lt;/font&gt;</NegativeNumberFormat>
						    <Sortable>
						         <Argument PropertyKey='AwardAmount' />    
						    </Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GrantAwardAndAmendment.ModifiedByUser.Person.LastNameFirstNameMiddleName' ColumnHeader='Last Modified By' NoWrap='true' Width='15%'>
						    <Sortable>
							    <Argument PropertyKey='LastName'>
							         <RelatedProperty PropertyKey='GrantAwardAndAmendment.ModifiedByUser.Person'/>
							     </Argument> 
							     <Argument PropertyKey='FirstName'>
							         <RelatedProperty PropertyKey='GrantAwardAndAmendment.ModifiedByUser.Person'/>
							     </Argument> 
							     <Argument PropertyKey='MiddleName'>
							         <RelatedProperty PropertyKey='GrantAwardAndAmendment.ModifiedByUser.Person'/>
							     </Argument> 
						    </Sortable>
						</DisplayProperty>
                        <DisplayProperty PropertyKey='GrantAwardAndAmendment.ModifyDate' ColumnHeader='Last Modified Date' NoWrap='true'  Width='15%' Format='MM/dd/yyyy'>
                            <Sortable>
                                <Argument PropertyKey='ModifyDate'>
							         <RelatedProperty PropertyKey='GrantAwardAndAmendment'/>
							     </Argument>
						    </Sortable>
						</DisplayProperty>	
                        <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='15%' ID='Edit'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
								    ID='Edit'
									PostBack='True'
								    AutoSave='False'	
                                    Object='EventController'
                                    Method='EventController_NavigateToModulePageKey'>							    								
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantAmendmentEditor'/>
                                        <Argument Type='DataObjectRelated' TypeKey='GrantAwardAndAmendment.GrantAwardAndAmendmentID' AttributeName='GrantAwardAndAmendment.GrantAwardAndAmendmentID' BaseValue='GrantAwardAndAmendmentID='/>
						                <Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>							
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
									Object='DataPresenter'
									Method='Delete'>
										<Parameters>
											<Argument Type='DataObjectRelated' TypeKey='GrantAwardAndAmendment.GrantAwardAndAmendmentID' AttributeName='GrantAwardAndAmendment.GrantAwardAndAmendmentID'/>
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



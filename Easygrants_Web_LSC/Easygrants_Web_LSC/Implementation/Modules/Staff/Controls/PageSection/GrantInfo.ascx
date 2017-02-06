<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantInfoImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Grant Information</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Control Label (for Name information) -->
<tr>
		<td	valign="top" width='15%'><b>Grantee <%=GetLabel("Organization")%></b></td>
		<td  colspan='3' width='85%' >
			<span id='spnPrimaryOrganization' runat='server'/>
		</td>	
	</tr>
	
	<tr>
		<td	valign="top"><b>Primary Contact/PI</b></td>
		<td   colspan='3'>
			<span id='spnPrimaryPerson' runat='server'/>
		</td>	
	</tr>
	
	<tr>
		<td	valign="top"><b><%=GetLabel("ProjectTitle")%></b></td>
		<td  colspan='3'><span id='spnProjectTitle' runat='server'/></td>	
	</tr>
	
	<tr>
		<td	valign="top"><b><%=GetLabel("ProjectDescription")%></b></td>
		<td  colspan='3'><span id='spnProjectDesc' runat='server'/></td>	
	</tr>
	
	
	<tr>
		<td	valign="top"><b><%=GetLabel("GrantProjectTerm")%></b>&nbsp;&nbsp;</td>
		<td  colspan='3'>
			<span id='spnStartDate' runat='server'/>&nbsp;-&nbsp;
			<span id='spnEndDate' runat='server'/>
		</td>		
	</tr>

	<tr>
		<td	valign="top"><b><%=GetLabel("GrantRequestedAmount")%></b></td>
		<td   colspan='3'><span id='spnRequestedAmount' runat='server'/></td>	
	</tr>
	<tr>
		<td valign="top"><b>Status</b></td>
		<td colspan='3'><span id='spnStatus' runat='server'/></td>	
	</tr>
	<tr>
		<td valign="top"><b>Outcome</b></td>
		<td colspan='3'><span id='spnOutcome' runat='server'/></td>	
	</tr>
	<tr>
		<td valign="top"><b>Recommended Amount</b></td>
		<td colspan='3'><span id='spnRAmt' runat='server'/></td>	
	</tr>
	<tr>
		<td valign="top"><b>Original Amount</b></td>
		<td colspan='3'><span id='spnOriginalAmt' runat='server'/></td>	
	</tr>
	<tr>
		<td valign="top"><b>Grant Amount</b></td>
		<td colspan='3'><span id='spnGrantAmt' runat='server'/></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4' align='left'>
			<span id='spnGrantSummaryEditor' runat='server'/>
		</td>
	</tr>
		
	
</table>
<br/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
				
			</Filters>
			<DisplayProperties>
				    
					<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstNameMiddleNameCommaSep' >
							<Control ID='ctlLink3' Container='spnPrimaryPerson'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
									    <Argument AttributeName='PageKey' Value='PersonContact'/>
									    <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' BaseValue='PersonID='/>
									
									</Parameters>
								</Action>
							</Control>							
						</DisplayProperty>
						<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName' >
							<Control ID='ctlLink1' Container='spnPrimaryOrganization'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
									   <Argument AttributeName='PageKey' Value='OrganizationContact'/>
									    <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganization.OrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>							
						</DisplayProperty> 
						<DisplayProperty PropertyKey='GrantTitle'>
					        <Control ID='spnProjectTitle'
						        Type='HtmlGenericControl'>
					        </Control>
				        </DisplayProperty>										
						<DisplayProperty PropertyKey='GrantDescription'>
					        <Control ID='spnProjectDesc'
						        Type='HtmlGenericControl'>
					        </Control>
				        </DisplayProperty>
				        <DisplayProperty PropertyKey='RequestAmount'  Format='$#,##0.##'>
					        <Control ID='spnRequestedAmount'
						        Type='HtmlGenericControl'>
					        </Control>
				        </DisplayProperty>				       		
				         <DisplayProperty PropertyKey='WfProjectOutcome.Description'>
					        <Control ID='spnOutcome'
						        Type='HtmlGenericControl'>
					        </Control>
				        </DisplayProperty>
				         
				        <DisplayProperty PropertyKey='GrantAwardAndAmendment.InitialAwardAmount' Format='$#,#'>
					        <Control ID='spnOriginalAmt'
						        Type='HtmlGenericControl'>
					        </Control>
				        </DisplayProperty>
		                <DisplayProperty PropertyKey='GrantStatus.Abbr'>
					        <Control ID='spnStatus'
						        Type='HtmlGenericControl'>
					        </Control>
				        </DisplayProperty>
			    </DisplayProperties>
		</DataObject><!-- Key='GranteeProject' -->
		
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey='DurationStart' Format='MM/dd/yyyy'>
					<Control ID='spnStartDate'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DurationEnd' Format='MM/dd/yyyy'>
					<Control ID='spnEndDate'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AwardAmount' Format='$#,#'>
					<Control ID='spnGrantAmt'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscGranteeProjectTig' DataObjectDefinitionKey='LscGranteeProjectTig'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>	
			    <DisplayProperty PropertyKey='RecommendedAmount' Format='$#,0'>
					        <Control ID='spnRAmt'
						        Type='HtmlGenericControl'>
					        </Control>
				</DisplayProperty>
			</DisplayProperties>
	    </DataObject>			

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit' 
						Type='cButton' 
						Image='Edit'
						Container='spnGrantSummaryEditor'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='GrantInfoEditor'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' BaseValue='PrimaryPersonID=' />
									<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' BaseValue='PrimaryOrganizationID=' />
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key=Base -->
	</ModuleSection>
<!-- End Embedded XML -->
</span>


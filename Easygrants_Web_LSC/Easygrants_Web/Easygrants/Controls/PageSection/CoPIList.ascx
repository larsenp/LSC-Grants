<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cCoPIList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
	
<!-- Page Content - Controls -->
<span id='spnWinOpen' visible='false' runat='server'>
	<SCRIPT language="javascript">
		window.open("<%=URL%>")
	</SCRIPT>
</span>
<span id='spnWinRedirect' visible='false' runat='server'>
	<SCRIPT language="javascript">
		window.opener.location = "<%=URL%>"
		window.close();
	</SCRIPT>
</span>
<span id='spnWinClose' visible='false' runat='server'>
	<SCRIPT language="javascript">
		window.close();
	</SCRIPT>
</span>

<br><br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Matching Contacts</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' ID="Table2">
	<tr>
		<td colspan=2>
			<p>
			Possible matches were found for the Co-PI being added.  Listed below are the 
			potential matches. To use the existing contact, click on the appropriate <b>Select</b> 
			button.  Click on <b>Cancel</b> to cancel adding a new Co-PI record.
			
			</p>
		</td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr visible='false'>
		<td	valign="top" colspan=2><b>Existing Names Like:</b> <%=LastName%>, <%=FirstName%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr visible='false'>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr visible='false'>
		<td width=10>&nbsp;</td>
		<td>Checking for similarity between the first names and the last names.</td>
	</tr>
	<tr visible='false'>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr visible='false'>
		<td width=10>&nbsp;</td>
		<td>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>
	<tr visible='false'>
		<td colspan=2><hr></td>
	</tr>
	<tr visible='false'>
		<td	valign="top" colspan=2><b>Existing Names Like: </b> <%=MiddleName%>, <%=FirstName%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr visible='false'>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr visible='false'>
		<td width=10>&nbsp;</td>
		<td>Checking for similarity between the first names and between the new contact middle name and existing contact last name.</td>
	</tr>
	<tr visible='false'>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr visible='false'>
		<td width=10>&nbsp;</td>
		<td>
			<span runat='server' id='spnDataList1' visible='true'></span>
		</td>
	</tr>
	<tr visible='false'>
		<td colspan=2><hr></td>
	</tr>
	<tr visible='false'>
		<td	valign="top" colspan=2><b>Existing Names Having E-mail: </b> <%=Email%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr visible='false'>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td width=10>&nbsp;</td>
		<td>Checking for an exact match between e-mail addresses.</td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td width=10>&nbsp;</td>
		<td>
			<span runat='server' id='spnDataList2' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr id='trName' visible='false'>
		<td colspan=2>
			Click here to <span id='spnNewPerson' runat='server'/> or click <b>Cancel</b> to cancel adding a new contact record.
		</td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=2 align="left">
			<span runat='server' id='spnCancel' visible='true'/> 
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='first' 
					PropertyKey='FirstName' 
					Operator='Like' 
					Value='' 
					Bool=''/>
				<Argument Type='QueryString' 
					TypeKey='last' 
					PropertyKey='LastName' 
					Operator='Like' 
					Value='' 
					Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewPerson'
						Container='spnNewPerson'
						Type='cLink'
						Caption='Create a New Contact'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CreateNewPerson'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='Cancel'>
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Person'
						NoRecordMessage='No contacts were found'
						MaxPerPage='10'>
						<!--
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name'>					
							<Control ID='ctlLink'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Redirect'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						-->
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name' />
						
						<DisplayProperty PropertyKey='PersonPrimaryPhone.ContactValue1' ColumnHeader='Primary Phone'/>
						<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1' ColumnHeader='Primary E-Mail'/>
						<DisplayProperty PropertyKey='PrimaryAddress.Address1' ColumnHeader='Primary Address'/>
						<DisplayProperty PropertyKey='PrimaryAddress.City' ColumnHeader='City'/>
						<DisplayProperty PropertyKey='PrimaryAddress.State.StateAbbr' ColumnHeader='State/Province'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center'>
							<Control ID='btnSelect'
								Type='cButton'
								Image='Select'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='SelectPerson'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
		<DataObject Key='Person1' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='first' 
					PropertyKey='FirstName' 
					Operator='Like' 
					Value='' 
					Bool=''/>
				<Argument Type='QueryString' 
					TypeKey='middle' 
					PropertyKey='LastName' 
					Operator='Like' 
					Value='' 
					Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList1'
						Container='spnDataList1'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Person'
						NoRecordMessage='No contacts were found'
						MaxPerPage='10'>
						<!--
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name'>					
							<Control ID='ctlLink1'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Redirect'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						-->
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name' />					
						
						<DisplayProperty PropertyKey='PersonPrimaryPhone.ContactValue1' ColumnHeader='Primary Phone'/>
						<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1' ColumnHeader='Primary E-Mail'/>
						<DisplayProperty PropertyKey='PrimaryAddress.Address1' ColumnHeader='Primary Address'/>
						<DisplayProperty PropertyKey='PrimaryAddress.City' ColumnHeader='City'/>
						<DisplayProperty PropertyKey='PrimaryAddress.State.StateAbbr' ColumnHeader='State/Province'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center'>
							<Control ID='btnSelect'
								Type='cButton'
								Image='Select'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='SelectPerson'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
		<DataObject Key='Person2' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='email' 
					PropertyKey='ContactValue1' 
					Value='' 
					Bool=''>
					<RelatedProperty PropertyKey='Email'/>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList2'
						Container='spnDataList2'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Person'
						NoRecordMessage='No contacts were found'
						MaxPerPage='10'>
						<!--
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name'>					
							<Control ID='ctlLink2'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Redirect'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						-->
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name' />

						<DisplayProperty PropertyKey='PersonPrimaryPhone.ContactValue1' ColumnHeader='Primary Phone'/>
						<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1' ColumnHeader='Primary E-Mail'/>
						<DisplayProperty PropertyKey='PrimaryAddress.Address1' ColumnHeader='Primary Address'/>
						<DisplayProperty PropertyKey='PrimaryAddress.City' ColumnHeader='City'/>
						<DisplayProperty PropertyKey='PrimaryAddress.State.StateAbbr' ColumnHeader='State/Province'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center'>
							<Control ID='btnSelect'
								Type='cButton'
								Image='Select'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='SelectPerson'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->

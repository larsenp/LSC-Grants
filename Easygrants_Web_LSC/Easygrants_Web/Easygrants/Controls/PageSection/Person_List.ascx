<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Person_List.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cPerson_List" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
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
<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' id='tblMatchText' visible='true'>
<!-- Control Label (for Name information) -->
	<tr>
		<td colspan=2>
			<p>
			Possible matches were found for the contact being added.  Listed below are the potential matches.  Click on 
			the contact name to view additional contact information for each potential match in a new window.
			</p>
			<p>To continue adding the new contact, click on the link labeled <b>Create a New Contact</b>.  Click on the 
			<b>Close</b> button to cancel adding a new contact record and return to Add Person page.
			</p>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' id='tblEmailMatchText' visible='false'>
<!-- Control Label (for Name information) -->
	<tr>
		<td colspan=2>
			<p>
			Possible matches were found for this email.  Listed below are the potential matches.  Click on 
			the contact name to view additional contact information for each potential match in a new window.
			</p>
			<p>Click on the <b>Close</b> button to return to prior page.
			</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='left'><hr width='60%'></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' id='tblName' visible='true'>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr visible='true'>
		<td	valign="top" colspan=2><b>Existing Names Like:</b> <%=LastName%>, <%=FirstName%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td width=10>&nbsp;</td>
		<td>Checking for similarity between the first names and the last names.</td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td width=10>&nbsp;</td>
		<td>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
	<tr visible='true'>
		<td	valign="top" colspan=2><b>Existing Names Like: </b> <%=MiddleName%>, <%=FirstName%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td width=10>&nbsp;</td>
		<td>Checking for similarity between the first names and between the new contact middle name and existing contact last name.</td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td width=10>&nbsp;</td>
		<td>
			<span runat='server' id='spnDataList1' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td colspan=2><hr></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' id='tblEmail' visible='true'>
	<tr visible='true'>
		<td	valign="top" colspan=2><b>Existing Names Having E-mail: </b> <%=Email%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
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
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=2 align="left">
			<span runat='server' id='spnCancel' visible='true'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnNewPerson' runat='server' visible='true' /> 
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
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewPerson'
						Container='spnNewPerson'
						Type='cButton'
						Image='Create a New Contact'>
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
						Image='Close'>
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
						
						<!-- need to set postback = false, kda 3/21/06 -->
						<DisplayProperty PropertyKey='ContactDetailsDisplayURL' ColumnHeader='Name'>
							<Control ID='ctlLink'
								Type='cLink'
								CaptionKey='FirstNameMiddleNameLastName'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'>
								</Action>
							</Control>
						</DisplayProperty>
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
						<DisplayProperty PropertyKey='PersonPrimaryPhone.ContactValue1' ColumnHeader='Primary Phone'/>
						<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1' ColumnHeader='Primary E-Mail'/>
						<DisplayProperty PropertyKey='PrimaryAddress.Address1' ColumnHeader='Primary Address'/>
						<DisplayProperty PropertyKey='PrimaryAddress.City' ColumnHeader='City'/>
						<DisplayProperty PropertyKey='PrimaryAddress.State.StateAbbr' ColumnHeader='State'/>
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
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList1'
						Container='spnDataList1'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Person'
						NoRecordMessage='No contacts were found'
						MaxPerPage='10'>
						
						<!-- need to set postback = false, kda 3/21/06 -->
						<DisplayProperty PropertyKey='ContactDetailsDisplayURL' ColumnHeader='Name'>
							<Control ID='ctlLink1'
								Type='cLink'
								CaptionKey='FirstNameMiddleNameLastName'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'>
								</Action>
							</Control>
						</DisplayProperty>
						
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
						<DisplayProperty PropertyKey='PersonPrimaryPhone.ContactValue1' ColumnHeader='Primary Phone'/>
						<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1' ColumnHeader='Primary E-Mail'/>
						<DisplayProperty PropertyKey='PrimaryAddress.Address1' ColumnHeader='Primary Address'/>
						<DisplayProperty PropertyKey='PrimaryAddress.City' ColumnHeader='City'/>
						<DisplayProperty PropertyKey='PrimaryAddress.State.StateAbbr' ColumnHeader='State'/>
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
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList2'
						Container='spnDataList2'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Person'
						NoRecordMessage='No contacts were found'
						MaxPerPage='10'>
						
						<!-- need to set postback = false, kda 3/21/06 -->
						<DisplayProperty PropertyKey='ContactDetailsDisplayURL' ColumnHeader='Name'>
							<Control ID='ctlLink2'
								Type='cLink'
								CaptionKey='FirstNameMiddleNameLastName'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'>
								</Action>
							</Control>
						</DisplayProperty>
						
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
						
						<DisplayProperty PropertyKey='PersonPrimaryPhone.ContactValue1' ColumnHeader='Primary Phone'/>
						<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1' ColumnHeader='Primary E-Mail'/>
						<DisplayProperty PropertyKey='PrimaryAddress.Address1' ColumnHeader='Primary Address'/>
						<DisplayProperty PropertyKey='PrimaryAddress.City' ColumnHeader='City'/>
						<DisplayProperty PropertyKey='PrimaryAddress.State.StateAbbr' ColumnHeader='State'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->

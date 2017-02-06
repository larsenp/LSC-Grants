<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="CoAuthor.ascx.vb" %>
<br>
<span id='spnPageContent' runat='server'/>

<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Co-Authors</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<p>
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave_and_Continue'/> &nbsp;&nbsp;
			<span runat='server' id='spnClose' visible='false'/>
		</td>
	</tr>	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
			<DataObject Key='GranteeProjectCoAuthor' DataObjectDefinitionKey='GranteeProjectCoAuthor'>
				<Filters>
					<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				</Filters>
				<Sort>
				    <Argument PropertyKey='LastName' />	
			    </Sort>	
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
										<Argument AttributeName='PageKey' Value='CoAuthorsEditor'/>
										<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectCoAuthorID=0'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
						</Control>
					</DisplayProperty>								
					<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
						<Control ID='ctlDataList'
							Container='spnDataList'
							Type='cDataListCtl'
							MaxPerPage='10'>
							<DisplayProperty PropertyKey='LastName' ColumnHeader='Last Name'/>
							<DisplayProperty PropertyKey='FirstName' ColumnHeader='First Name'/>
							<DisplayProperty PropertyKey='MiddleName' ColumnHeader='Middle Name'/>
							<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Left'>
								<Control ID='btnEdit'
									Type='cButton'
									Image='Edit'>
									<Action
										PostBack='True'
										Object='EventController'
										Method='EventController_NavigateToModulePageKey'>
										<Parameters>
											<Argument AttributeName='PageKey' Value='CoAuthorsEditor'/>
											<Argument Type='DataObject' TypeKey='GranteeProjectCoAuthorID' AttributeName='GranteeProjectCoAuthorID' BaseValue='GranteeProjectCoAuthorID='/>
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
										Object='EventController'
										Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='GranteeProjectCoAuthorID' AttributeName='GranteeProjectCoAuthorID'/>
											</Parameters>
										</Action>
								</Control>
							</DisplayProperty>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' GoToNextPage='True' >
							<Action
								PostBack='True'
								AutoSave='True'/>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnClose'
							Container='spnClose'
							Type='cButton'
							Image='Close'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>	
								<Parameters>
									<Argument AttributeName='PageKey' Value='Main'/>
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>						
				</DisplayProperties>
			</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
	
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<p>The Comment List page displays reviewer comments recorded by staff members during the
			Panel Meeting. Staff comments can be added, edited, and deleted from this page.</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg"><b>Comments</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Applicant Name:&nbsp;&nbsp;</b><span id='spnApplicantName' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span runat='server' id='spnAdd'></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span runat='server' id='spnDataList'/></td>
	</tr>	
	<tr>
		<td align='center'>
			<span runat='server' id='spnReturnToSearch'/>
		</td>
	</tr>	
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' >
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>		
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstNameMiddleName'>
					<Control ID='spnApplicantName' Type='HtmlGenericControl'/>
				</DisplayProperty>								
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectStaffComments' DataObjectDefinitionKey='GranteeProjectStaffComments' >
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' />	
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
									<Argument Value='CommentEditor'/>
									<Argument Value='GranteeProjectStaffCommentsID=0'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectStaffComments'
						MaxPerPage='10'
						SeparatorWidth='2'>		
						<DisplayProperty PropertyKey='CreateDate' ColumnHeader='Created Date' Format='M/d/yyyy' Width='12%' />
						<DisplayProperty PropertyKey='Person.LastNameFirstNameMiddleName' ColumnHeader='Created By' Width='10%' />
						<DisplayProperty PropertyKey='Comments' ColumnHeader='Comments' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center'  Width='13%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CommentEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectStaffCommentsID' AttributeName='GranteeProjectStaffCommentsID' BaseValue='GranteeProjectStaffCommentsID='/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
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
										<Argument Type='DataObject' TypeKey='GranteeProjectStaffCommentsID' AttributeName='GranteeProjectStaffCommentsID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnReturnToSearch'
						Container='spnReturnToSearch'
						Type='cButton'
						Image='Return To Search'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>									
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->

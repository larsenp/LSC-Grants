<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Contact_ReviewerInfo.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cContact_ReviewerInfo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Reviewer Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table id='tabNotReviewer' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>This contact is currently not a reviewer. Click <b>Add</b> to designate this person as a reviewer in Easygrants.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span visible='true' runat='server' id='spnAdd'></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id='tabReviewer' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>This contact is a reviewer in the reviewer database.  Click <b>Edit</b> to edit the reviewer information.</td>
		
	</tr>
    <tr><td>&nbsp;</td></tr>
	<tr>
	    <td><span visible='true' runat='server' id='spnEdit'></span></td>
	</tr>
	 <tr><td>&nbsp;</td></tr>
</table>
<table id='tabReviewerList' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'><b>Status:</b></td>
		<td><span id='spnStatus' runat='server'></span></td>
	</tr>
	
	<tr>
		<td ><b>Start Date:</b></td>
		<td><span id='spnStartDate' runat='server'></span></td>
	</tr>
	
	<tr>
		<td><b>End Date:</b></td>
		<td><span id='spnEndDate' runat='server'></span></td>
	</tr>
	
	<tr>
		<td valign='top'><b>Area of Expertise:</b></td>
		<td valign='top'><span id='spnAreaExpertise' runat='server'></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonReviewer' DataObjectDefinitionKey='PersonReviewer' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' 
					PropertyKey='PersonID' Value='' Bool=''/>
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
									<Argument AttributeName='PageKey' Value='ContactReviewerInfoEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='PersonReviewerID=0'/>
									<Argument Type='QueryString' TypeKey='PersonID' AttributeName='' BaseValue='PersonID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit' 
						Type='cButton' 
						Image='Edit'
						Container='spnEdit'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ContactReviewerInfoEditor'/>
										<Argument Type='QueryString' TypeKey='PersonID' AttributeName='' BaseValue='PersonID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				
				<!-- Reviewer List -->
				<DisplayProperty PropertyKey='ReviewerStatus.Description'>
					<Control ID='spnStatus'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate' Format='MM/dd/yyyy'>
					<Control ID='spnStartDate'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate' Format='MM/dd/yyyy'>
					<Control ID='spnEndDate'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='PersonReviewerExpertise' DataObjectDefinitionKey='PersonReviewerExpertise'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' 
					PropertyKey='PersonID' Value='' Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Description'>	
					<RelatedProperty PropertyKey='ResearchArea'/>
				</Argument>
			</Sort>	
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnAreaExpertise'
						Type='cDataListCtl'
						MaxPerPage='10'>                    
						    <DisplayProperty PropertyKey='ResearchArea.Description'  ColumnHeader=' '  Width='50%'>
						      
						    </DisplayProperty>
					</Control>					
				</DisplayProperty>		 
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	
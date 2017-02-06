<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.cProfessionalReferences" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style="width:600px">
	<div class="SeparatorHdg">
		Instructions
	</div>
	<table width='100%'>
		<tr>
			<td>
				<p>
					List five professional references for the Applicant’s organization or, in the case of a new organization, Applicant’s principals.  
					Provide mailing addresses, telephone numbers, fax numbers and email addresses
				</p>
				<ul>
					<li>To provide information for a new reference, click <b>Add</b></li>
					<li>To edit existing reference information, click <b>Edit</b></li>
					<li>To delete reference information, click <b>Delete</b></li>
					<li>To go to the next page, click <b>Continue</b></li>
				</ul>
			</td>
         <td width="160" valign="top" >
			 	<Core:cUserCtlLoader CtlID='ctlQuickLinks' 
					Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
					runat='server'/>
			</td>
		</tr>
	</table>
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
		Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
		runat='server'/>
	<br />
	<div class="SeparatorHdg">
		List of References
	</div>
	<br />
	<span runat='server' id='spnAdd' />
	<span runat='server' id='spnNoAdd' Visible='False'>You may not add more than five professional references.</span>
	<br /><br />
	<span runat='server' id='spnDataList'/>
	<div style="text-align:center">
		<span runat='server' id='spnContinue'/>
	</div>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<ProfessionalReferences
			MaxCount='5'/>
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
		</DataObject>
		<DataObject Key='References' DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='OrganizationID' 
					DataObjectPropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' 
					TypeKey='vLSCCompWftaOrgServareaYear' 
					PropertyKey='TimePeriodID' 
					DataObjectPropertyKey='TimePeriodID' />
				<Argument Type='' 
					TypeKey='' 
					PropertyKey='AffiliationTypeID' 
					Value='4' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Caption='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ProfessionalReferenceEditor'/>
									<Argument Value='LscWfTaskAssignmentAffiliationID=0'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='LscWfTaskAssignmentAffiliations'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='FirstNameLastName' ColumnHeader='Name'  Width='25%'/>
						<DisplayProperty PropertyKey='Title' ColumnHeader='Title'  Width='30%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ProfessionalReferenceEditor'/>
										<Argument Type='DataObject' TypeKey='LscWfTaskAssignmentAffiliationID' AttributeName='LscWfTaskAssignmentAffiliationID' BaseValue='LscWfTaskAssignmentAffiliationID='/>
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
										<Argument Type='DataObject' TypeKey='LscWfTaskAssignmentAffiliationID' AttributeName='LscWfTaskAssignmentAffiliationID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Continue'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
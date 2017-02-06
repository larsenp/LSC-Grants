<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.SubgrantApprovalReview_AA.Forms.cSubrecipientNumber" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/SubgrantApprovalReview_AA/PageSection/SubgrantRequestInformation.ascx'
	runat='server'/>
<br />
<div width='100%' class="SeparatorHdg">Subrecipient Number</div>
<p>
	The grantee provided the following contact information for the proposed subrecipient:
</p>
<div style="margin-left:20px">
<span runat='server' id='spnSubgranteeName'/><br />
<span runat='server' id='spnSubgranteeAddr1'/><br />
<span runat='server' id='spnSubgranteeAddr2'/><br />
<span runat='server' id='spnSubgranteeCity'/>, <span runat='server' id='spnSubgranteeStateProv'/> <span runat='server' id='spnSubgranteeZip'/>
</div>
<br />
<p>
	Compare this information to the list of existing subrecipients  in the drop-down control below. 
	If you find a match, select the matching subrecipient and click <b>Link to Existing Subrecipient</b>. 
	If you do not find a match, click <b>Create New Subrecipient Record</b> to create a new subrecipient record 
	based on the contact information provided. Once you have used this button, it will no longer appear on the page.
</p>
<span runat='server' id='spnSubrecipientOrganizationID'/> <span runat='server' id='spnLinkSubrecipient'/><br /><br />
<span runat='server' id='spnCreateNewSubrecipient'/>
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWfTASubgrant' DataObjectDefinitionKey='LscWfTASubgrant' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'>
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument Group='('/>
					<Argument PropertyKey='WfTaskID' Value='53' Bool=''>
						<RelatedProperty PropertyKey='WfTaskAssignment'/>
					</Argument>
					<Argument PropertyKey='WfTaskID' Value='101' Bool='Or'>
						<RelatedProperty PropertyKey='WfTaskAssignment'/>
					</Argument>
				<Argument Group=')' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubgranteeName'>
					<Control ID='spnSubgranteeName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeAddr1'>
					<Control ID='spnSubgranteeAddr1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeAddr2'>
					<Control ID='spnSubgranteeAddr2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeCity'>
					<Control ID='spnSubgranteeCity'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeStateProv.StateAbbr'>
					<Control ID='spnSubgranteeStateProv'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeZip'>
					<Control ID='spnSubgranteeZip'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscGranteeProjectSubgrant' DataObjectDefinitionKey='LscGranteeProjectSubgrant' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubrecipientOrganizationID'>
					<Control ID='ctlSubrecipientOrganizationID'
						Type='cDropDown'
						Container='spnSubrecipientOrganizationID'
						DataObjectDefinitionKey='Organization'
						DisplayValue='OrgNameSubrecipientID'
						StoredValue='OrganizationID'>
						<Filters>
							<Argument PropertyKey='AddressID' Value='0' Operator='GreaterThan'>
								<RelatedProperty PropertyKey='PrimaryAddress' />
							</Argument>
							<Argument Group='(' Bool='And' />
							<Argument PropertyKey='LegacyOrganizationID' Value='0' Operator='GreaterThan' Bool='' />
							<Argument PropertyKey='SubrecipientID' Value='' Operator='NotEqual' Bool='Or' >
								<RelatedProperty PropertyKey='LscOrganization' />
							</Argument>
							<Argument Group=')' Bool='' />
						</Filters>
						<Sort>
							<Argument PropertyKey='OrganizationName'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnLinkSubrecipient'
						Type='cButton'
						Container='spnLinkSubrecipient'
						Caption='Link to Existing Subrecipient'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCreateNewSubrecipient'
						Type='cButton'
						Container='spnCreateNewSubrecipient'
						Caption='Create New Subrecipient Record'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='CreateNewSubrecipient' />
						<Action
							PostBack='True'
							Object='ModulePage'
							Method='Redirect'/>
					<Visible>
						<Argument PropertyKey='NewSubrecipientCreated' Value='False' />
						<Argument PropertyKey='LscGranteeProjectSubgrantID' Value='' Bool='Or' />
					</Visible>						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>


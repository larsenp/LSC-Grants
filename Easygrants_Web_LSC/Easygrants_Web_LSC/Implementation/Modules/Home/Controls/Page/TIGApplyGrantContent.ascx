<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Implementation.Modules.Home.Controls.Page.cTIGApplyGrantContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br>
<style>
	li {
		padding-bottom:5px;	
}
</style>  

<table width="600" border='0' cellpadding='0' cellspacing='0'>
	<tr>
	  <td><h1>TIG Letter of Intent</h1></td>
  </tr>
	

	<tr>
	  <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
        <tr>
          <td valign="top" ><ul>
            <li>To begin preparing your Letter of Intent (LOI), select one of the TIG LOI categories from the drop down menu in the <strong>TIG LOI Category</strong> section below, and then click <strong>Save and Continue</strong>. </li>
            <li>A grantee program may submit unlimited LOIs in the categories "Innovation and Improvement" and "Replication and Adaptation".</li>
				<li><strong>DEADLINE</strong>: All LOIs must be submitted no later than 11:59 p.m. EDT on <strong>Monday, February 29, 2016</strong>.</li>
          </ul>
         
          </td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td width="160" valign="top" ><Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
      </table></td>
  </tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	
	<tr><td class="SeparatorHdg"><b>TIG LOI Category</b>
		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td colspan='3'>
			<span id='spnLOIForms' runat='server' />
		</td>
		<td width='20'>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
	<tr>
		<td align='center'>
			<span runat='server' id='spnSaveAndContinue'/>
		</td>
		<td align='center'>
			<span runat='server' id='spnCancel'/>			
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='Person' DataObjectDefinitionKey='Person' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
			</Filters>
		</DataObject>
		<DataObject Key='TIGLOITypes' DataObjectDefinitionKey='TIGLOITypes'>
	        <Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.OrganizationID' PropertyKey='org_id' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlLOIForms'
						Type='cDropDown'
						Container='spnLOIForms'
						DataObjectDefinitionKey='TIGLOITypes'
						StoredValue='WfTaskID'
						DisplayValue='Description'
						DisplayText='Select'>
						    <Filters>
								<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.OrganizationID' PropertyKey='org_id' />
							</Filters>
					 </Control>
				</DisplayProperty>
			</DisplayProperties>			
		</DataObject>
						
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>						
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndContinue'
						Container='spnSaveAndContinue'
						Type='cButton'
						Image='Save_and_Continue' 
						Confirmation='Are you sure you want to apply for this Grant?' >
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='RedirectToModule'>
							
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
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='Home'/>
									<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' BaseValue='WfProjectID=' Value=''/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
								</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>	
</span>
<!-- End Embedded XML -->

<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<div style="width:100%">
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
		Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	<div style="width:100%" class="SeparatorHdg">
		Instructions
	</div>
	<p></p>
	<div style="width:100%" class='SeparatorHdg'>
		Conflicts
	</div>
	<br />
	<b>Disclosure of Potential Conflicts and Acknowledgement of Necessary Conflicts Controls</b>
<br /><br />
<table cellpadding='1' width='700'>
	<tr>
		<td><p>Applicants must disclose any actual or potential conflicts for their proposed projects. Please view the <a href='http://www.lsc.gov/sites/default/files/TIG_2013_Conflicts_Policy_FINAL.pdf' target="_blank">TIG program's current conflicts policy</a> for guidance on whether a potential conflict exists. </p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>1. Indicate whether any actual or potential conflicts exist for this proposed project.<font color='red'>*</font></td></tr>
	<tr><td><span runat='server' id='spnConflictsExist' /></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>If there are potential conflicts, discuss how your program will address them if awarded funding.</td></tr>
	<tr><td><span runat='server' id='spnAddressConflicts' /></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>2. Describe your program’s capacity to protect against any conflicts that may arise during the grant.<font color='red'>*</font></td></tr>
	<tr><td><span runat='server' id='spnCapacityProtectConflicts' /></td></tr>
	<tr><td>&nbsp;</td></tr>
	<!--<tr>
	  <td>All TIG grantees are required to comply with the <a href='http://tig.lsc.gov/sites/lsc.gov/files/TIG_2013_Conflicts_Policy_FINAL.pdf' target="_blank">TIG program's Disclosure of Interests for Determination of Conflicts Policy</a> throughout the grant term if awarded TIG funds (please <a href='http://tig.lsc.gov/grants/compliance' target=_blank> see the TIG Compliance page</a> for more information about the TIG conflicts policy). Click the box below if you agree to comply.</td></tr>
	<tr><td><span runat='server' id='spnComplyConflictsPolicy' />&nbsp;&nbsp;&nbsp;Our program has reviewed and will comply with the TIG program's Disclosure of Interests for Determination of Conflicts Policy throughout the grant term if awarded TIG funds.<font color='red'>*</font></td></tr> -->
</table>
<br /><br />
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   <DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='ConflictsExist'>
					<Control ID='ctlConflictsExist'
						Container='spnConflictsExist'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AddressConflicts'>
					<Control ID='txtAddressConflicts'
						Type='cTextArea'
						Container='spnAddressConflicts'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CapacityProtectConflicts'>
					<Control ID='txtCapacityProtectConflicts'
						Type='cTextArea'
						Container='spnCapacityProtectConflicts'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<!--<DisplayProperty PropertyKey='ComplyConflictsPolicy'>
					<Control ID='chkComplyConflictsPolicy'
						Type='cCheckBox'
						Container='spnComplyConflictsPolicy' />
				</DisplayProperty> -->
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		

	</ModuleSection>
</span>

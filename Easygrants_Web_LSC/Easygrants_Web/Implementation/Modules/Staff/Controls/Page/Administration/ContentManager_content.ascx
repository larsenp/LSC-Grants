<%@ Control Language="vb" AutoEventWireup="True" Codebehind="ContentManager_content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cContentManager_content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' tagname='cPageContentListing' src='../../Base/PageContentListing.ascx' %>
<%@ register Tagprefix='Crumb' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Crumb:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Root' Key='Tasks' LinkTitle='Tasks' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table width='100%'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Content Management</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProgram' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnSubmitProgram' runat='server'/></td>
	</tr>
	<tr id='trCmpt' visible='false'>
		<td><b><span id='spnCmpt' runat='server'><%=GetLabel("FundingOpportunity")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlCmpt' Type='cDropDown' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='btnCmpt' Type='cButton' Properties='Caption=Go&CausesValidation=False' runat='server'/></td>
	</tr>
	<tr id='trProject' visible='false'>
		<td><b><span id='spnProject' runat='server'><%=GetLabel("FundingCycleName")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlProject' Type='cDropDown' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='btnProject' Type='cButton' Properties='Caption=Go&CausesValidation=False' runat='server'/></td>
	</tr>
	<tr id='trTask' visible='false'>
		<td><b><span id='spnTask' runat='server'>Task</span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlTask' Type='cDropDown' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='btnTask' Type='cButton' Properties='Caption=Go&CausesValidation=False' runat='server'/></td>
	</tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		

</table>
<EasyGrants:cPageContentListing id='ctlPageContentListing' visible='true' runat='server'/>

<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>																		
																				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram'
						Container='spnProgram'
						Type='cDropDown'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramDisplayName'>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmitProgram'
						Container='spnSubmitProgram'
						Type='cButton'
						visible='false' 
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='GoClick'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Program' />
								<Argument Type='Control' TypeKey = 'ctlProgram' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
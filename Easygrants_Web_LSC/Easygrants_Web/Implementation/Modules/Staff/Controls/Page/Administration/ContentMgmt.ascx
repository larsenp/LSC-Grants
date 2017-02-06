<%@ Control Language="vb" AutoEventWireup="True" Codebehind="ContentMgmt.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cContentMgmt" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' tagname='Content_Mgmt' src='../../PageSection/Content_Mgmt.ascx' %>
<%@ register Tagprefix='Crumb' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Crumb:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Root' Key='Tasks' LinkTitle='Tasks' runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>

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
		<td colspan=2><span id='spnProgram' runat='server'/></td>
	</tr>
	<tr id='trCmpt' visible='false'>
		<td><b><span id='spnCmpt' runat='server'><%=GetLabel("FundingOpportunity")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td colspan=2><Core:cUserCtlLoader CtlID='ctlCmpt' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr id='trProject' visible='false'>
		<td><b><span id='spnProject' runat='server'><%=GetLabel("FundingCycleName")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td colspan=2><Core:cUserCtlLoader CtlID='ctlProject' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr id='trTask' visible='false'>
		<td><b><span id='spnTask' runat='server'>Task</span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlTask' Type='cDropDown' runat='server'/></td>
		<td><Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='btnCopy' Type='cButton' Properties='Caption=Copy&CausesValidation=False' runat='server' /></td>
	</tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		

</table>
<EasyGrants:Content_Mgmt id='Content_Mgmt' visible='true' runat='server'/>

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
								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
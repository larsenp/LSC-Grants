<%@ Control Language="vb" AutoEventWireup="true" Inherits="EasyGrants.Controls.Base.cSelectCompetition" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="SelectCompetition.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td width='20%'><b><%=GetLabel("ProgramName")%></b></td>
		<td><span id='spnProgram' runat='server'/>&nbsp;<span id='spnSelectProgram' runat='server'/></td>
	</tr>
	<tr id='trCompetition' visible='false'>
		<td><b><span id='spnCompetition' runat='server'><%=GetLabel("FundingOpportunity")%></span></b></td>
		<td><Core:cUserCtlLoader CtlID='ctlCompetition' Type='cDropDown' runat='server'/>&nbsp;<Core:cUserCtlLoader CtlID='btnCompetition' Type='cButton' Properties='Caption=Go' runat='server'/></td>
	</tr>
</table>
<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram'
						Container='spnProgram'
						Type='cDropDown'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramDisplayName'>
						<Sort>
							<Argument PropertyKey='ProgramDisplayName'/>
						</Sort>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSelectProgram'
						Container='spnSelectProgram'
						Type='cButton'
						visible='false' 
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='SelectProgram'>
						</Action>
					</Control>	
				</DisplayProperty>
								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

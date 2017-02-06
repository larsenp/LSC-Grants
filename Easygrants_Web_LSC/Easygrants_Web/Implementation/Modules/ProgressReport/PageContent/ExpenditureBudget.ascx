<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ProgressReport.PageContent.cExpenditureBudget" CodeBehind="ExpenditureBudget.ascx.vb"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
</br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table3" width="100%">
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2" class="SeparatorHdg">Primary Contact/PI</td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td	width='20%'><b>Name</b></td>
		<td><span id='spnName' runat='server'/></td>
	</tr>
	<tr>
		<td	width='20%'><b><%=GetLabel("Organization")%></b></td>
		<td><span id='spnOrganization' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table4" width="100%">
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2" class="SeparatorHdg">Budget Period</td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td width='20%'><b>Select:</b></td><td><Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlPeriod' Type='cDropDown' runat='server'/>&nbsp;&nbsp<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='btnGo' Type='cButton' Properties='Caption=Go' runat='server'/></td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width="100%" id="tblHeading" >
	<tr><td colspan="2" class="SeparatorHdg">Budget Detail</td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
</table>

<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='6' runat='server' width='50%' >
</table>
<br />
<table id="tblButtons" runat="server" width='100%' cellspacing='0' border="0" cellpadding='6'>
	<tr >
		<td align="center">
			<span runat='server' id='spnCalculate'/> 
			<span runat='server' id='spnContinue'/> 
		</td>
	</tr>
</table>

<%--<center>
	<table id='tblSaveClose' runat='server'>	
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<span runat='server' id='spnSave_and_Continue'/>
			</td>
		<td>
			<span runat='server' id='spnClose'/>
		</td>
		</tr>
	</table>
</center>--%>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>	
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
                <DisplayProperty PropertyKey='PrimaryPerson.FirstNameLastName'>
                    <Control ID='spnName' Type='HtmlGenericControl'/>
                </DisplayProperty>
                 <DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName' >
                    <Control ID='spnOrganization' Type='HtmlGenericControl'/>
                </DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalculate'
						Container='spnCalculate'
						Type='cButton'
						Image='Save and Calculate'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='RecalculateBudget'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Type='cButton'
						Image='Continue'
						GoToNextPage='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'>							
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
  
  <!-- USER MODIFIABLE CONTENT AREA  -- new control for previousGAR Easygrants_Web.Controls.Base.cWfTADataPresenterCtl-->
  
  <table width='100%' border="0" cellpadding='2' cellspacing='0'>
 <%-- <span id='spnAwardee' runat='server' visible='false'>--%>
    <tr>
	  <td colspan="4" >&nbsp;</td>
    </tr>
	<tr id="Tr1" visible='true' runat='server'>
		 <td colspan="4" class="SeparatorHdg">Previous Year's Grant Activity Reports</td>
	</tr>
	
   <%-- <tr>
         <td><span runat='server' id='spnReturnHome' visible='true' /></td>
    </tr>--%>
 
    <tr><td><span id='spnGarCyclelist' runat='server'/></td></tr>
	<%--<tr>
		
		<td><span id='spnformdesc' runat='server'/></td>
		
	    <td><span id='spnservicearea' runat='server' /></td>
		
     	<td><span id='spncycleyear' runat='server' /></td>
	
	</tr>--%>
<%--</span>--%>
            
  </table>
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
     <ModuleSection>

		   
		<DataObject Key='PriOrganization' DataObjectDefinitionKey='PersonOrganizationAffiliation'>
				<Filters>
			            <Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
			            <Argument PropertyKey='IsPrimaryOrganizationContact' Value='True'/>
		         </Filters>
		</DataObject>
		
		<DataObject Key='ToDoListPrevGarCycleList' DataObjectDefinitionKey='ToDoListPrevGarCycle'>
				<Filters>
			            <Argument Type='DataObjectCollection' TypeKey='PriOrganization' DataObjectPropertyKey='OrganizationID' PropertyKey='PriOrgID' />
		         </Filters>
		         <Sort>
			            <Argument PropertyKey='LscGarCycleID' Direction='Descending'/>
		         </Sort>
		    <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlcycle'
						Container='spnGarCyclelist'
						Type='cDataPresenterList'
						DataPresenterID='DPL'
						DataPresenterURL='Implementation/Modules/Home/Controls/Page/PreviousGARList.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
   <%--  <DataObject Key='ToDoListPrevGarCycleList' DataObjectDefinitionKey='ToDoListPrevGarCycle'>
		     <Filters>
			      <Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
		     </Filters>
		     <Sort>
			      <Argument PropertyKey='LscGarCycleID' Direction='Descending'/>
		     </Sort>--%>
		    
		
		
		
      </ModuleSection>
 </span>


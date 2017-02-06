<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br>
      <span id='spnPageContent' runat='server' />
		<table width='100%' border="0" cellpadding="0" cellspacing="0">
		  <tr>
            <td><h1>Budget (Form D) </h1></td>
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
                <td valign="top" ><p>The <strong>Budget (Form D)</strong> page captures information on projected expenses and projected revenue. </p>
                    <ul>
                      <li>To add a new information, click <strong>Add</strong></li>
                      <li>To edit existing information, click <strong>Edit</strong></li>
                      <li>To delete information, click <strong>Delete</strong></li>
                      <li>To go to the next page, click <strong>Continue</strong></li>
                    </ul>
                    <p><strong><font color="#990000">Note: The following sections need to be completed by all applicants:</font></strong></p>
                    <ul>
                      <li> Projected Expenses (Form D-12)</li>
                      <li>Projected Revenue (Form D-14)</li>
                    </ul>
                 </td>
                <td >&nbsp;</td>
                <td >&nbsp;</td>
                <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
              </tr>
            </table></td>
	      </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
	
		<Core:cUserCtlLoader CtlID='ctlBudgetInfo1' 
			Src='Implementation/Modules/Application/Controls/PageSection/BudgetInfo.ascx'
			runat='server'
			Properties='CategoryTypeID=1'/>		

		  <Core:cUserCtlLoader CtlID='ctlBudgetInfo2' 
				Src='Implementation/Modules/Application/Controls/PageSection/BudgetInfo.ascx'
				runat='server'
				Properties='CategoryTypeID=2'/>

		  		
				<!-- USER MODIFIIABLE CONTENT AREA -->

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td>			
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

<!-- End Embedded XML -->
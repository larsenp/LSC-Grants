<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<table  border="0" cellspacing="0" cellpadding="0" WIDTH="100%">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Letter of Intent to Apply for Funding</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
  <tr>
    <td>
		<p>Provide a response to each of the questions below. You must provide answers to all questions in order to submit your Letter of Intent.</p>
		<ul>
			<li>Use the <b>Save</b> button to save your information and remain on this page.</li>
			<li>Use the <b>Save and Continue</b> button to save your information and continue to the Review and Submit page.</li>
			<li>After saving your information, you can log out and return to the system later; your information will be preserved.</li>
		</ul>
    </td>
  </tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_LOI/Forms/GranteeInfoTIGLOI.ascx'
	runat='server'/>
<br />
<div width='100%' class='SeparatorHdg'>
	Detail
</div>
<br />
<table cellpadding='2'>
   <tr>
      <td width='30'>&nbsp;</td>
      <td valign="top" width='150'><b>Amount Request&nbsp;</b></td>
      <td>$<span id='spnRequestedAmount' runat='server'/></td>
  </tr>
</table>
<br />
<table id="Table2" runat='server' width='100%' border='0' cellspacing='0' cellpadding='1' >
  <tr valign='top'>
		<td><b>Previous Web Site Grants</b> - To be eligible for a Renewal Web Site Grant you must
have reported on and been approved by LSC for successful achievement of the milestones of your First Web Site
Grant through the third payment period. To be eligible for a Continuation Web Site Grant you must have reported
on and been approved by LSC for successful achievement of the milestones of your Renewal Web Site Grant
through the first payment period. The deadline for this reporting and approval is April 3, 2009. Have you reported
on and been approved from payment by LSC for these required milestones? If not, please explain how you plan to
have this done by the deadline of April 3, 2009.</td>
   </tr>
    <tr>
       <td>&nbsp;</td>
    </tr>
   <tr>
		<td><span id='spnPrevWeb' runat='server'/></td>
   </tr>
   <tr>
		<td colspan=7><HR></td>
  </tr>
  <tr>
       <td>&nbsp;</td>
  </tr>
  <tr valign='top'>
		<td ><b>Non-Web Site TIG Grants</b> - Is your reporting up to date on all other open TIG Grants? If not, why not and
when do you expect to be up to date?</td>
   </tr>
   <tr>
       <td>&nbsp;</td>
    </tr>
   <tr>
		<td colspan=4><span id='spnNonWeb' runat='server'/></td>
   </tr>
   <tr>
		<td colspan=7><HR></td>
  </tr>
  <tr valign='top'>
		<td ><b>Additional Information</b> - Provide any additional information about your Web Site Grant request that you believe
would be useful for LSC to consider.</td>
   </tr>
    <tr>
       <td>&nbsp;</td>
   </tr>
   <tr>
		<td colspan=4><span id='spnAddInfo' runat='server'/></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
</table>
<br />
<table width='100%'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
   <ModuleSection>
	 
<%--	 <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
	     <Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
		 </Filters>
		<DisplayProperties>
			       <DisplayProperty PropertyKey='LegacyGrantID'>
					  <Control ID='spnLegacyGrantID'
						Type='HtmlGenericControl'>
					  </Control>
				   </DisplayProperty>
				   <DisplayProperty PropertyKey='LscGranteeProjectTig.LscTigGrantType.Description'>
					  <Control ID='spnCategory'
						Type='HtmlGenericControl' />
				   </DisplayProperty>
		</DisplayProperties>
	</DataObject>--%>
	
	
	<DataObject Key='LSCTIGLOI' DataObjectDefinitionKey='LSCTIGLOI' Updatable='True' CreateNew='True'>
	    <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		</Filters>
		<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		</DefaultValues>
		<DisplayProperties>
		      <DisplayProperty PropertyKey='RequestedAmount'>
					<Control ID='ctlRequestedAmount'
						Container='spnRequestedAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0.00'
						Size='25'
						MaxInputDecimalPlaces='2'
						MaximumValue='100'
						RegExErrorMessage='The Payment Amount requires a valid currency format (Example: 100,000.00). '
						DecimalErrorMessage='The Payment Amount requires a valid currency format (Example: 100,000.00). '
						CommaErrorMessage='The Payment Amount requires a valid currency format (Example: 100,000.00). ' >
					</Control>
				</DisplayProperty>
	            <DisplayProperty PropertyKey='PrevWeb'>
					<Control ID='ctlPrevWeb'
						Container='spnPrevWeb'
						Type='cTextArea'
						Rows='10'
						Cols='100'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonWeb'>
					<Control ID='ctlNonWeb'
						Container='spnNonWeb'
						Type='cTextArea'
						Rows='10'
						Cols='100'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AddInfo'>
					<Control ID='ctlAddInfo'
						Container='spnAddInfo'
						Type='cTextArea'
						Rows='10'
						Cols='100'>						
					</Control>
				</DisplayProperty>
		</DisplayProperties>
	</DataObject>

	<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
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


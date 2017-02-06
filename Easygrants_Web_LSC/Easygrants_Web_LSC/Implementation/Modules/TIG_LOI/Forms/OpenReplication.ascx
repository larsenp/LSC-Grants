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
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>
		<p>Provide a response to each of the questions below. You must provide answers to all questions in order to submit your Letter of Intent (LOI). The total length of the LOI should be approximately two (2) pages. To ensure an appropriate response length, the system will limit the character length for each section to either 2500 characters (for Description of Project and Major Benefits) or 1500 characters (for Estimated Costs, Major Partners, and Innovation/Replication). If you’re typing text into the text box for a question and you exceed the character length, the page will simply erase any additional characters as you continue to type. If you paste text into this text box from a different source, the text will be cut off after the character limit. </p>
		
		<p>Also, please avoid complex formatting such as bulleted or numbered lists in the response fields below. Approach each field like you would a plain text editor such as Microsoft Notepad.</p>
		<ul>
			<li>Use the <b>Save</b> button to save your information and remain on this page.</li>
			<li>Use the <b>Save and Continue</b> button to save your information and continue to the Review and Submit page.</li>
			<li>After saving your information, you can log out and return to the system later; your information will be preserved.</li>
			<li>Please note that you could be logged out of the system after a period of inactivity.</li>
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
 <table>
     <tr>
      <td width='30'>&nbsp;</td>
      <td><b>Are you also requesting funding for this project through LSC’s Pro Bono Innovation Fund program ?&nbsp;</b></td>
      <td><span id='spnParallelPBIF' runat='server'/></td>
  </tr>
 </table>
 <table>
     <tr>
      <td width='30'>&nbsp;</td>
      <td><b>Are you applying for a Pro Bono Innovation Fund that complements this grant? &nbsp;</b></td>
      <td><span id='spnApplyForPBIF' runat='server'/></td>
  </tr>
</table>
<br />
<table runat='server' width='100%' border='0' cellspacing='0' cellpadding='1' >
  <tr valign='top'>
		<td ><b>Description of Project (maximum 2500 characters)</b> - Briefly describe the basic elements of the project, including the specific technology(ies) the project will develop or implement; how they will be developed, how
they will operate, the function they will serve within the legal services delivery system, their expected impact, and
similar factors. (The impact should only be highlighted here; more details about the system's benefits should be
provided below.)</td>
   </tr>
    <tr>
       <td>&nbsp;</td>
    </tr>
   <tr>
		<td><span id='spnDesc' runat='server'/></td>
   </tr>
   <tr>
		<td colspan=7><HR></td>
  </tr>
  <tr>
       <td>&nbsp;</td>
  </tr>
  <tr valign='top'>
		<td ><b>Major Benefits (maximum 2500 characters)</b> - Describe the specific ways in which the project will increase or improve services to clients
and/or enhance the effectiveness and efficiency of program operations. To the extent feasible, discuss both the
qualitative and quantitative aspects of these benefits.</td>
   </tr>
   <tr>
       <td>&nbsp;</td>
    </tr>
   <tr>
		<td colspan=4><span id='spnBenefits' runat='server'/></td>
   </tr>
   <tr>
		<td colspan=7><HR></td>
  </tr>
  <tr valign='top'>
		<td ><b>&nbsp;Estimated Costs (maximum 1500 characters)</b> - Start by stating the amount of funding you are seeking from the TIG program, and then give
the estimated total project cost, summarizing the anticipated costs of the major components of the project. List
anticipated contributions, both in-kind and monetary, of all partners involved in the project.</td>
   </tr>
    <tr>
       <td>&nbsp;</td>
   </tr>
   <tr>
		<td colspan=4><span id='spnCosts' runat='server'/></td>
   </tr>
   <tr>
		<td colspan=7><HR></td>
  </tr>
  <tr valign='top'>
		<td ><b>&nbsp;Major Partners (maximum 1500 characters)</b> - Identify organizations that are expected to be important partners. Specify the role(s) each
partner will play.</td>
   </tr>
    <tr>
       <td>&nbsp;</td>
   </tr>
   <tr>
		<td colspan=4><span id='spnPartners' runat='server'/></td>
   </tr>
    <tr>
		<td colspan=7><HR></td>
  </tr>
  <tr valign='top'>
		<td ><b>&nbsp;Innovation/Replication (maximum 1500 characters)</b> - Identify how and why the proposed project is new and innovative and/or is a replication or adaptation of a previous technology project.
Identify how and why the proposed project can significantly benefit and/or be replicated by other legal services
providers and/or the community at large. </td>
   </tr>
    <tr>
       <td>&nbsp;</td>
   </tr>
   <tr>
		<td colspan=4><span id='spnInnovation' runat='server'/></td>
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
	 
	 <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
	     <Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
				</Argument>
		 </Filters>
		 <%--<DisplayProperties>
			     <DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnLegacyGrantID'
						Type='HtmlGenericControl'>
					</Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='LscGranteeProjectTig.LscTigGrantType.Description'>
					<Control ID='spnCategory'
						Type='HtmlGenericControl' />
				</DisplayProperty>
		 </DisplayProperties>--%>
	</DataObject>
	
	
	<DataObject Key='LSCTIGLOI' DataObjectDefinitionKey='LSCTIGLOI' Updatable='True' CreateNew='True'>
		<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' >
				</Argument>
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
						RegExErrorMessage='The Payment Amount requires a valid currency format (Example: 100,000.00). '
						DecimalErrorMessage='The Payment Amount requires a valid currency format (Example: 100,000.00). '
						CommaErrorMessage='The Payment Amount requires a valid currency format (Example: 100,000.00). '
						ErrorMessage='Payment Amount is required.'>
					</Control>
				</DisplayProperty>
	            <DisplayProperty PropertyKey='ProjectDesc'>
					<Control ID='ctlDesc'
						Container='spnDesc'
						Type='cTextArea'
						Rows='10'
						Cols='100'
						ErrorMessage='Description is required.'
						MaxLength='2500'
						TooLongMessage='Description must be limited to 2500 characters.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Benefits'>
					<Control ID='ctlBenefits'
						Container='spnBenefits'
						Type='cTextArea'
						Rows='10'
						Cols='100'
						ErrorMessage='Major Benefits Field is required.'
						MaxLength='2500'
						TooLongMessage='Major Benefits must be limited to 2500 characters.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Costs'>
					<Control ID='ctlCosts'
						Container='spnCosts'
						Type='cTextArea'
						Rows='10'
						Cols='100'
						ErrorMessage='Costs Field is required.'
						MaxLength='1500'
						TooLongMessage='Costs must be limited to 1500 characters.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Partners'>
					<Control ID='ctlPartners'
						Container='spnPartners'
						Type='cTextArea'
						Rows='10'
						Cols='100'
						ErrorMessage='Major Partners Field is required.'
						MaxLength='1500'
						TooLongMessage='Major Partners must be limited to 1500 characters.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Innovation'>
					<Control ID='ctlInnovation'
						Container='spnInnovation'
						Type='cTextArea'
						Rows='10'
						Cols='100'
						ErrorMessage='Innovation/Replication/Sustainability Field is required.'
						MaxLength='1500'
						TooLongMessage='Innovation/Replication/Sustainability must be limited to 1500 characters.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ParallelPBIF'>
					<Control ID='ctlParallelPBIF'
						Type='cRadioButtonList'
						Container='spnParallelPBIF'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ApplyForPBIF'>
					<Control ID='ctlApplyForPBIF'
						Type='cRadioButtonList'
						Container='spnApplyForPBIF'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
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

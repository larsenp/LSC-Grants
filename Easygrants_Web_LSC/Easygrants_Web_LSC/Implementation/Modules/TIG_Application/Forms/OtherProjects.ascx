<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />

<div style="width:100%" class="SeparatorHdg">
	Instructions
</div>
<p>In this section, elaborate on how the proposed project relates to prior TIG and legal aid technology projects (not just projects the applicant has completed, but related TIG or technology projects of other programs); how it builds upon them, what was learned from them, and how it will differ from and improve upon the past projects. Information about past TIG awards is available online at <a href='http://www.lsc.gov/grants-grantee-resources/our-grant-programs/technology-initiative-grant-program/past-technology' target="_blank">http://www.lsc.gov/grants-grantee-resources/our-grant-programs/technology-initiative-grant-program/past-technology</a>.</p>
<div width='100%' class='SeparatorHdg'>
	Other Projects
</div>
<br />
<b>What other projects by your program or others in the legal aid community - either funded by TIG or by another source - have sought to address this or similar issues?</b><font color='red'>*</font><br />
<span runat='server' id='spnOtherSimilarProjects' />
<br /><br />
<b>How will the proposed project differ from and incorporate the lessons from those projects?</b><font color='red'>*</font>
<span runat='server' id='spnCurrProjDifference' />
<br /><br />
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>

  <!-- Embedded XML Page Functionality - please do not edit -->
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
				<DisplayProperty PropertyKey='OtherSimilarProjects'>
					<Control ID='txtOtherSimilarProjects'
						Type='cTextArea'
						Container='spnOtherSimilarProjects'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CurrProjDifference'>
					<Control ID='txtCurrProjDifference'
						Type='cTextArea'
						Container='spnCurrProjDifference'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
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
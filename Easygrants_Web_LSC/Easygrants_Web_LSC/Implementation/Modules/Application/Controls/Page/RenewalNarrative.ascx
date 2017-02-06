<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div style='width:600px'>
	<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
		<tr>
		  <td colspan="4"><h1>Renewal Inquiries</h1></td>
	  </tr>
		<tr>
			<td colspan="4" class="SeparatorHdg">Instructions</td>
		</tr>
		<tr>
			<td colspan="4" >&nbsp;</td>
		</tr>
		<tr>
			<td valign="top" >
				<p>LSC uses the grant renewal application to remain current on the legal services delivery system and help determine whether there have been substantive changes or unexpected developments in the grantee’s delivery system since the submission of the competitive grant application. </p>
				<p>The grant renewal inquiry topics coincide with the major topics of the applicant’s most recent competitive grant narrative, and the inquiries address significant changes or unexpected developments in the delivery system described in that narrative. </p>
				<p>Review the delivery approach described in the most recent competitive grant narrative before preparing the response. For each Performance Area, if there have been no unexpected developments or significant changes to the delivery system described in the most recent competitive grant narrative, indicate this and continue to the next outline topic. If there have been unexpected developments or significant changes to the delivery system described in the most recent competitive grant narrative, indicate “Yes,” and provide a brief description of those significant changes or unexpected developments.</p>
				<p style="color:red">For those applying to multiple service areas: This RFP Chart is not linked across service areas. Applicants should enter information into this form that is specific to this service area.</p>
				<p>A yes or no response is required for each Performance Area. If the applicant indicates that there have been changes or developments, use the text box to provide a description. </p>
				<p>Click the <strong>Save</strong> button to save the responses entered. When finished, click the <strong>Save and Continue</strong> button to continue.</p>
				<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>
			</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td width="160" valign="top" >
				<Core:cUserCtlLoader CtlID='ctlQuickLinks' 
					Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
					runat='server'/>
			</td>
		</tr>
		<tr>
			<td valign="top" >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td valign="top" >&nbsp;</td>
		</tr>
	</table>
	
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
		Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
		runat='server'/>
	
	<div class="SeparatorHdg">
		Renewal Narrative
	</div>
	<p><strong>Performance Area One</strong>:  Effectiveness in identifying the most pressing civil legal needs of low-income people in the service area and targeting resources to address those needs (i.e., periodic comprehensive assessment and ongoing consideration of the most pressing legal needs; setting goals and objectives, developing strategies and allocating resources; and evaluation and adjustment).</p>
	
	<p>Have there been any significant changes or unexpected developments to the delivery system as it was described in applicant’s most recent competitive grant narrative? If yes, describe in the text box below. In addition, in the text box, in a single sentence, state “yes” or “no” as to whether applicant collects outcomes for extended services cases in its case management system or other system.  As an example, if you do collect outcomes enter “Yes, [applicant name] collects outcomes for extended services cases in its case management system.”</p>
	<span runat='server' id='spnPA1SignificantChanges'/><br />
	<p>In addition, in the text box, In a single sentence state “yes” or “no” as to whether applicant collects outcomes achieved for clients for all extended services cases.  As an example, if you do collect outcomes enter “Yes, [applicant name] collects outcomes achieved for clients for all extended services cases.”</p>
	Describe:<br />
	<span runat='server' id='spnPA1Response'/>

	<hr style="color:#dddddd; height:2px; margin-top:10px"/>

	<p><strong>Performance Area Two</strong>:  Effectiveness in engaging and serving the low-income population throughout the service area (i.e., dignity and sensitivity; engagement with the low-income population; and access and utilization by the low-income population).</p>
	
	<p>Have there been any significant changes or unexpected developments to the delivery system as it was described in applicant’s most recent competitive grant narrative? If yes, describe in the text box below. </p>
	<span runat='server' id='spnPA2SignificantChanges'/><br />
	Describe:<br />
	<span runat='server' id='spnPA2Response'/>

	<hr style="color:#dddddd; height:2px; margin-top:10px"/>

	<p><strong>Performance Area Three</strong>:  Effectiveness of legal representation and other program activities intended to benefit the low-income population in its service area (i.e., legal representation; private attorney involvement; other program services to the eligible client population; and other program activities on behalf of the eligible client population).</p>
	
	<p>Have there been any significant changes or unexpected developments to the delivery system as it was described in applicant’s most recent competitive grant narrative? If yes, describe in the text box below. </p>
	<span runat='server' id='spnPA3SignificantChanges'/><br />
	Describe:<br />
	<span runat='server' id='spnPA3Response'/>

	<hr style="color:#dddddd; height:2px; margin-top:10px"/>

	<p><strong>Performance Area Four</strong>:  Effectiveness of governance, leadership and administration (i.e., board governance; leadership; overall management and administration; financial administration; human resources administration; internal communication; general resource development and maintenance; and participation in an integrated legal services delivery system). </p>
	
	<p>Have there been any significant changes or unexpected developments to the delivery system as it was described in applicant’s most recent competitive grant narrative? If yes, describe in the text box below. </p>
	<span runat='server' id='spnPA4SignificantChanges'/><br />
	Describe:<br />
	<span runat='server' id='spnPA4Response'/>

	<div style="text-align:center; margin-top:10px">
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnContinue'/>
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWftaPostPQVApp' DataObjectDefinitionKey='LscWftaPostPQVApp' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PA1SignificantChanges'>
					<Control ID='ctlPA1SignificantChanges'
						Type='cRadioButtonList'
						Container='spnPA1SignificantChanges'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='False' DisplayValue='No, there have been no significant changes or unexpected developments in Performance Area One.'/>
							<Parameter StoredValue='True' DisplayValue='Yes, there have been significant changes or unexpected developments in Performance Area One.'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PA1Response'>
					<Control ID='txtPA1Response'
						Type='cTextArea'
						Container='spnPA1Response'
						Rows='6'
						Cols='80'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='PA2SignificantChanges'>
					<Control ID='ctlPA2SignificantChanges'
						Type='cRadioButtonList'
						Container='spnPA2SignificantChanges'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='False' DisplayValue='No, there have been no significant changes or unexpected developments in Performance Area Two.'/>
							<Parameter StoredValue='True' DisplayValue='Yes, there have been significant changes or unexpected developments in Performance Area Two.'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PA2Response'>
					<Control ID='txtPA2Response'
						Type='cTextArea'
						Container='spnPA2Response'
						Rows='6'
						Cols='80'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='PA3SignificantChanges'>
					<Control ID='ctlPA3SignificantChanges'
						Type='cRadioButtonList'
						Container='spnPA3SignificantChanges'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='False' DisplayValue='No, there have been no significant changes or unexpected developments in Performance Area Three, nor has there been a shift of 20% or more, from 2014 to 2015, in Basic Field – General CSRs and/or PAI CSRs.'/>
							<Parameter StoredValue='True' DisplayValue='Yes, there have been significant changes or unexpected developments in Performance Area Three, and/or there has been a shift of 20% or more, from 2014 to 2015, in Basic Field – General CSRs and/or PAI CSRs.'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PA3Response'>
					<Control ID='txtPA3Response'
						Type='cTextArea'
						Container='spnPA3Response'
						Rows='6'
						Cols='80'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='PA4SignificantChanges'>
					<Control ID='ctlPA4SignificantChanges'
						Type='cRadioButtonList'
						Container='spnPA4SignificantChanges'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='False' DisplayValue='No, there have been no significant changes or unexpected developments in Performance Area Four; nor has there been any of the following: 1) an increase or decrease in full-time staff of 20% or more from 2014 to 2015, 2) an increase or decrease in total non-LSC funding of 20% or more from 2014 to 2015, or 3) a change in applicant’s delivery system or corporate structure
.'/>
							<Parameter StoredValue='True' DisplayValue='Yes, there have been significant changes or unexpected developments in Performance Area Four, and/or there has been:  1) an increase or decrease in full-time staff of 20% or more from 2014 to 2015, 2) an increase or decrease in total non-LSC funding of 20% or more from 2014 to 2015, or 3) a change in applicant’s delivery system or corporate structure.'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PA4Response'>
					<Control ID='txtPA4Response'
						Type='cTextArea'
						Container='spnPA4Response'
						Rows='6'
						Cols='80'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Save and Continue'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue without Saving'
						Type='cButton'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Budget' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
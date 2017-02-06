<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>The Standard Grant Renewal Review is used to help determine whether there have been significant changes or unexpected developments in the grantee's delivery system since the submission of the most recent competitive grant application that would affect the funding recommendation to renew the grant.  
Review the renewal narrative for any significant changes or unexpected developments in the delivery system approved in the most recent competitive grant application. 
</p>
<!--<ul>
	<li>10% or more change in staff</li>
	<li>Opening or closing of one or more offices</li>
	<li>Loss, theft or embezzlement of funding or property</li>
	<li>Change in program priorities</li>
	<li>Change in grantee intake system</li>
	<li>Increase or decrease in funding from non-LSC sources</li>
	<li>Early results or delay in client needs assessment</li>
	<li>Natural disaster, flood or fire damage</li>
	<li>Purchase of new telephone system</li>
	<li>Change in grantee approach in client service delivery</li>
</ul> -->

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	Renewal Inquiries Review
</div>
<%--<p>(Check the narrative to see that changes described do not raise significant issues.)</p>--%>
<p><b>Do the responses to the Renewal Inquiries indicate significant issues that would affect the funding recommendation to renew the grant? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnFormL' /></p>

<p>If yes, concisely state in the box below the significant issues identified in the responses to the Renewal Inquiries that would affect the funding recommendation to renew grant.</p>
<span runat='server' id='spnCommentL' />
<br /><br />
<p>Check the boxes (where applicable), if the narrative describes exceptional work in any of the following areas.</p>
<table>
	<tr>
		<td>
			<span runat='server' id='spnManagement'/>&nbsp;
			Management/Strategic Planning
		</td>
		<td width='20'>&nbsp;</td>
		<td>
			<span runat='server' id='spnPai'/>&nbsp;
			PAI
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnIntake'/>&nbsp;
			Intake
		</td>
		<td>&nbsp;</td>
		<td>
			<span runat='server' id='spnCoordination'/>&nbsp;
			Coordination within the delivery system
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnTechno'/>&nbsp;
			Technology
		</td>
		<td>&nbsp;</td>
		<td>
			<span runat='server' id='spnResourceDevelopment'/>&nbsp;
			Resource Development
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnProSe'/>&nbsp;
			Pro Se
		</td>
		<td>&nbsp;</td>
		<td>
			<span runat='server' id='spnForeclosure'/>&nbsp;
			Foreclosure/Homelessness prevention
		</td>
	</tr>
</table>
<br />
<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalEval' DataObjectDefinitionKey='LscRenewalEval' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FormL'>
					<Control ID='ctlFormL'
						Type='cRadioButtonList'
						Container='spnFormL'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommentL'>
					<Control ID='txtCommentL'
						Type='cTextArea'
						Container='spnCommentL'
						Rows='8'
						Cols='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Management'>
					<Control ID='chkManagement'
						Type='cCheckBox'
						Container='spnManagement'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Intake'>
					<Control ID='chkIntake'
						Type='cCheckBox'
						Container='spnIntake'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Techno'>
					<Control ID='chkTechno'
						Type='cCheckBox'
						Container='spnTechno'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProSe'>
					<Control ID='chkProSe'
						Type='cCheckBox'
						Container='spnProSe'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Pai'>
					<Control ID='chkPai'
						Type='cCheckBox'
						Container='spnPai'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Coordination'>
					<Control ID='chkCoordination'
						Type='cCheckBox'
						Container='spnCoordination'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ResourceDevelopment'>
					<Control ID='chkResourceDevelopment'
						Type='cCheckBox'
						Container='spnResourceDevelopment'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Foreclosure'>
					<Control ID='chkForeclosure'
						Type='cCheckBox'
						Container='spnForeclosure'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'
						Caption='Save and Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

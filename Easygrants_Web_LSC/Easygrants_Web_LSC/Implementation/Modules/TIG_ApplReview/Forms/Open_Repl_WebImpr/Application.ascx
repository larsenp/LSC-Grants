<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.TIG_ApplReview.Forms.cApplication" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div style="width:600px">
	<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
		Src='Core/Controls/Base/ValidationSummary.ascx'
		runat='server'/>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
		Src='Implementation/Modules/TIG_ApplReview/Forms/ReviewInfo.ascx'
		runat='server'/>
		
	<div class='SeparatorHdg'>Information from Applicant's Form</div>
	 <table cellpadding='1' width='600px'>
		<tr>
			<td>
				<b>Category</b>&nbsp;
				<span runat='server' id='spnTigGrantType' />
			</td>
			<td>
				<b>Grant Term</b>&nbsp;
				<span runat='server' id='spnGrantTermMonths' /> months
			</td>
		</tr>
		<tr>
			<td>
				<b>Total Grant Request</b>&nbsp;
				<span runat='server' id='spnGrantRequest' />
			</td>
			<td>
				<b>Total Project Budget</b>&nbsp;
				<span runat='server' id='spnProjectBudget' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				<b>Areas of Interest</b><br />
				<span runat='server' id='spnAreasOfInterest' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				<b>Are you also submitting an application to request funding for this project to the Pro Bono Innovation Fund?</b><br />
				<span runat='server' id='spnPBIFAppSameProject' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				<b>Are you applying for a Pro Bono Innovation Fund that complements this grant?</b><br />
				<span runat='server' id='spnApplyForPBIFComplements' />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='2'>
				<b>Brief Description of Proposed Project</b><br />
				<span runat='server' id='spnBriefDescription' />
			</td>
		</tr>
	</table>
	<br />
	<div class='MinorSeparatorHdg'>
		Secondary Contact Information
	</div>
	<br />
	<table style="width:100%; padding:1; border:0">
		<tr>
			<td>
				<b>Name</b>
			</td>
			<td>
				<span runat='server' id='spnSecondaryContactFirstName' /> 
				<span runat='server' id='spnSecondaryContactMiddleName' /> 
				<span runat='server' id='spnSecondaryContactLastName' />
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				<b>Address</b>
			</td>
			<td>
				<span runat="server" id='spnSecondaryContactAddress1' /><br />
				<span runat="server" id='spnSecondaryContactAddress2' /><br />
				<span runat="server" id='spnSecondaryContactCity' />, 
				<span runat="server" id='spnSecondaryContactStateProvinceID' /> 
				<span runat="server" id='spnSecondaryContactZip' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Telephone</b>
			</td>
			<td>
				<span runat='server' id='spnSecondaryContactPhone' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Fax</b>
			</td>
			<td>
				 <span runat='server' id='spnSecondaryContactFax' />
			</td>
		</tr>
		<tr>
			<td>
				<b>E-mail</b> 
			</td>
			<td>
				 <span runat='server' id='spnSecondaryContactEmail' />
			</td>
		</tr>
	</table>
	<br />
	
	<div class='SeparatorHdg'>
		Review Information
	</div>
	<br />
	<div runat='server' id='divSecondary' >
		As a secondary reviewer, you do not have to complete the Application form.
	</div>
	<div runat='server' id='divPrimary' visible="false">
		<b>Purpose</b> <span runat='server' id='spnPurpose' style="vertical-align:top" />
	</div>
	<br />
	<div style="text-align:center">
		<span runat='server' id='spnSave' />
		<span runat='server' id='spnSaveContinue' />
		<span runat='server' id='spnContinue' />
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
		</DataObject>
		<DataObject Key='LscGranteeProjectTig' DataObjectDefinitionKey='LscGranteeProjectTig' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscTigGrantType.Description'>
					<Control ID='spnTigGrantType'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Purpose'>
					<Control ID='txtPurpose'
						Type='cTextArea'
						Container='spnPurpose'
						Rows='5'
						Cols='60' />
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
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Continue'
						Save='False'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantTermMonths'>
					<Control ID='spnGrantTermMonths'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantRequest' Format='$#,0'>
					<Control ID='spnGrantRequest'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectBudget' Format='$#,0'>
					<Control ID='spnProjectBudget'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PBIFAppSameProject' Format='YesNo'>
					<Control ID='spnPBIFAppSameProject'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ApplyForPBIFComplements' Format='YesNo'>
					<Control ID='spnApplyForPBIFComplements'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='BriefDescription'>
					<Control ID='spnBriefDescription'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTIGAppAreasOfInterest' DataObjectDefinitionKey='LscTIGAppAreasOfInterest' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigApp' DataObjectPropertyKey='LscTigAppID' PropertyKey='LscTigAppID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstAreasOfInterest'
						Type='cDataListCtl'
						Container='spnAreasOfInterest'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='LscAreasOfInterestLKP.Description'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigSecondaryContact' DataObjectDefinitionKey='LscTigSecondaryContact' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NameFirst'>
					<Control ID='spnSecondaryContactFirstName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NameMiddle'>
					<Control ID='spnSecondaryContactMiddleName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NameLast'>
					<Control ID='spnSecondaryContactLastName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address1'>
					<Control ID='spnSecondaryContactAddress1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Address2'>
					<Control ID='spnSecondaryContactAddress2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='City'>
					<Control ID='spnSecondaryContactCity'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='St'>
					<Control ID='spnSecondaryContactStateProvinceID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ZipPostalCode'>
					<Control ID='spnSecondaryContactZip' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneNumber'>
					<Control ID='spnSecondaryContactPhone' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fax'>
					<Control ID='spnSecondaryContactFax' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='EmailAddr'>
					<Control ID='spnSecondaryContactEmail' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
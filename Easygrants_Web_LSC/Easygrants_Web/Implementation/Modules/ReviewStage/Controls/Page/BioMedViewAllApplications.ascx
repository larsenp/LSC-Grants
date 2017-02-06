<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<span id='spnPageContent' runat='server' />
<p>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td class='SeparatorHdg'>Applications</td></tr>
	<tr>
		<td>
			Click the <b>View PDF</b> button to view each institution's
			<span id='spnMore' runat='server'/>. (Make sure pop-up blockers are turned off).
			To sort, click on any blue column header.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />
		<DataObject Key='BioMedAllApplicationsList' DataObjectDefinitionKey='BioMedAllApplicationsList' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CommonOrganizationName'>
					<RelatedProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization'/>
				</Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GradAllApplicationsList'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='25'
						ShowSubColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName' ColumnHeader='Organization' NoWrap='true'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='AppPerson.PersonPrimaryAffiliation.Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Applicant' NoWrap='true'>
							<Sortable>
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ViewApplicationURL' ColumnHeader='Application' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnViewPDF'
								Type='cButton'  DisableControl='False'
								Image='View_PDF'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'/>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlMore'
						Container='spnMore'
						Type='cTextPopUp'
						PopUpTitle='Application'
						Caption='application'
						Width='600'
						Height='220'>
						<InstructionHtml>
							The application document will be displayed in Adobe Acrobat. For optimal viewing we recommend using Adobe Acrobat Reader version 5.x or higher.						</InstructionHtml>
						<Action PostBack='False'>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

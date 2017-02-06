<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><span id='spnPageContent' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Reviewer Expertise</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr align='center'>
		<td valign='top'>&nbsp;</td>
		<td><span id='spnExpertise' runat='server'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr>
	<td>
		<span runat='server' id='spnSaveAndClose'/>
	</td>
</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent />
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonReviewerExpertise'>
					<Control ID='CtlExpertise'
						Container='spnExpertise'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='ResearchArea'
						DisplayValue='Description'
						StoredValue='ResearchAreaID'
						StoredDisplayValue='ResearchArea.Description' 
						Height='15'
						Sort='True'
						MinSelected='1'
						TooFewMessage='Area of Expertise is required.'
						DisplayNone='False'
						DisplayMoveAll='True'
						DisplaySort='False'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Continue'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
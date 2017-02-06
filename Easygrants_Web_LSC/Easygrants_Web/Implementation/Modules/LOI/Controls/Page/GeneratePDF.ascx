<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GeneratePDF.ascx.vb" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table width='100%' cellpadding='2' cellspacing='0'>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td class='SeparatorHdg'>
			Instructions
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
		<p>
			The <b>Letter of Inquiry Document</b> combines all of the information and uploads that you have submitted into one PDF file.
		</p>
		<p>
			<ul>
				<li>Select <b>Click here to view your Letter of Inquiry Document</b>.<br>A new browser will open and display the PDF file.<br><br></li>
				<li>Proofread the PDF file carefully.   You may make revisions by returning to the appropriate sections using the navigation links to the left.<br><br></li>
				<li>If you make any changes,  you must return to this section.<br>Select <b>Click here to view your Letter of Inquiry Document</b> to verify that all revisions have been included in the PDF file.<br><br></li>
				<li>Click <b>Save and Continue</b> when your document is complete.<br></li>
			</ul>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			Letter of Inquiry Document
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' Src='Core/Controls/Base/ReportOutputLink.ascx'
				runat='server' />
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server' ID="Table1">	
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnSave_and_Continue'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
			<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~Click here to view your Letter of Inquiry Document.~'>
						<Parameters>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument PropertyKey='DefinitionID' 
								Value='35'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Save='False'
						Type='cButton' GoToNextPage='True' >
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
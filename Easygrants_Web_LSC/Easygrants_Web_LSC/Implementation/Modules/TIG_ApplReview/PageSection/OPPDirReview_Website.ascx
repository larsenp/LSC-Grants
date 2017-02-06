<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table border='0' cellpadding='1' width='100%'>
	<tr>
		<td  class="SeparatorHdg" colspan='2'><b>OPP Director Review</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:150px">
			<b>Reviewer</b>
		</td>
		<td>
			<span runat='server' id='spnReviewer' />
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Recommendation</b>
		</td>
		<td>
			<span runat='server' id='spnWfTaskOutcome' />
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="vertical-align:top">
			<b>Comments</b>
		</td>
		<td>
			<span runat='server' id='spnComments' />
		</td>
	</tr>	
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment_OPPDirReview' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='48' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Person.FirstNameLastName'>
					<Control ID='spnReviewer' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome'>
					<Control ID='spnWfTaskOutcome' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskAssignmentReview.Comments'>
					<Control ID='lblComments' 
						Type='cLabel'
						Container='spnComments' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

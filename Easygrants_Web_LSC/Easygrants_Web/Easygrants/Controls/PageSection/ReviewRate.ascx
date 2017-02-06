<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Rating</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<!-- Control Label (for Organization information) -->
	<tr>
		<td>
			Please provide a rating for this applicant.
			Enter a numeric value in the field below. 
			Note that only the Scholars program collects scores.  
			The appropriate scores are: 1.0, 1.5, 2.0, 2.5, or 3.0, 
			where 1.0 represents the best score and 3.0 represents the worst score.
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span id='spnRating' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align=center>
			<span id='spnSave' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewRating'>
					<Control ID='ctlRating'
						Container='spnRating'
						Type='cTextBox'
						Size='2'
						MaxLength='10'>
						<Validation Type='RegularExpression' ValidationExpression='^(\d{0,2})?(\.)?(\d{0,2})$' ErrorMessage='Enter a valid (numerical) Rating.' />
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>

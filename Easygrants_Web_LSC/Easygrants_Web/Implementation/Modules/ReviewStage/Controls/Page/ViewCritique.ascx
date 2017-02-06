<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cViewCritique" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->
<br><br>
<span id='spnPageContent' runat='server' />
<br><br>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td class='SeparatorHdg'>Review Information</td></tr>	
	<tr><td>&nbsp;</td></tr>
	
	<tr>		
		<td><B>Review Stage:</B>&nbsp;<span id='spnReviewStage' runat='server'/></td>						
	</tr>
	<tr>		
		<td><B>Rating:</B>&nbsp;<span id='spnRating' runat='server'/></td>			
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td class='SeparatorHdg'>Critique</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>		
		<td  style='width: auto; word-break: break-all;'><span id='spnCritique' runat='server'/></td>						
	</tr>
</table>
<br>


<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td align='center'><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />
		<DataObject Key='ReviewWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</Filters>
		</DataObject>
		<DataObject Key='ExternalReviewApplicationsList' DataObjectDefinitionKey='ExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='QueryString' TypeKey='RevWftaID' PropertyKey='RevWftaID' />				
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ApplicantName'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewRating'>
					<Control ID='spnRating' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RevWfta.ReviewCycleStage.Name'>
					<Control ID='spnReviewStage' Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='spnCritique' Type='HtmlGenericControl'/>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>

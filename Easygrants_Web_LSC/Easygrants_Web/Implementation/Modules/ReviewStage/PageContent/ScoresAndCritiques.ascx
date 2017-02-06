<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.PageContent.cScoresAndCritiques" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%@ register tagprefix='Core' tagname='cCloseWindow' src='../../../../Core/Controls/Base/CloseWindow.ascx' %>

	
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>


<!-- USER MODIFIABLE CONTENT AREA -->
<br>

<p>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'>
			<b>Applicant</b>
		</td>
		<td><span runat='server' id='spnApplicant' /></td>
	</tr>
	<tr>
		<td width='15%'>
			<b>Science</b>
		</td>
		<td><span runat='server' id='spnPrimaryScience' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Scores & Critiques</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><span id='spnPrimaryCritique' runat='server' visible='true'/></td></tr>
	<tr><td><span id='spnSecondaryCritique' runat='server' visible='true'/></td></tr>
	<tr><td><span id='spnReaderCritique' runat='server' visible='true'/></td></tr>
</table>


<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

 
		<DataObject Key='WfTaskAssignmentReview' DataObjectDefinitionKey='WfTaskAssignmentReview'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' 
					Value='' 
					Bool=''/>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool='And'/>
				<Argument Type='QueryString' 
					TypeKey='AppWfTaskAssignmentID' 
					PropertyKey='AppWfTaskAssignmentID' 
					Value='' 
					Bool='And'/>		
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName'>
					<Control ID='spnApplicant'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.GranteeProjectInfo.ScienceClassification.Description'>
					<Control ID='spnPrimaryScience'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPrimaryCritique'
						Container='spnPrimaryCritique'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSecondaryCritique'
						Container='spnSecondaryCritique'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReaderCritique'
						Container='spnReaderCritique'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>		

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
				
				<!-- <DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>								
						</Action>
					</Control>
				</DisplayProperty>	-->					
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>
</span>



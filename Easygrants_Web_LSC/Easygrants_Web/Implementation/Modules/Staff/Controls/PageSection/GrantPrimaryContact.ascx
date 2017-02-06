<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cGrantPrimaryContact" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br/>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Applicant/Grantee Primary Contact</b></td>
	</tr>	
</table>
<br/>
<span runat='server' visible='false' id='spnErrorMsg'>
	<font color='red'>Send Password failed. Create a Login ID and Password.</font><br/><br />
</span>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<!-- Control Label (for Name information) -->

	<tr>
	    
		<td	valign="top"  width='15%'><b>Primary Contact/PI</b></td>
		<td width='15%' >
			<span id='spnPrimaryPerson' runat='server'/>
		</td>
		<td width='5%'>
			<!--<<span id='spnReplacePrimary' runat='server'/>-->
		</td>	
		<td width='13%'>
			<span id='spnSendPassword' runat='server'/>
		</td>
		<td>
				Date Last Sent:&nbsp;<span id='spnLastSentDate' runat='server'/>
			&nbsp;<span id='spnPT' runat='server' Visible='True'></span>
		</td>	
	</tr>	
</table>
<br/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
				
			</Filters>
			<DisplayProperties>		
					<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					        <Control ID='spnPrimaryPerson'
						        Type='HtmlGenericControl'>
					        </Control>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='PrimaryPerson.User.PasswordLastSentDate' Format='M/d/yyyy h:mm tt'>
					<Control ID='spnLastSentDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>     				   
			</DisplayProperties>
		</DataObject><!-- Key='GranteeProject' -->
		
		
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<!--<DisplayProperty PropertyKey=''>
					<Control ID='btnReplacePrimary' 
						Type='cButton' 
						Caption='Replace' 
						Container='spnReplacePrimary'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ReplacePrimaryContact'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>	
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>								
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty> -->
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendPassword'
						Container='spnSendPassword'
						Type='cButton'
						Caption='Send Password'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendPassword'>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject><!-- Key=Base -->
		

		
	</ModuleSection>
<!-- End Embedded XML -->
</span>


<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<P>
	Provide information on person contacts affiliated with this contact. To select the person, click on the <B>Select…</B> button to 
	locate the person contact's name using the Person Selection tool. If you cannot locate the person, click on the <B>Close</B> 
	button to return to the Person Details page and select the Easylist link in the History. To save the Person Affiliation, 
	click on the <B>Save</B> button. To close this page and return to the Person Details page, click on the <B>Close</B> button.
	<B>IMPORTANT:</B> If you close or navigate off this page before you save, you will lose unsaved information.
</P>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td width='100%' colspan="3" class="SeparatorHdg"><b>Person Affiliation</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trPerson'>
		<td>
			<b>Contact: <span runat='server' id='spnPerson'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b>Type&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnAffiliationType' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td><b>Person</b></td>
		<td width='10'>&nbsp;</td>
		<td>	
			<Core:cUserCtlLoader CtlID='ctlPerson'
				Src='Core/Controls/Base/PopUpSelectorLauncher.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Affiliation Description</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnRelationshipDescription' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPerson'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='PersonRelationship' DataObjectDefinitionKey='PersonRelationship' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
				<Argument Type='QueryString' 
					TypeKey='PersonRelationshipID'
					PropertyKey='PersonRelationshipID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
			</DefaultValues>
			<DisplayProperties>									
				<DisplayProperty PropertyKey='RelatedPersonID' PropertyValue='RelatedPerson.LastNameFirstName'>
					<Control ID='ctlPerson' Type='cPopUpSelectorLauncher'/>
				</DisplayProperty>										
				<DisplayProperty PropertyKey='RelatedPersonRoleID'>
					<Control ID='ctlAffiliationType'
						Container='spnAffiliationType'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskRole'
						StoredValue='WfTaskRoleID'
						DisplayValue='WfTaskRole'
						DisplayNone='False'
						RequiredField='True'
						ErrorMessage='Type is required.'>
						<Filters>
							<Argument Type='' 
								TypeKey=''
								PropertyKey='WfTaskRoleID'
								Value='1' 
								Operator='NotEqual'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskRole'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelationshipDescription'>
					<Control ID='ctlRelationshipDescription'
						Container='spnRelationshipDescription'
						Type='cTextArea'
						Rows='10'
						Cols='50'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save' EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
		<UserCtlLoader>
			<ctlPerson>
				<DataObject Key='PersonID' DataObjectDefinitionKey='Person' DisplayName='Person last'>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='LastNameFirstNamePrimInst'/>
					</DisplayProperties>
				</DataObject>
			</ctlPerson>
		</UserCtlLoader>
	</ModuleSection>
<!-- End Embedded XML -->
</span>


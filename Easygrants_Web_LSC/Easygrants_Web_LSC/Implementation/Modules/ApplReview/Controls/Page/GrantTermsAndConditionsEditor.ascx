<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>
TBD
</p>

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	Add or Edit Grant Conditions
</div>

<b>Conditions</b> <%=kDenoteRequiredField %>&nbsp;&nbsp;
<span runat='server' id='spnConditionType' /><br /><br />

<b>Enter a comment pertaining to the grant condition</b> <%=kDenoteRequiredField %>
<span runat='server' id='spnComment' />

<table width='100%'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;
			<span runat='server' id='spnClose' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscGrantCondition' DataObjectDefinitionKey='LscGrantCondition' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='QueryString' TypeKey='GrantConditionID' PropertyKey='LscGrantConditionID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ReviewedWfTaskAssignmentID' PropertyKey='ReviewedWfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscGrantConditionTypeID'>
					<Control ID='ctlConditionType'
						Type='cDropDown'
						Container='spnConditionType'
						DataObjectDefinitionKey='LscGrantConditionType'
						StoredValue='LscGrantConditionTypeID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='You must select a condition.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtComment'
						Type='cTextArea'
						Container='spnComment'
						Rows='5'
						Cols='80'
						RequiredField='True'
						ErrorMessage='You must provide a comment pertaining to the grant condition.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='GrantTermsAndConditions'/>
							</Parameters>							
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='GrantTermsAndConditions'/>
							</Parameters>							
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

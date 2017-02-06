<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PageContentEditor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cPageContentEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Task Page Content</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProgram' runat='server'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnCompetition' runat='server'/></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProject' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Task</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnTask' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Page Name&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<Core:cUserCtlLoader CtlID='ctlPageKey' Type='cDropDown' runat='server'/>
			<asp:CustomValidator id='valUniquePageKeyStatus' runat='server'
				OnServerValidate='ValidateUniquePageKeyStatus'
				ErrorMessage='Content is already added for this Page Name and Task Status. Page Name and Task Status must be unique.'
				Display='none'/>
		</td>
	</tr>
	<tr>
		<td valign='top'><b>Task Status&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnStatus' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr id="trContent" visible='True' runat='server'>
		<td valign='top'><b>Content&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td> 
		<td><span id='spnContent' runat='server'/></td>
	</tr>
	
	<tr id="trValRegMetContent" visible='False' runat='server'>
		<td valign='top'><b>Validation Requirements Met Content&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td> 
		<td><span id='spnValRegMetContent' runat='server'/></td>
	</tr>
	<tr id="trValRegNotMetContent" visible='False' runat='server'>
		<td valign='top'><b>Validation Requirements Not Met Content&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td width='10'>&nbsp;</td> 
		<td><span id='spnValRegNotMetContent' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td valign='top'>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnPreview' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td valign='top'>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnDisplay' runat='server'/></td>
	</tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<span runat='server' id='spnSaveAndClose'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>	
		</td>
</tr>

</table>

<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Program' DataObjectDefinitionKey='Program'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ProgramID'
					PropertyKey='ProgramID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProgramDisplayName'>
					<Control ID='spnProgram'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>		
		</DataObject>
		<DataObject Key='Competition' DataObjectDefinitionKey='Competition'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='CmptID'
					PropertyKey='CompetitionID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CompetitionDisplayName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>		
		</DataObject>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfProjectID'
					PropertyKey='WfProjectID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='spnProject'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>		
		</DataObject>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WfProjectID'
					PropertyKey='WfProjectID'
					Value='' 
					bool=''/>
				<Argument Type='QueryString' 
					TypeKey='WfTaskID'
					PropertyKey='WfTaskID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnTask'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskStatus'
						DisplayText='Select'
						StoredValue='WfTaskStatusID'
						DisplayValue='WfTaskStatus'
						RequiredField='True'
						ErrorMessage='Task Status is required.'>
						<Sort>
							<Argument PropertyKey='WfTaskStatus' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>		
		</DataObject>
		<DataObject Key='PageContent' DataObjectDefinitionKey='PageContent' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PageContentID'
					PropertyKey='PageContentID'
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value=''/>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Content'>
					<Control ID='ctlContent'
						Container='spnContent'
						Type='cTextArea'
						Rows='9'
						Cols='90'
						MaxLength='2000'
						TooLongMessage='Limit Content to 2000 characters.'
						RequiredField='True'
						ErrorMessage='Content is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ValidationPassedContent'>
					<Control ID='ctlValRegMetContent'
						Container='spnValRegMetContent'
						Type='cTextArea'
						Rows='9'
						Cols='90'
						MaxLength='2000'
						RequiredField='True'
						ErrorMessage='Validation Requirements Met Content is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ValidationFailedContent'>
					<Control ID='ctlValRegNotMetContent'
						Container='spnValRegNotMetContent'
						Type='cTextArea'
						Rows='9'
						Cols='90'
						MaxLength='2000'
						RequiredField='True'
						ErrorMessage='Validation Requirements Not Met Content is required.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>		
		</DataObject>
		
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnPreview'
						Container='spnPreview'
						Type='cButton'
						Image='Preview'>
						<Action
							PostBack='True'
							Object='EventController'
							AutoSave='True'
							Method='Preview'>
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='PageContent' DataObjectPropertyKey='PageContentID' PropertyKey='PageContentID' BaseValue='PageContentID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='ModulePage_RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='ContentManager'/>
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
							Object='DataPresenter'
							Method='ModulePage_RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='ContentManager'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

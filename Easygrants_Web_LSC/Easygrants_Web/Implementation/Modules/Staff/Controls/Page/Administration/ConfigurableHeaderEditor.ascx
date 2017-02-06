<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cConfigurableHeaderEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br/>

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>    
    <tr>
		<td class="SeparatorHdg" colspan='2' ><b>Label Manager Editor</b></td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	</tr>    
	<tr>
		<td width='15%'><b>Default Label Name</b></td>	
		<td><span runat='server' id='spnLabelName' /></td>
	</tr>
	<tr>
		<td width='15%'><b>Preferred Label Name</b></td>	
		<td><span runat='server' id='spnLabelText' /></td>
	</tr>
</table>
<br/>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
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
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='HeaderLabel' DataObjectDefinitionKey='HeaderLabel' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='HeaderLabelID' PropertyKey='HeaderLabelID' Value='' Bool=''/>
			</Filters>			
			<DisplayProperties>
			   <DisplayProperty PropertyKey='LabelDisplayName'>
					<Control ID='spnLabelName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='LabelText'>
					<Control ID='ctlLabelText'
						Container='spnLabelText'
						Type='cTextBox'
						Size='65'
						MaxLength='50'>
					</Control>					
				</DisplayProperty>
			   </DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='HeaderLabel' DataObjectPropertyKey='HeaderLabelID' PropertyKey='HeaderLabelID' BaseValue='HeaderLabelID='/>
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
	</ModuleSection>
<!-- End Embedded XML -->
</span>


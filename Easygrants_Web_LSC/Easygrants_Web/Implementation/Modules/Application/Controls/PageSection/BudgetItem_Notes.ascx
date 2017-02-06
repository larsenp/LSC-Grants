<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td class="SeparatorHdg" colspan='3' ><b>Notes editor</b></td>
	</tr>
</table>
<br>	
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td valign='top' width='20%'><b>Note&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnNotes' runat='server'/></td>		
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit: 5000 characters</td>
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
	<DataObject Key='BudgetItem' DataObjectDefinitionKey='BudgetItem' Updatable='True' CreateNew='True'>
			<Filters> 
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''  bool=''/>
				<Argument Type='QueryString' TypeKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' Value=''  bool=''/>
                <Argument Type='QueryString' TypeKey='BudgetPeriodID'	PropertyKey='BudgetPeriodID'  Value='' 	bool=''/>
			</Filters>
            <DefaultValues>
                <Argument Type='QueryString' TypeKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' Value=''/>
                <Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''  bool=''/>
                <Argument Type='QueryString' TypeKey='BudgetPeriodID' PropertyKey='BudgetPeriodID' Value=''/>
                <Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
            </DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='Notes'>
					<Control ID='ctlName'
						Container='spnNotes'
						Type='cTextArea'
						MaxLength='5000'
						Rows='10'
						Cols='90'
						RequiredField='True'
						ErrorMessage='Note is required.'>
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
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'>
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

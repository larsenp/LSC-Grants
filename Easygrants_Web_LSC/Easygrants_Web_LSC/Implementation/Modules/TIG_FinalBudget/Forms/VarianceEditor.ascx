<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class="SeparatorHdg">
	Variance Explanation Editor
</div>
<br />
<B><span runat='server' id='spnLscTigBudgetLineID'/>. <span runat='server' id='spnLscTigBudgetLine'/></B><br />
<strong>Projected Budget Amount</strong> <span runat='server' id='spnAmountP'/> <br />
<strong>Final Budget Amount</strong> <span runat='server' id='spnAmountF'/><br />
<span runat='server' id='spnEdit'/><br />
<span runat='server' id='spnComment'/>
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnSave'/>
	<span runat='server' id='spnSaveClose' />
	<span runat='server' id='spnClose' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscTigBudgetItem' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type="QueryString" TypeKey="LscTigBudgetItemID" PropertyKey="LscTigBudgetItemID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtComment'
						Type='cTextArea'
						Container='spnComment'
						Rows='4'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Type='cButton'
						Container='spnSaveClose'
						Caption='Save and Close'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='BudgetVariances'/>
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
								<Argument Value='BudgetVariances'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigBudgetItemVariance' DataObjectDefinitionKey='LscTigBudgetItemVariance' Updatable='False'>
			<Filters>
				<Argument Type="QueryString" TypeKey="LscTigBudgetItemID" PropertyKey="LscTigBudgetItemIDF"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AmountP' Format='$#,0'>
					<Control ID='spnAmountP'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AmountF' Format='$#,0'>
					<Control ID='spnAmountF'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscTigBudgetLineID'>
					<Control ID='spnLscTigBudgetLineID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscTigBudgetLine.Description'>
					<Control ID='spnLscTigBudgetLine'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

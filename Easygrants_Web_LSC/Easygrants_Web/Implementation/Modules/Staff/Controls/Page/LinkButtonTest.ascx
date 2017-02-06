<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br>
<span runat='server' id='spnHome'/>
<br><br>
<span runat='server' id='spnList'/>
<span runat='server' visible='false' id='spnConfigXml'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument PropertyKey='PersonID' Value='20' Operator='LessThan'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHome'
						Type='cCSSButton'
						Container='spnHome'
						Caption='Home'
						ToolTipText='Home'
						Confirmation='Do you want to go home?'>
							<Action PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Value='Home'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'>
						<DisplayProperty PropertyKey='PersonID' ColumnHeader='Person ID'/>
						<DisplayProperty PropertyKey='LastName' ColumnHeader='Last Name'/>
						<DisplayProperty PropertyKey='FirstName' ColumnHeader='First Name'/>
						<DisplayProperty PropertyKey='ContactDetailsDisplayURL' ColumnHeader='Name'>
							<Control ID='ctlLink'
								Type='cCSSButton'
								CaptionKey='FirstNameMiddleNameLastName'
								ToolTipPropertyKey='LastName'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
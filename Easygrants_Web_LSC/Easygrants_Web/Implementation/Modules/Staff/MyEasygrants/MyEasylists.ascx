<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="MyEasylists.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<P><P>
<Core:cUserCtlLoader CtlID='ctlSubmission' Src='Implementation/Modules/Staff/MyEasygrants/MyEasygrantsTab.ascx' runat='server'/>
<P>
Below are the Easylists you've added to your My Contacts page.  Click the link for the Easylist to go to the Easylist results page for the selected item.  Click <B>Remove</B> to remove the selected item from the My Easylists list.
<P>
<!--IMG SRC="MyEasygrants/MyEasylists.gif" border=0 /-->
<!--<P>
<B>Action:</B> <span runat='server' id='spnAction' />&nbsp;&nbsp;<span runat='server' id='spnGo' />
<P>
<HR >-->
<P>
<span runat='server' id='spnMyEasylists'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='MyEasylists' DataObjectDefinitionKey='MyEasylists' Updatable='False'>
			<!--
			<Filters>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='PersonID'/>
			</Filters>
			-->
			<Sort>
				<Argument PropertyKey='Name' />	
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>

					<Control ID='ctlMyEasylists'
						Container='spnMyEasylists'
						Type='cDataListCtl'
						DataObjectDefinitionKey='MyEasylists'
						SeparatorWidth='2'
						MaxPerPage='10'>

						<DisplayProperty PropertyKey='Name' ColumnHeader='Name' >
							<Control ID='ctlLink' 
								Type='cLink'>
								<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='URL' AttributeName='URL' />
									</Parameters>
								</Action>

							</Control>
						</DisplayProperty>

						<DisplayProperty PropertyKey='Description' ColumnHeader='Description' />
						<DisplayProperty PropertyKey='Type' ColumnHeader='Type' />
						<DisplayProperty PropertyKey='' >
							<Control ID='btnEdit'
								Type='cButton'
								Image='Remove'>
								<Action
									PostBack=''
									Object=''
									Method=''>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlState' Container='spnAction' Type='cDropDown' DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='StateAbbr'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='ctlByCnstm'
						Container='spnGo'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='False'
							Object='EventController'
							Method=''>
						</Action>
					</Control>
				</DisplayProperty>



			</DisplayProperties>
			
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
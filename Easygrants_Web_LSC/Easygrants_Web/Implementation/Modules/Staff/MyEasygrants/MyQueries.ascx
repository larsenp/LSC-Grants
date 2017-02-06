<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="MyQueries.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<P><P>
<Core:cUserCtlLoader CtlID='ctlSubmission' Src='Implementation/Modules/Staff/MyEasygrants/MyEasygrantsTab.ascx' runat='server'/>
<P>
Below are the saved queries you've added to your My Queries page.  Select an option from the Actions drop-down and click Go.  Click <B>Remove</B> to remove the selected item from the My Queries list.
<P>

<!--IMG SRC="MyEasygrants/MyEasylists.gif" border=0 /-->
<!--<P>
<B>Action:</B> <span runat='server' id='spnAction' />&nbsp;&nbsp;<span runat='server' id='spnGo' />
<P>
<HR >-->
<P>
<span runat='server' id='spnMyQueries'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='MyQueries' DataObjectDefinitionKey='MyQueries' Updatable='False'>
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

					<Control ID='ctlQueries'
						Container='spnMyQueries'
						Type='cDataListCtl'
						DataObjectDefinitionKey='MyQueries'
						SeparatorWidth='2'
						MaxPerPage='10'>

						<DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='200'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='SavedQueryAction'
								StoredValue='SavedQueryActionID'
								DisplayValue='SavedQueryAction'>
								<Sort>
									<Argument PropertyKey='SavedQueryAction' />
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo'
								Type='cButton'
								Image='Go'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Query_Action'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SavedQueryID' AttributeName='SavedQueryID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>


						<DisplayProperty PropertyKey='Name' ColumnHeader='Type' />
						<DisplayProperty PropertyKey='Description' ColumnHeader='Type' />
						<DisplayProperty PropertyKey='QueryType' ColumnHeader='Type' />
						<DisplayProperty PropertyKey='AccessType' ColumnHeader='Type' />
						<DisplayProperty PropertyKey='' >
							<Control ID='btnEdit'
								Type='cCSSButton'
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
				



			</DisplayProperties>
			
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
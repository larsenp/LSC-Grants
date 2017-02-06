<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cContentManagerPreviewHtml" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register tagprefix='Core' tagname='cCloseWindow' src='../../../Core/Controls/Base/CloseWindow.ascx' %>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan='4'>
			<b>Content will appear on the page as:</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<span id='spnPreviewText' runat='server'/>
		</td>
	</tr>
	<tr>
		<td colspan='4'>
			<span id='spnPreviewValRegMetContent' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<span id='spnPreviewValRegNotMetContent' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->
<table id='tblCloseWindow' align='center' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr align='center'>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close Window'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow'>
							<Parameters>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='PageContent' DataObjectDefinitionKey='PageContent' >
			<Filters>
				<Argument Type='QueryString' TypeKey='PageContentID' PropertyKey='PageContentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Content' HtmlEncode='False'>
					<Control ID='spnPreviewText' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ValidationPassedContent' HtmlEncode='False'>
					<Control ID='spnPreviewValRegMetContent' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ValidationFailedContent' HtmlEncode='False'>
					<Control ID='spnPreviewValRegNotMetContent' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->

<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="FAQ_Public_View.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cFAQ_Public_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
<table border='0' width='100%' cellspacing='0' cellpadding='0' runat='server'>
	<tr id='trTitle'>
		<td colspan="4" align="Center" class="SeparatorHdg"><b>Easygrants Manager</b></td>
	</tr>
	<tr>
		<td colspan="4" align="Center" class="SeparatorHdg"><b>Frequently Asked Questions</b></td>
	</tr>	
</table>
<br>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server' ID="Table1">
	<tr>
		<td colspan="4"  class="SeparatorHdg"><b>Frequently Asked Questions</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='5'><span runat='server' id='spnFAQPublicView'/></td>
	</tr>
</table>
<br>

<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td align='center'><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<!-- End Embedded XML -->
	<ModuleSection>
		<DataObject Key='FAQ' DataObjectDefinitionKey='FAQ' Updatable='True' CreateNew='True' >	
			<Filters>
               <Argument Type='Data' TypeKey='' PropertyKey='IsPublicAvailable' Value='True'/>
            </Filters>	
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFAQPublicView' Container='spnFAQPublicView' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Easygrants/Controls/PageSection/FAQ_View.ascx' />
				</DisplayProperty>				               
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='FAQList' DataObjectDefinitionKey='FAQ' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>	
			</DisplayProperties>																		
		</DataObject>
		
	</ModuleSection>
</span>



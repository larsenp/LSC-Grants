<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Review Stage</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='3' runat='server'>
	<tr>
		<td width='270'>
			<b>Review Cycle</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnReviewCycle' visible='true'></span>
		</td>
	</tr>	
	<tr>
		<td width='270'>
			<b>Review Stage</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnReviewStage' visible='true'></span>
		</td>
	</tr>	
	<tr>
		<td width='270'>
			<b>Stage List Order</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnListOrder' visible='true'></span>
		</td>
	</tr>	
	
<tr><td>&nbsp;</td></tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCycleStageID'
					PropertyKey='ReviewCycleStageID' 
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ReviewCycle.Name'>
					<Control ID='spnReviewCycle'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Name'>
					<Control ID='spnReviewStage'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ListOrder'>
					<Control ID='spnListOrder'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
						
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>

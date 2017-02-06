<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cEGDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnReviewCycleCommittee'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave' visible='false'/>	
	</td>
</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewCycleID'
					PropertyKey='ReviewCycleID' 
					Value='' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCycleNotification'>
					<Control ID='ctlReviewCycleCommittee'
						Container='spnReviewCycleCommittee'
						Type='cDoubleListBox'
						DataObjectDefinitionKey='ReviewCycleCommittee'
						DisplayValue='ReviewCommittee.ReviewCommitteeDescription'
						StoredValue='ReviewCommitteeID'
						StoredDisplayValue='ReviewCommittee.ReviewCommitteeDescription' 
						Height='9'
						DisplayNone='False'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' Value=''/>
							<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' Value=''/>
						</DefaultValues>
						<Filters>
							<Argument Type='QueryString' 
								TypeKey='ReviewCycleID'
								PropertyKey='ReviewCycleID' 
								Value='' 
								bool=''/>
						</Filters>
			
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'/>
							
					</Control>	
				</DisplayProperty>
								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>

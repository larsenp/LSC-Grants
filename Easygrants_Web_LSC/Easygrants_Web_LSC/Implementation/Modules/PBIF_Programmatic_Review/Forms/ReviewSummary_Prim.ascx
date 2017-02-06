<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<div style="width:600px;">
	<br />
	<Core:cUserCtlLoader ID="ldrAppInfo" CtlID='ctlAppInfo' 
		Src='Implementation/Modules/PBIF_Programmatic_Review/PageSection/ApplicationInfo.ascx'
		runat='server'/>
	<br />
	<div class='SeparatorHdg'>
		Review Summary
	</div>
	<br /><br />
	<strong>Total Raw Score: <span runat='server' id='spnRawScore'/> of 27 possible</strong>
	<br />
	<strong>Total Weighted Score: <span runat='server' id='spnWeightedScore'/>%</strong>
	<br /><br />
	<strong>(Weighted Score Guidelines</strong>: 0 – 50% unlikely to be funded, 51 – 100% potential for funding.)
	<br /><br />
	<strong>Overall Comments</strong>
	<span runat='server' id='spnOverallComment'/>
	<br /><br />
	<div style="width:100%; text-align:center">
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;
		<span runat='server' id='spnSaveContinue'/>
	</div>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscProBonoPrimaryScoreByReviewAssignment' DataObjectDefinitionKey='LscProBonoPrimaryScoreByReviewAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RawScore'>
					<Control ID='spnRawScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WeightedScore' Format='#'>
					<Control ID='spnWeightedScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscPbifProgReview' DataObjectDefinitionKey='LscPbifProgReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='txtOverallComment'
						Type='cTextArea'
						Container='spnOverallComment'
						Rows='10'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Save and Continue'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

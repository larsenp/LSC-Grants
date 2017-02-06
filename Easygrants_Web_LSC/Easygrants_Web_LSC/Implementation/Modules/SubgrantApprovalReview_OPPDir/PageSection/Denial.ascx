<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class="SeparatorHdg">Recommend Denial</div>
<br />
<b>Reason for Denial Recommendation<font color='red'>*</font></b><br />
<span runat='server' id='spnDenialReason'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWftaSubgrantReviewOPP' DataObjectDefinitionKey='LscWftaSubgrantReviewOPP' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DenialReason'>
					<Control ID='txtDenialReason'
						Type='cTextArea'
						Container='spnDenialReason'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

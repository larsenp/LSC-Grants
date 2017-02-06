<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div style="width:800px;">
	<br />
	<div class="SeparatorHdg">Change summary</div>
	<br />
	<table style='width:100%;'>
		<tr>
			<td>
		  Have you made any changes to your Step 1 submission?</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnStep1To2Change'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				Are there any differences between the terms of, or language contained in, the Draft Subgrant Agreement uploaded in Step 1 and the Executed Subgrant Agreement?
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnSubgrantAgreementChange'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td style="vertical-align:top">
				If the answer to either of the questions above is "yes", please summarize.
			</td>
			<td>
				<span runat='server' id='spnStep1To2ChangeComment'/>
			</td>
		</tr>
	</table>
	<br />
	<div style="text-align:center">
		<span runat='server' id='spnSave'/>&nbsp;
		<span runat='server' id='spnSaveContinue'/>
	</div>
</div>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWfTASubgrant' DataObjectDefinitionKey='LscWfTASubgrant' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Step1To2Change'>
					<Control ID='ctlStep1To2Change'
						Type='cRadioButtonList'
						Container='spnStep1To2Change'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgrantAgreementChange'>
					<Control ID='ctlSubgrantAgreementChange'
						Type='cRadioButtonList'
						Container='spnSubgrantAgreementChange'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Step1To2ChangeComment'>
					<Control ID='txtStep1To2ChangeComment'
						Type='cTextArea'
						Container='spnStep1To2ChangeComment'
						Cols='50'
						Rows='3'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

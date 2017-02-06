<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<span runat='server' id='spnSecondaryReviewScores'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SecondaryReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
				<Argument PropertyKey='WfTaskID' Value='107'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSecondaryReviewScores'
						Type='cDataPresenterList'
						Container='spnSecondaryReviewScores'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/PBIF_OPP_Dir_Review/PageSection/SecondaryReviewScoresChild.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

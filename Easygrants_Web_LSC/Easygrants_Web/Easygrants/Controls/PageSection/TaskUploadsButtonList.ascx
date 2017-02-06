<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cTaskUploadsButtonList" CodeBehind="TaskUploadsButtonList.ascx.vb" %>

<table border='0' cellspacing='0' cellpadding='0'  width='100%'  runat='server' ID="TblInstructions">	
	<tr>
		<td><span id='spnUploadsList' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable=''>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable=''>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='GranteeProject'
					DataObjectPropertyKey='WfProjectID'
					PropertyKey='WfProjectID'
					Value='' 
					bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskID'
					PropertyKey='WfTaskID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='WfProjectTaskUpload' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable=''>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' 
					DataObjectPropertyKey='WfProjectTaskID' PropertyKey='WfProjectTaskID'
					Value='' bool=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='IncludeInTask' Value='True'/>
				<Argument Type='DataPresenter' TypeKey='GeneralUpload' PropertyKey='GeneralUpload' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='UploadName'>
					<RelatedProperty PropertyKey='Upload'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlUploadsList'
						Container='spnUploadsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskUpload'
						NoRecordMessage='No task uploads.'
						ShowColumnHeaderRow='False'
						HideBlankRow='True'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Upload.UploadName' ColumnHeader=' ' >
							<Control ID='btnUpload' CaptionKey='Upload.UploadName'
								Type='cButton'>
								<Action
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='NavigateToUploadEditor'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PreliminaryScoresAndCommentsUploadEditor'/>
										<Argument Type='DataObject' TypeKey='UploadID' AttributeName='UploadID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
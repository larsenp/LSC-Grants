<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cStaffTaskGenUploadsButtonList" CodeBehind="StaffTaskGenUploadsButtonList.ascx.vb" %>

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
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>		
		<DataObject Key='WfProjectTaskUpload' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable=''>
			<Filters>	
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID'>
					<RelatedProperty PropertyKey='WfProjectTask.WfProject'/>
				</Argument>			
				<Argument Type='Data' TypeKey='' PropertyKey='IncludeInTask' Value='True'/>
				<Argument Type='Data' TypeKey='' PropertyKey='GeneralUpload' Value='True'/>	
				<Argument Type='QueryString' TypeKey='GeneralUploadCategoryTypeID' PropertyKey='GeneralUploadCategoryTypeID' Value=''/>
				<Argument Type='QueryString' TypeKey='GeneralUploadCategoryID' PropertyKey='GeneralUploadCategoryID' Value=''/>			
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
										<Argument AttributeName='PageKey' Value='StaffUploadEditor'/>
										<Argument Type='QueryString'  TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='' />
										<Argument Type='DataObject' TypeKey='UploadID' AttributeName='UploadID' BaseValue='' />										
										<Argument Type='QueryString' TypeKey='GeneralUploadCategoryID' PropertyKey='GeneralUploadCategoryID' Value=''/>
										<Argument Type='QueryString' TypeKey='GeneralUploadCategoryTypeID' PropertyKey='GeneralUploadCategoryTypeID' Value=''/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskUploadID' AttributeName='WfProjectTaskUploadID' Value=''/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue=''/>
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
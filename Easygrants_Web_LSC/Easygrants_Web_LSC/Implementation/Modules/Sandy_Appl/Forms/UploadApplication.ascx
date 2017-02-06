<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnUpload'></span>
		</td>
	</tr>	
</table>
<br</br>
<table id="Table2" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td>			
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
	<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='UploadedByID' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cUploadNew'
						Container='spnUpload'>
						<Parameters>
							<Argument Type='QueryString' TypeKey='FileTypeID' PropertyKey='FileTypeID' Bool=''/>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityAssocID' Bool=''/>
							<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' Bool=''/>
							<Argument Type='QueryString' TypeKey='Description' PropertyKey='Description' Bool=''/>
							<Argument PropertyKey='Description' Value='True'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
			   <DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Caption='Continue'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewSubmit'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
</ModuleSection>
</span>
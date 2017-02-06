<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="27%">
			<span runat='server' id='spnInUse' />&nbsp;
			<span runat='server' id='spnDescription' />
		</td>
		<td width="73%">
			<span runat='server' id='spnVersion' />
		</td>
</table>        

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='ServerOSSoftwareProducts' Key='ServerOSSoftwareProducts' DataObjectDefinitionKey='LSCSoftwareProduct' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnDescription' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ServerOSSoftware' DataObjectDefinitionKey='LscSoftware' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='ServerOSSoftwareProducts' DataObjectPropertyKey='LscSoftwareProductID' PropertyKey='LscSoftwareProductID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='ServerOSSoftwareProducts' DataObjectPropertyKey='LscSoftwareProductID' PropertyKey='LscSoftwareProductID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='InUse'>
					<Control ID='chkInUse'
						Type='cCheckBox'
						Container='spnInUse'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Version'>
					<Control ID='txtVersion'
						Type='cTextBox'
						Container='spnVersion'
						MaxLength='50' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

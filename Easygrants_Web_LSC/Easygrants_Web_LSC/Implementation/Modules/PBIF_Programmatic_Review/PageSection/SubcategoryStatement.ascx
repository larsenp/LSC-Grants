<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.PBIF_Programmatic_Review.PageSection.cSubcategoryStatement" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<span runat='server' id='spnSortOrder'/>. <strong><span runat='server' id='spnAbbr'/></strong>: <span runat='server' id='spnDescription'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
			</Filters>
		</DataObject>
		<DataObject Key='LscProBonoCategory' DataObjectDefinitionKey='LscProBonoCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="GranteeProject" DataObjectPropertyKey='WfProject.TimePeriodID' PropertyKey="TimePeriodID"/>
				<Argument Type="DataPresenter" TypeKey="CategoryNum" PropertyKey="SortOrder"/>
			</Filters>
		</DataObject>
		<DataObject Key='LscProBonoSubcategory' DataObjectDefinitionKey='LscProBonoSubcategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataObjectCollection" TypeKey="LscProBonoCategory" DataObjectPropertyKey='LscProBonoCategoryID' PropertyKey="LscProBonoCategoryID"/>
				<Argument Type="DataPresenter" TypeKey="SubcategoryNum" PropertyKey="SortOrder"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='spnSortOrder'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnAbbr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnDescription'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

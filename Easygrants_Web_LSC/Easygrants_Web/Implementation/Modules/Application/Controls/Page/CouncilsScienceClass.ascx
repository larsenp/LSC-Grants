<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br><br>
<span id='spnScienceClass' runat='server'/>




	
<!-- end specific page help text -->

</body>
</html>


<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject Key='ScienceCategory' DataObjectDefinitionKey='ScienceCategory'>
			<Filters>
			</Filters>
			<Sort>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlScienceClass' Container='spnScienceClass' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Easygrants/Controls/PageSection/ScienceKatz_List.ascx' />
				</DisplayProperty>													
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>

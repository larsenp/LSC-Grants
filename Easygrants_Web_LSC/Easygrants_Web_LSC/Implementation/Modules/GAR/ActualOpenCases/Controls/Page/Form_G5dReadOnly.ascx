<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-5(d): Actual Open Cases (PAI)</h1></td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlEditor' 
	Src='Implementation/Modules/GAR/ActualOpenCases/Controls/PageSection/ActualOpenCasesReadOnly.ascx'
	runat='server'/>
<br />


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEditor' 
						Type='cUserCtlLoader ' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

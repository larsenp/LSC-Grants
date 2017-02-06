<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cProjectTitles" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>



<!-- Page Content - Controls --> 
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Title</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' ID="Table3">
	<tr>
		<td	valign="top" width='200'><b><%=GetLabel("ProjectTitle")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnFullTitle' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td>&nbsp;</td>
		<td><font size='1'>Limit: 300 characters</font></td>	
	</tr>
</table>
<br>
<br>
<br>
<table id='tbSearchParameters' width='100%' runat='server' visible='true'>
	<tr>
		<td></td>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave' visible='true'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantTitle'>					
					<Control ID='ctlFullTitle'
						Container='spnFullTitle'
						Type='cTextArea'
						Rows='4'
						Cols='50'
						MaxLength='300'
						TooLongMessage='Limit your Project Title to 300 characters.'
						RequiredField='True'
						ErrorMessage='Enter a ~~ProjectTitle~~.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
	</ModuleSection> 
<!-- End Embedded XML -->
</span>
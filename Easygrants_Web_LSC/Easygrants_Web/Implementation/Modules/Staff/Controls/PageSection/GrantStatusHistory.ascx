<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
	    <td colspan="4" class="SeparatorHdg"><b>Grant Status History</b></td>
    </tr>	
    <tr><td>&nbsp;</td></tr>
    <tr>
		<td>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='GrantStatusHistory' DataObjectDefinitionKey='GrantStatusHistory'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						    <DisplayProperty PropertyKey='GrantStatus.Abbr' Width='25%' ColumnHeader='Previous Grant Status' NoWrap='true'>
						        <Sortable>
								    <Argument PropertyKey='Abbr'>
								        <RelatedProperty PropertyKey='GrantStatus'/>
								     </Argument>
								</Sortable>
						    </DisplayProperty>
							<DisplayProperty PropertyKey='Person.LastNameFirstName' Width='20%' ColumnHeader='Last Modified By' NoWrap='true'>
							    <Sortable>
								    <Argument PropertyKey='LastName'>
								        <RelatedProperty PropertyKey='Person'/>
								     </Argument> 
								     <Argument PropertyKey='FirstName'>
								        <RelatedProperty PropertyKey='Person'/>
								     </Argument>
								</Sortable>
						    </DisplayProperty>
							<DisplayProperty PropertyKey='CreateDate' Width='55%' Format='MM/dd/yyyy' ColumnHeader='Last Modified Date' NoWrap='true'>	
							    <Sortable>
								   <Argument PropertyKey='CreateDate'/>						
								</Sortable>
						    </DisplayProperty>
				       </Control>
				      </DisplayProperty> 
			    
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
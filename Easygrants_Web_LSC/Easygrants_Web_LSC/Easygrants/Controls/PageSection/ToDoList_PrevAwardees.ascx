<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cToDoList_Awardees" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br>

<span id='spnToDoListPrevAwardees' runat='server'/>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

        <DataObject Key='ToDoListPrevGar' DataObjectDefinitionKey='ToDoListPrevGar'>
                   <Filters>
                         <Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
                   </Filters>
                   <Sort>
				         <Argument PropertyKey='ServiceArea'/>
			       </Sort>
                   <DisplayProperties>
                         <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
                               <Control ID='ctlToDoListPrevAwardees'
						                Container='spnToDoListPrevAwardees'
						                Type='cDataListCtl'
						                DataObjectDefinitionKey='WfTaskAssignment'
						                SeparatorWidth='2'
						                MaxPerPage='22'>
						                <HeaderHtml>
							
						                </HeaderHtml>
						                <InstructionHtml>
							
						                </InstructionHtml>
						
						              <DisplayProperty PropertyKey='Description' ColumnHeader='Description' Width='30%' />
						              <DisplayProperty PropertyKey='ServiceArea' ColumnHeader='Service Area' Width='10%' />
						              <DisplayProperty PropertyKey='WfTAYear' ColumnHeader='Year' Width='10%' />
						
                               </Control>
                           </DisplayProperty>
                   </DisplayProperties>
                  
              
              
              
              
              
              
         </DataObject>
     </ModuleSection>
  </span>
  
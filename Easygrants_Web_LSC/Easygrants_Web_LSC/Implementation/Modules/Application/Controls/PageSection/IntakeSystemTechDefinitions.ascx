<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

  
  <!-- USER MODIFIABLE CONTENT AREA -->
 <table width="600" border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td><h1>Intake System Technology Definitions </h1>
       <ol>
         <li><strong>Automated attendant: </strong>A telephone system feature that automatically answers incoming calls using a computer program instead of a live person. This feature may offer options to the caller, or connect the call to voice mail.&nbsp; </li>
         <li><strong>Automatic call distribution: </strong>A software application that delivers calls on a first come, first served basis. Calls are held and transferred automatically to the first available staff person assigned to those calls.</li>
         <li><strong>Interactive voice response: </strong>A system feature requiring a response from the caller, often using specifically designed recordings within the phone system.</li>
         <li><strong>Phone system: </strong>The computer software and/or equipment used to handle telephone calls.</li>
         <li><strong>Self-direct: </strong> When a caller, whose call is answered by an automated attendant, can decide where their call will be answered or handled. Examples include choosing to go to a voice mailbox or selecting a staff persons extension.</li>
         <li><strong>Self-select: </strong>An ACD feature allowing callers to choose between options of pre-recorded messages.</li>
         <li><strong>Telephony integration: </strong>Telephony is the technology that electronically transmits voice, fax, email and other communications between two or more parties, integrating telephone and computer capabilities. Also referred to as Voice Over IP.</li>
       </ol>
     </td>
   </tr>
 </table>


 <p style="text-align:center"><span runat='server' id='spnClose' /></p>
  <!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
  <ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Image='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PV_Intake_System' />
								<Argument Type='QueryString' TypeKey='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
  </ModuleSection>
</span>

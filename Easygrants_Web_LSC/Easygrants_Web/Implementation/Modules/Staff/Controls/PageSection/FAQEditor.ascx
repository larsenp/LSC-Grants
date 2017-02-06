<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="FAQEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cFAQEditor" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
<br>
<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td class='SeparatorHdg' colspan='2'>Add or Edit FAQ</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="15%" valign='top'><b>Question</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span runat='server' id='spnQuestion'></span>
			<asp:CustomValidator id="valQuestion" runat="server"
				OnServerValidate="ValidateQuestion"
				Display="None"
				ErrorMessage="Question is required."/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Limit: 300 characters</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top'><b>Answer</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span runat='server' id='spnAnswer'></span>
			<asp:CustomValidator id="valAnswer" runat="server"
				OnServerValidate="ValidateAnswer"
				Display="None"
				ErrorMessage="Answer is required."/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>Limit: 1000 characters</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Display To</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>Public&nbsp;&nbsp;&nbsp;<span runat='server' id='spnPublic'></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Staff&nbsp;&nbsp;&nbsp;<span runat='server' id='spnStaff'></span>
			<asp:CustomValidator id="valDisplayTo" runat="server"
				OnServerValidate="ValidateDisplayTo"
				Display="None"
				ErrorMessage="Display To is required."/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td  align="Center" Colspan='3'><span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnSaveandClose'/>&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='FAQ' DataObjectDefinitionKey='FAQ' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='FAQID' PropertyKey='FAQID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>			    
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Question'>
					<Control ID='ctlQuestion'
						Container='spnQuestion'
						Type='cTextArea'
						Rows='3'
						Cols='60'
						MaxLength='300' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Answer'>
					<Control ID='ctlAnswer'
						Container='spnAnswer'
						Type='cTextArea'
						Rows='5'
						Cols='60'
						MaxLength='1000'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsPublicAvailable'>
					<Control ID='ctlIsPublicAvailable' 
						Container='spnPublic' 
						Type='cCheckBox' 
						StoredValue='1' 
						DisplayValue='IsPublicAvailable'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsStaffAvailable'>
					<Control ID='ctlIsStaffAvailable' 
						Container='spnStaff' 
						Type='cCheckBox' 
						StoredValue='1' 
						DisplayValue='IsStaffAvailable'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' 
						Type='cButton' 
						Image='Save'>
						<Action PostBack='True' 
							AutoSave='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='FAQEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='FAQ' DataObjectPropertyKey='FAQID' PropertyKey='FAQID' BaseValue='FAQID='/>
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveandClose' Container='spnSaveandClose' 
						Type='cButton' 
						Image='Save and Close'>
						<Action PostBack='True' 
							AutoSave='True' 
							Object='EventController' 
							Method='EventController_NavigateToURL'>
							<Parameters>
					   			<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' 
						Container='spnClose' 
						Type='cButton' 
						Image='Close'>
						<Action PostBack='True' 
							Object='EventController' 
							Method='EventController_NavigateToURL'>
							<Parameters>
							   	<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>

<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br />
<p><b>Performance Area <span runat="server" id='spnPA' /></b></p>
<p>Criterion <span runat='server' id='spnC'/> </p>
<div class="SeparatorHdg" >Instructions</div>
<p> To be Determined</p>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
	
<div width='100%' class='SeparatorHdg'>
	Score
</div>
<br />
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
		<td valign='top'>
			<span runat='server' id='spnQ' />&nbsp;
		</td>
		<td valign='top'>
			<span runat='server' id='spnQDesc' />
			<span runat='server' id='spnSubtopics' />
		</td>
		<td align='right' valign='top'>
			<span runat='server' id='spnScore' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table>
  <tr>
     <td><span runat='server' id='spnFormButton' /></td>
  </tr>
</table>
<br />
<div width='50%' class='MinorSeparatorHdg'>
	Applicant Response
</div>
<br />
<span runat='server' id='spnApplicantResponse' />
<br />
<br />
<div width='100%' class='SeparatorHdg'>
	Strong Elements
</div>
<br />
<p>Check all that apply.</p>
<span runat='server' id='spnStrongElements' />

<div width='100%' class='SeparatorHdg'>
	Weak Elements
</div>
<br />
<p>Check all that apply.</p>
<span runat='server' id='spnWeakElements' />

<div width='100%' class='SeparatorHdg'>
	Comments
</div>
<br />
<p>Enter an optional comment.</p>
<span runat='server' id='spnComment' />
<br /><br />
<table width='100%'>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave' />&nbsp;
			<span runat='server' id='spnSaveReturn' />
		</td>
	</tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

	    <DataObject Key='ReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
			</Filters>
		</DataObject>
	
	   <DataObject Key='LscCategoryWithInquiries' DataObjectDefinitionKey='LscCategoryWithInquiries' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewInquiryID' PropertyKey='InquiryID' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='PA'>
					<Control ID='spnPA'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CriterionAbbr'>
					<Control ID='spnC'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Q'>
					<Control ID='spnQ'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='InquiryDesc'>
					<Control ID='spnQDesc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		<DataObject Key='LscReviewSubtopic' DataObjectDefinitionKey='LscReviewSubtopic' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='Abbr' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSubtopics'
						Type='cDataListCtl'
						Container='spnSubtopics'
						DataObjectDefinitionKey='LscReviewSubtopic'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='Abbr' />
						<DisplayProperty PropertyKey='Description' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentInquiry' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='QueryString' TypeKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
				<Argument Type='QueryString' TypeKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlScore'
						Type='cDropDown'
						Container='spnScore'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtComment'
						Type='cTextArea'
						Container='spnComment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewInquiry' DataObjectDefinitionKey='LscReviewInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					 <Control ID='btnForm'
						      Type='cButton'
						      Container='spnFormButton'
						      Caption='View Form'>
						     <Visible>
							        <Argument PropertyKey='FormPageKey' Value='' Operator='NotEqual'/>
						     </Visible>
						     <Action PostBack='True' 
							        Object='EventController'
							        Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
							        <Parameters>			
										<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='FormPageKey' />
										<Argument Type='DataObjectCollection' TypeKey='LscReviewInquiry' DataObjectPropertyKey='LscReviewInquiryID' BaseValue='LscReviewInquiryID='/>
										<Argument Value='PageFrame=Print' />
									</Parameters>
						     </Action>	
					   </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
		
		<DataObject Key='AppWfTAResponse' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='2' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
			</Filters>
		</DataObject>
		
	   <DataObject Key='LscReviewAssignmentInquiryResponse' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTAResponse' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='QueryString' TypeKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
			</Filters>
			<DisplayProperties>	
			   <DisplayProperty PropertyKey='Comment'>
					<Control ID='spnApplicantResponse'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='StrongElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='1' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlStrongElements'
						Container='spnStrongElements' 
						Type='cDataPresenterList' 
						DataPresenterID='DPLStrong' 
						DataPresenterURL='Implementation/Modules/ApplReview/Controls/PageSection/StrongElementGridItem.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WeakElements' DataObjectDefinitionKey='LscReviewInquiryElement' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscReviewInquiryID' PropertyKey='LscReviewInquiryID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='2' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlWeakElements'
						Container='spnWeakElements' 
						Type='cDataPresenterList' 
						DataPresenterID='DPLWeak' 
						DataPresenterURL='Implementation/Modules/ApplReview/Controls/PageSection/WeakElementGridItem.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
			<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveReturn'
						Type='cButton'
						Container='spnSaveReturn'
						Caption='Save and Return to Category List'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnPageKey' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	
	</ModuleSection>
</span>

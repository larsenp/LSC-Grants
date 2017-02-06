<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Capacity to Comply With LSC Acts, Regulations, and Ethical Standards
</div>

<table>
	<tr>
		<td width='80%'>
			<b>1. Does the application indicate any potential violation of Public Law 104-134 (the 1996 LSC Appropriations Act, and subsequent Appropriations Acts)? <%=kDenoteRequiredField %></b>
		</td>
		<td width='20%' align='center' >
			<span runat="server" id='spnViolationPL' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnComment2' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='80%'>
			<b>2. Does the application indicate any potential violation of other applicable provisions of the LSC Act, 
			rules, regulations, guidelines, and instructions, or of any ethical requirements? <%=kDenoteRequiredField %></b>
		</td>
		<td width='20%' align='center' >
			<span runat="server" id='spnViolationOther' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnComment3' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='80%'>
			<b>3. Does the application (supplemental documentation) indicate that any claims were made, during the 
			past three years, under the applicant's current malpractice, errors and omissions, or fidelity and 
			liability insurance? <%=kDenoteRequiredField %></b>
		</td>
		<td width='20%' align='center' >
			<span runat="server" id='spnClaims' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnComment4' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Conflicts of Interest
		</td>
	</tr>
	<tr>
		<td width='80%'>
			<b>4. Does the application disclose any actual or potential conflicts of interest? <%=kDenoteRequiredField %></b>
		</td>
		<td width='20%' align='center' >
			<span runat="server" id='spnConflicts1' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnComment5' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='80%'>
			<b>5. Is the reader concerned that the applicant does not have the capacity to protect against any conflicts 
			that may arise during the term of the grant? <%=kDenoteRequiredField %></b>
		</td>
		<td width='20%' align='center' >
			<span runat="server" id='spnConflicts2' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnComment6' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Subgrants
		</td>
	</tr>
	<tr>
		<td width='80%'>
			<b>6. Does the application indicate that: <%=kDenoteRequiredField %></b>
			<ul>
				<li>twenty-five percent (25%) or more of the grant award will be allocated by subgrant, or</li>
				<li>subgrant is proposed for delivering a full range of services to a specific geographic area within the applicant's service area</li>
			</ul>
		</td>
		<td width='20%' align='center' >
			<span runat="server" id='spnSG1' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='80%'>
			<b>7. Does the application indicate that: <%=kDenoteRequiredField %></b><br />
			Did the applicant submit a "Certification of Intent to Enter into a Subgrant Agreement" (RFP Attachment 3)? 
		</td>
		<td width='20%' align='center' >
			<span runat="server" id='spnSG2' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ViolationPL'>
					<Control ID='rdoViolationPL'
						Type='cRadioButtonList'
						Container='spnViolationPL'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ViolationOther'>
					<Control ID='rdoViolationOther'
						Type='cRadioButtonList'
						Container='spnViolationOther'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Claims'>
					<Control ID='rdoClaims'
						Type='cRadioButtonList'
						Container='spnClaims'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Conflicts1'>
					<Control ID='rdoConflicts1'
						Type='cRadioButtonList'
						Container='spnConflicts1'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Conflicts2'>
					<Control ID='rdoConflicts2'
						Type='cRadioButtonList'
						Container='spnConflicts2'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SG1'>
					<Control ID='rdoSG1'
						Type='cRadioButtonList'
						Container='spnSG1'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SG2'>
					<Control ID='rdoSG2'
						Type='cRadioButtonList'
						Container='spnSG2'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewApplicationHtml' DataObjectDefinitionKey='LscReviewApplicationHtml' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscReviewApplication' DataObjectPropertyKey='LscReviewApplicationID' PropertyKey='LscReviewApplicationID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment2' HtmlEncode='False'>
					<Control ID='spnComment2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment3' HtmlEncode='False'>
					<Control ID='spnComment3'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment4' HtmlEncode='False'>
					<Control ID='spnComment4'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment5' HtmlEncode='False'>
					<Control ID='spnComment5'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment6' HtmlEncode='False'>
					<Control ID='spnComment6'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

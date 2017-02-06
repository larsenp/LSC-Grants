<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="SeparatorHdg"><b>Confidentiality Agreement</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><span id='spnPageContent' runat='server' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr align="center">
		<td>
			<asp:TextBox ID='txtTerms' CausesValidation="false" Columns='100' Rows="25" TextMode="MultiLine" Height='400' ReadOnly='true' Visible="true" runat='server' Text="
As a reviewer for the granting organization, please read the following policies on Conflict of Interest and Confidentiality and indicate your acceptance.

POLICY ON CONFLICTS OF INTEREST

	The granting organization, acting through its review committees, Scientific Advisory Board (&quot;SAB&quot;), and volunteers, evaluates applications for, and makes decisions with respect to, research grants, fellowships, career development awards, contracts and active projects (each an &quot;Award&quot;).  The granting organization wishes to ensure that its evaluation process is as objective as possible and free from conflicts of interest.  Granting organization recognizes that individuals involved in the Award evaluation and granting process are involved in a variety of organizations and projects, and may hold financial investments, which might create actual or potential conflicts of interest or the appearance of a conflict.

	granting organization is committed to assuring that these important decisions regarding research grants and other Awards are made by those who are free of actual or potential conflicts of interest and the appearance of conflicts (each a &quot;conflict&quot; or &quot;conflict of interest&quot;).  To achieve that result, the following policy is adopted:

1. Applicability. This Policy applies to granting organization employees (present or former), committee members (including lay and scientific members of granting organization’s scientific research review committees), and other volunteers, including researchers who have volunteered to evaluate Award proposals (collectively, &quot;Covered Persons&quot;).

2. Determining the Existence of a Conflict. Each Covered Person bears the personal responsibility for initially determining if a conflict of interest exists with respect to such Covered Person.  The guidelines set forth below shall be utilized to determine the existence of a conflict. The guidelines are meant to be illustrative and not exclusive; a conflict may exist even though the situation in question is not included below.  If a Covered Person has any questions regarding the existence of a conflict, such Covered Person should promptly contact the chairman of the committee on which he/she serves, as the case may be.

3. Guidelines for Determining Existence of Conflict. A conflict may exist if the Covered Person, or his/her spouse, parent, child, or other individual with whom such Covered Person has a close personal, business or professional relationship (including persons with whom such Covered Person is a partner, shareholder in a closely-held corporation, co-author or other close professional co-worker or colleague):

As used herein, &quot;Applicant&quot; means any person, firm, corporation (nonprofit or for profit), partnership, trust, incorporated or unincorporated association, joint venture, joint stock company, governmental authority, educational institution or any other entity of any kind, which is under consideration by granting organization for an Award or other consideration which may inure to the benefit of such entity or person.

(i) owns, directly or indirectly, any equity interest in the Applicant including the ownership of over 1% of the outstanding shares of publicly traded companies.

(ii) is an officer, director, employee, consultant, trustee of, or has a significant ownership, governance, or management relationship with the Applicant;

(iii) owns, directly or indirectly, in whole or in part, any tangible or intangible property that the Applicant uses in the conduct of its business;

(iv) is owed any amount by the Applicant, or owes any amount to the Applicant;

(v) is a party to any agreement for future employment or other agreements or arrangements with Applicant;

(vi) has received any gifts with a value, or payments in excess of, $100 from an Applicant;

(vii) has any cause of action against, any dispute with, any long-standing scientific or personal differences with, or any claim whatsoever against, the Applicant;

(viii) is or was (within the last 1 year) a student or teacher of the Applicant;

(ix) a close personal friend of Applicant or any person in senior management of Applicant; or

(x) has a significant ownership, governance, or management relationship with a direct competitor of an Applicant, such that a conflict of interest could be alleged should the Applicant’s grant request be rejected.

4. Disclosure of Conflict; Recusal. If a Covered Person determines that a conflict exists, then such Covered Person shall notify immediately the chairman of the applicable Committee, as the case may be.  The Chairman of the applicable Committee, with input from the granting organization program director or Committee, shall determine whether a conflict exists (except that in cases of conflicts involving the Chairman, the Vice Chairman shall decide).  The decision on conflicts and the basis therefor shall be recorded in the minutes.  Unless otherwise determined by the Chairman (or, as appropriate, the Vice Chairman) in individual cases, if a conflict is found to exist, the affected person shall recuse him/herself from all discussions, determinations and votes with respect to the Applicant with which the conflict exists, and shall excuse him/herself from all meetings at which any discussions regarding the Applicant take place.  Following the termination of such discussions or determinations concerning the Applicant, such Covered Person may re-join the meeting.

5. Implementation. Each Covered Person, other than an employee, shall execute a written statement provided by granting organization stating that such Covered Person has read this Policy on Conflicts of Interest, understands its terms and agrees to comply with the provisions hereof so long as he/she is a Covered Person.  With respect to employees, each employee shall execute a written statement provided by granting organization stating that such employee has read the Employee Handbook, understands its terms and agrees to comply with the provisions thereof.  Such written statements shall be signed by an individual upon his/her appointment or other act resulting in him/her being a Covered Person, and periodically thereafter at such times as the Chairman of the Board of Directors determines.

POLICY ON CONFIDENTIALITY


	The granting organization, acting through its officers, employees, committees, Scientific Advisory Board (&quot;SAB&quot;), volunteers, evaluates applications for, and makes decisions with respect to, research grants, fellowships, career development awards, contracts and active projects (each an &quot;Award&quot;).

	In the course of reviewing applications for Awards, individuals involved in the Award reviewing and granting process may receive, and be given access to, confidential information concerning an Applicant.  As used herein, &quot;Applicant&quot; means any person, firm, corporation (nonprofit or for profit), partnership, trust, incorporated or unincorporated association, joint venture, joint stock company, governmental authority, educational institution or any other entity of any kind, which is under consideration by granting organization for an Award or other consideration which may inure to the benefit of such entity or person.

	To ensure that the confidentiality of the information will be maintained, the following Policy on Confidentiality is adopted.

1. Applicability. This Policy applies to granting organization’s officers, employees, committee members, all lay and scientific members of the SAB and other granting organization scientific research review committees, and other volunteers, including researchers who have volunteered to review Award proposals (collectively, &quot;Covered Persons&quot;).

2. Definition of Confidential Information. &quot;Confidential Information&quot; means (i) all written business, financial, technical and scientific information relating to the Applicant and submitted by the Applicant to granting organization for consideration of an Award, including but not limited to, samples of materials, solutions, scientific protocols, plans for further developments, marketing strategies and financial projections, and which Applicant has marked conspicuously &quot;CONFIDENTIAL,&quot; &quot;PROPRIETARY,&quot; or similar marking, or (ii) oral information which Applicant timely specifies is confidential.  &quot;Confidential Information&quot; shall exclude information which (a) is in the public domain at the time of disclosure; (b) is in the possession of granting organization (including any Covered Person) free of any obligation of confidence prior to the time of disclosure; (c) though originally within the definition of &quot;Confidential Information&quot;, subsequently becomes part of the public knowledge through no fault of granting organization (including any Covered Person), as of the date of its becoming part of the public knowledge; (d) though originally within the definition of &quot;Confidential Information&quot;, subsequently is received by granting organization (including any Covered Person) without any obligation of confidentiality from a third party who is free to disclose the information, as of the date of such third-party disclosure; or (e) is independently developed by granting organization without the use of any Confidential Information.

3. Nondisclosure of Confidential Information. For a period of three (3) years following receipt of any Confidential Information (unless otherwise determined by granting organization in individual cases), each Covered Person agrees not to disclose to any person outside granting organization or its affiliates (including for these purposes Chapters and International Affiliates) any Confidential Information furnished by an Applicant, except as provided below.  Each Covered Person agrees that he/she will utilize the Confidential Information only for the purpose of evaluating the Applicant’s application for a grant from granting organization and for no other purpose.  Notwithstanding the foregoing, a Covered Person may disclose the Confidential Information (i) to employees, professional advisors, volunteer scientists and other Covered Persons asked to review the Application, consultants and agents ofgranting organization who have a need to know and who have been informed of this Policy on Confidentiality, or (ii) to the extent required by a court order or by law.  Each Covered Person shall use the same degree of care, but not less than a reasonable degree of care, that he/she uses to protect granting organization’s own most highly confidential information to prevent any unauthorized or inadvertent disclosure of Confidential information.

	Any individual having question(s) concerning this policy or its applicability in a given situation(s) should address those question(s) to the appropriate granting organization staff person.

4. Return of Confidential Information. Each Covered Person agrees to return to the Chairman of the Board or the applicable committee, as the case may be, all tangible materials incorporating Confidential Information made available or supplied to such Covered Person and all copies and reproductions thereof upon request of the Chairman of the Board or the applicable committee, as the case may be, or the Applicant.

5. Implementation. Each Covered Person, other than an employee, shall execute a written statement provided by granting organization stating that such Covered Person has read this Policy on Confidentiality, understands its terms and agrees to comply with the provisions hereof so long as he/she is a Covered Person. With respect to employees, each employee shall execute a written statement provided by granting organization stating that such employee has read the Employee Handbook, understands its terms and agrees to comply with the provisions thereof.  Such written statements shall be signed by an individual upon his/her appointment or other act in his/her being a Covered Person, and periodically thereafter at such times as the Chairman of the Board or other officer of granting organization determines.   

CERTIFICATION REGARDING 
CONFLICTS OF INTEREST and CONFIDENTIALITY OF INFORMATION 

I have read and understand the above Policy on Conflicts of Interest and agree to abide by same during all times that I am a Covered Person, as defined in the Policy.

I have read and understand the above Policy on Confidential Information and agree to abide by same and I fully understand the confidential nature of the application evaluation and review group discussions related and agree (1) to return all review-related materials; (2) not to discuss, at any time, these materials or the review proceedings with any individual except the Official(s) in Charge of the Review; and (3) to refer to all inquiries made of me concerning any aspect of the review proceedings to the Official(s) in Charge of the Review.
			" />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td valign='top'>&nbsp;</td>
		<td><span id='spnConfidentialityAgreement' runat='server'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
<tr>
	<td>
		<span runat='server' id='spnSaveAndClose'/>
	</td>
</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent />
		<DataObject Key='ReviewWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</Filters>
		</DataObject>
		<DataObject Key='ReviewCycleStage' DataObjectDefinitionKey='ReviewCycleStage' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTaskAssignment' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</Filters>
		</DataObject>
		<DataObject Key='PersonReviewerConfidentiality' DataObjectDefinitionKey='PersonReviewerConfidentiality' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleStage' DataObjectPropertyKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleStage' DataObjectPropertyKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCycleStage' DataObjectPropertyKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsConfidentialityAccepted'>
					<Control ID='ctlWfProject'
						Container='spnConfidentialityAgreement'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'>						
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='I Accept'/>
							<Parameter StoredValue='False' DisplayValue='I Do Not Accept'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Continue'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
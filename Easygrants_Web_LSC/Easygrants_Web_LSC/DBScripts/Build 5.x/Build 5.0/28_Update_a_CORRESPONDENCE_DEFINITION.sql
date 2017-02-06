UPDATE [a_CORRESPONDENCE_DEFINITION]
   SET [title] = 'Grant Application Submission Confirmation'
      ,[correspondence_to] = '[Person.PersonPrimaryEMail.ContactValue1]'
      ,[correspondence_from] = 'techsupport@lsc.gov'
      ,[correspondence_cc] = 'competition@lsc.gov'
      ,[correspondence_bcc] = ''
      ,[subject] = 'LSC Grant Application Confirmation'
      ,[body] = '<p>    Dear [Person.FirstName] [Person.LastName]:</p>  <p> LSC has received the grant application filed by [GranteeProject.PrimaryOrganization.OrganizationName].</p>  <p><strong> LSC will contact you if something further is required. </strong></p>  <p><strong><font color="#0033CC">STEPS TO TAKE FOR IMMEDIATE APPLICANT ASSISTANCE</font></strong></p>  <p>Submit inquiries regarding the RFP and the competitive grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov">competition@lsc.gov</a>. </p>  <p>Submit inquiries pertaining to technical issues and using the website application to <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a>. </p>  <p>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov">haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. Visit the LSC grants website at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a> regularly to remain current on the LSC grants competition.</p>'
      ,[is_html] = 1
      ,[correspondence_description] = 'Grant Application Submission Confirmation'
      ,[is_log] = 1
      ,[correspondence_from_name] = 'LSC Grants Tech Support'
 WHERE correspondence_definition_id = 7

UPDATE [a_CORRESPONDENCE_DEFINITION]
   SET [title] = 'NIC Approved'
      ,[correspondence_to] = '[GranteeProject.PrimaryPerson.PersonPrimaryEMail.ContactValue1]'
      ,[correspondence_from] = 'techsupport@lsc.gov'
      ,[correspondence_cc] = null
      ,[correspondence_bcc] = 'competition@lsc.gov'
      ,[subject] = 'LSC NIC Approved'
      ,[body] = '<p> Dear [GranteeProject.PrimaryPerson.Prefix.Prefix] [GranteeProject.PrimaryPerson.FirstName] [GranteeProject.PrimaryPerson.LastName]:</p>  <p> LSC has received and reviewed the Notice of Intent to Compete (NIC) filed by [GranteeProject.PrimaryOrganization.OrganizationName].</p>  <p><strong> The NIC is approved.</strong></p>  <p> Please log into LSC Grants to begin preparing the 2010 competitive grant application. The deadline for filing the application is June 5, 2009.</p>  <p><strong> <font color="#0033CC">FREE TELEPHONIC CONFERENCE TO ASSIST APPLICANTS DEVELOP A COMPETITIVE GRANT APPLICATION</font></strong></p>  <p>LSC will conduct an Applicant informational session Wednesday, May 6, 2009 (2:00 p.m. E.D.T.) to respond to Applicants'' questions concerning this RFP. This is a free telephonic conference. It is designed to provide an understanding of the information needed to prepare the FY 2010 grant proposal and to promote participation in the competition process. </p>  <p>Registration materials for this telephonic conference are found at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a>. Once at the site, go to 2010 RFP Appendices, then click on the links at Appendix H. Applicants will have an opportunity prior to and during the session to email questions to LSC for response. Applicants are encouraged to participate in the telephonic conference. </p>  <p><strong><font color="#0033CC">STEPS TO TAKE FOR IMMEDIATE APPLICANT ASSISTANCE</font></strong></p>  <p>Submit inquiries regarding the RFP and the competitive grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov">competition@lsc.gov</a>. </p>  <p>Submit inquiries pertaining to technical issues and using the website application to <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a>. </p>  <p>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov">haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. Visit the LSC grants website at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a> regularly to remain current on the LSC grants competition.</p>  </body>'
      ,[is_html] = 1
      ,[correspondence_description] = 'NIC Approved'
      ,[is_log] = 1
      ,[correspondence_from_name] = 'LSC Grants Tech Support'
 WHERE correspondence_definition_id = 29

UPDATE [a_CORRESPONDENCE_DEFINITION]
   SET [title] = 'NIC Not Approved'
      ,[correspondence_to] = '[GranteeProject.PrimaryPerson.PersonPrimaryEMail.ContactValue1]'
      ,[correspondence_from] = 'techsupport@lsc.gov'
      ,[correspondence_cc] = NULL
      ,[correspondence_bcc] = 'competition@lsc.gov'
      ,[subject] = 'LSC NIC Not Approved'
      ,[body] = '<p> Dear [GranteeProject.PrimaryPerson.Prefix.Prefix] [GranteeProject.PrimaryPerson.FirstName] [GranteeProject.PrimaryPerson.LastName]:</p>  <p> LSC has received and reviewed the Notice of Intent to Compete (NIC) filed by [GranteeProject.PrimaryOrganization.OrganizationName].</p>  <p> <strong>The NIC is not approved.</strong></p>  <p> Please contact Reginald Haley regarding this matter at: </p>  <p> Office of Program Performance <br>  Legal Services Corporation <br>  Email: <a href="mailto:haleyr@lsc.gov">haleyr@lsc.gov</a><br>  Phone: 202.295.1545</p>  <p> Note: The deadline for filing the NIC is May 15, 2009. The deadline for filing the 2010 competitive grant application is June 5, 2009.</p>  <p><strong> <font color="#0033CC">FREE TELEPHONIC CONFERENCE TO ASSIST APPLICANTS DEVELOP A COMPETITIVE GRANT APPLICATION</font></strong></p>  <p>LSC will conduct an Applicant informational session Wednesday, May 6, 2009 (2:00 p.m. E.D.T.) to respond to Applicants'' questions concerning this RFP. This is a free telephonic conference. It is designed to provide an understanding of the information needed to prepare the FY 2010 grant proposal and to promote participation in the competition process. </p>  <p>Registration materials for this telephonic conference are found at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a>. Once at the site, go to 2010 RFP Appendices, then click on the links at Appendix H. Applicants will have an opportunity prior to and during the session to email questions to LSC for response. Applicants are encouraged to participate in the telephonic conference. </p>  <p><strong><font color="#0033CC">STEPS TO TAKE FOR IMMEDIATE APPLICANT ASSISTANCE</font></strong></p>  <p>Submit inquiries regarding the RFP and the competitive grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov">competition@lsc.gov</a>. </p>  <p>Submit inquiries pertaining to technical issues and using the website application to <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a>. </p>  <p>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov">haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. Visit the LSC grants website at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a> regularly to remain current on the LSC grants competition.</p>  '
      ,[is_html] = 1
      ,[correspondence_description] = 'NIC Not Approved'
      ,[is_log] = 1
      ,[correspondence_from_name] = 'LSC Grants Tech Support'
 WHERE correspondence_definition_id = 109

UPDATE [a_CORRESPONDENCE_DEFINITION]
   SET [title] = 'NIC Submission Confirmation'
      ,[correspondence_to] = '[GranteeProject.PrimaryPerson.PersonPrimaryEMail.ContactValue1]'
      ,[correspondence_from] = 'techsupport@lsc.gov'
      ,[correspondence_cc] = 'competition@lsc.gov'
      ,[correspondence_bcc] = ''
      ,[subject] = 'LSC NIC Submission Confirmation'
      ,[body] = 'Dear [Person.FirstName] [Person.LastName]:  <p>LSC has received the Notice of Intent to Compete (NIC) filed by [GranteeProject.PrimaryOrganization.OrganizationName].</p>  <p>You will receive another email indicating whether it has been approved or not. </p>  <p><strong><font color="#0033CC">FREE TELEPHONIC CONFERENCE TO ASSIST APPLICANTS DEVELOP A COMPETITIVE GRANT APPLICATION</font></strong></p>  <p>LSC will conduct an Applicant informational session Wednesday, May 6, 2009 (2:00 p.m. E.D.T.) to respond to Applicants'' questions concerning this RFP. This is a free telephonic conference. It is designed to provide an understanding of the information needed to prepare the FY 2010 grant proposal and to promote participation in the competition process. </p>  <p>Registration materials for this telephonic conference are found at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a>. Once at the site, go to 2010 RFP Appendices, then click on the links at Appendix H. Applicants will have an opportunity prior to and during the session to email questions to LSC for response. Applicants are encouraged to participate in the telephonic conference. </p>  <p><strong><font color="#0033CC">STEPS TO TAKE FOR IMMEDIATE APPLICANT ASSISTANCE</font></strong></p>  <p>Submit inquiries regarding the RFP and the competitive grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov">competition@lsc.gov</a>. </p>  <p>Submit inquiries pertaining to technical issues and using the website application to <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a>. </p>  <p>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov">haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. Visit the LSC grants website at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a> regularly to remain current on the LSC grants competition.</p>'
      ,[is_html] = 1
      ,[correspondence_description] = 'NIC Submission Confirmation'
      ,[is_log] = 1
      ,[correspondence_from_name] = 'LSC Grants Tech Support'
 WHERE correspondence_definition_id = 111

UPDATE [a_CORRESPONDENCE_DEFINITION]
   SET [title] = 'Grant Application Accepted'
      ,[correspondence_to] = '[GranteeProject.PrimaryPerson.PersonPrimaryEMail.ContactValue1]'
      ,[correspondence_from] = 'techsupport@lsc.gov'
      ,[correspondence_cc] = NULL
      ,[correspondence_bcc] = 'competition@lsc.gov'
      ,[subject] = 'LSC Grant Application Accepted'
      ,[body] = '<p>  Dear [GranteeProject.PrimaryPerson.Prefix.Prefix] [GranteeProject.PrimaryPerson.FirstName] [GranteeProject.PrimaryPerson.LastName]:</p>  <p> LSC has received and is currently processing the grant application filed by [GranteeProject.PrimaryOrganization.OrganizationName].</p>  <p><strong> LSC will contact you if something further is required.</strong></p>  <p> <font color="#0033CC"><strong>NONCONFORMING SUBMISSIONS:</strong></font></p>  <p> For applications determined to be substantially complete, but in need of minor amendment, LSC will notify the Applicant of the need for amendment. Applicants will be given seven calendar days from their receipt of the notice to revise and deliver a conforming and complete application to LSC. Applicants who fail to complete and/or revise the application within the designated time period will be disqualified.</p>  <p><strong> Applications determined to be substantially incomplete or nonconforming upon first submission will be rejected. </strong></p>  <p><strong><font color="#0033CC">STEPS TO TAKE FOR IMMEDIATE APPLICANT ASSISTANCE</font></strong></p>  <p>Submit inquiries regarding the RFP and the competitive grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov">competition@lsc.gov</a>. </p>  <p>Submit inquiries pertaining to technical issues and using the website application to <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a>. </p>  <p>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov">haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. Visit the LSC grants website at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a> regularly to remain current on the LSC grants competition.</p>  '
      ,[is_html] = 1
      ,[correspondence_description] = 'Grant Application Accepted'
      ,[is_log] = 1
      ,[correspondence_from_name] = 'LSC Grants Tech Support'
 WHERE correspondence_definition_id = 112

UPDATE [a_CORRESPONDENCE_DEFINITION]
   SET [title] = 'Grant Application Not Accepted'
      ,[correspondence_to] = '[GranteeProject.PrimaryPerson.PersonPrimaryEMail.ContactValue1]'
      ,[correspondence_from] = 'techsupport@lsc.gov'
      ,[correspondence_cc] = NULL
      ,[correspondence_bcc] = 'competition@lsc.gov'
      ,[subject] = 'LSC Grant Application Not Accepted'
      ,[body] = '<p>   Dear [GranteeProject.PrimaryPerson.Prefix.Prefix] [GranteeProject.PrimaryPerson.FirstName] [GranteeProject.PrimaryPerson.LastName]:</p>  <p> LSC has not received one or more of the following components of the grant application for [GranteeProject.PrimaryOrganization.OrganizationName].</p>  <p> Form L Grant application narrative <br>  PAI Plan PDF Upload <br>  Form D12 Projected 2010 Expenses <br>  Form D13 Projected 2010 PAI Expenses <br>  Form D14 Projected 2010 Support and Revenue <br>  Form D2 Projected 2009 Expenses (New Applicants Only) <br>  Form D4 Projected 2009 Support and Revenue (New Applicants Only) <br>  Form E1 Projected 2009 Staffing (New Applicants Only) <br>  Form F1 Governing/Policy Body Summary <br>  Form F2 Governing/Policy Body Detail <br>  Form G1 Projected 2009 Client Service Data (New Applicants Only) <br>  Form G12 Projected 2010 Expenditures by Type of Activity <br>  Form K1 Current 2009 Technology Capacity <br>  Form K2 Current 2009 Technology Software</p>  <p> Please refer to the &ldquo;Review and Submit&rdquo; page at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a> to determine which form has not been submitted. Applicants must log in to access the &ldquo;Review and Submit&rdquo; page. Once you have logged in, click &ldquo;Review and Submit&rdquo; on the left navigation bar to view application forms that have not been submitted.</p>  <p><strong> Note: The deadline for filing the 2010 competitive grant application is June 5, 2009. </strong></p>  <p><strong><font color="#0033CC">STEPS TO TAKE FOR IMMEDIATE APPLICANT ASSISTANCE</font></strong></p>  <p>Submit inquiries regarding the RFP and the competitive grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov">competition@lsc.gov</a>. </p>  <p>Submit inquiries pertaining to technical issues and using the website application to <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a>. </p>  <p>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov">haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. Visit the LSC grants website at <a href="https://grants.lsc.gov">https://grants.lsc.gov</a> regularly to remain current on the LSC grants competition.</p>'
      ,[is_html] = 1
      ,[correspondence_description] = 'Grant Application Not Accepted'
      ,[is_log] = 1
      ,[correspondence_from_name] = 'LSC Grants Tech Support'
 WHERE correspondence_definition_id = 113

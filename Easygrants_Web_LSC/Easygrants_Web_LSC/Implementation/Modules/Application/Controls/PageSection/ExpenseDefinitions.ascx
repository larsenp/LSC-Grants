<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

  
  <!-- USER MODIFIABLE CONTENT AREA -->
 <table width="600" border="0" cellspacing="0" cellpadding="0">
   <tr>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td><h1>Expense Definitions </h1>
       <p><strong>1 Lawyers:</strong> This category should include all salaries, wages and profits paid to attorneys (other than for contract services), whether employed directly or supervised by the applicant and whether part-time, full-time, or temporary. It also includes law school graduates who have not passed a bar examination.</p>
       <p><strong>2 Paralegals:</strong> This category should include all salaries and wages paid to paralegals, whether employed directly or supervised by the applicant (e.g., senior aides) and whether part-time, full-time, or temporary.</p>
       <p><strong>3 Other Staff:</strong> This category should include all salaries and wages paid to all other staff, whether administrative/clerical staff, students, or others, and whether full-time, part-time, or temporary (e.g., Work/Study).</p>
       <p><strong>4 Employee Benefits:</strong> This category should include all fringe benefits paid on behalf of employees, including retirement, FICA, health and life insurance, worker's compensation, disability insurance, unemployment insurance, day care, and other payroll-related costs.</p>
       <p> <strong> 5 Subtotal expenses for salaries and benefits.</strong> </p>
       <p><strong>6-8 Space:</strong> This category includes rent or lease expenses and mortgage payments which are reported separately. It also includes, under &quot;Other Expenses,&quot; janitorial, maintenance, and utility expenses.</p>
       <p><strong>9 Equipment Rental:</strong> This category includes lease or rental expenses for office furniture, fixtures, and equipment (except telephone). It also includes an estimate of maintenance costs for that equipment, whether pursuant to a service contract or an estimate of individual repair bills.</p>
       <p><strong>10 Office Supplies and Expenses:</strong> This category includes all basic office accessories and supplies, including paper materials and supplies used for copiers. Printing and postage are also to be included in this category. All equipment purchases which cost less than $100 may be placed in this line item.</p>
       <p><strong>11 Telephone:</strong> This category includes costs for the rent or lease of telephone equipment and long distance calls. Similar and related expenses, such as telegraph or other telecommunications, should be included as well.</p>
       <p><strong>12-13 Travel:</strong> This category includes travel expenses required by governing body members for fulfillment of the obligations of governing body membership and those travel expenses for staff related to client services (e.g., circuit riding, attendance at meetings, etc.). Training-related travel is to be reported under &quot;Training.&quot;</p>
       <p><strong>14-15 Training:</strong> This category includes all non-personnel costs associated with the training of board members, staff, and others. Continuing education of staff members should also be included here. Examples are: travel to/from training events, per diem, conference registration fees or tuition, purchase of training materials, rent for facilities used in a training event, consultant fees paid to trainers, etc. Material or capital additions (equipment purchases) for training with a value in excess of $100 should be reported under &quot;Property Acquisition.&quot; No personnel costs should be included here.</p>
       <p><strong>16 Library:</strong> This category includes expenses for the maintenance and normal expansion of office libraries, including subscriptions to periodicals, books, reference materials, and multiple volume sets of law books. Capital additions to the library holdings costing over $100 per item should be included under &quot;Property Acquisition.&quot;</p>
       <p><strong>17 Insurance:</strong> This category includes professional liability insurance, errors and omissions insurance, bonding, property insurance (fire and theft), and liability insurance for property and automobiles.</p>
       <p><strong>18 Dues and Fees:</strong> This category includes dues and fees paid to professional organizations on behalf of the applicant or subrecipient and its staff.</p>
       <p><strong>19 Audit:</strong> This category includes expenses for auditors.</p>
       <p><strong>20 Litigation:</strong> This category includes court costs, witness fees, expert witness expenses, sheriff fees, courthouse copying fees, and other expenses incurred but not reimbursed by clients and not recovered in litigation on behalf of eligible clients.</p>
       <p><strong>21 Property Acquisition:</strong> This category includes equipment, library purchases and other major expenses that occur infrequently, and which are capitalized (e.g., major renovations). <strong>Amortized amounts to be paid toward equipment purchases should be reported under Purchase Payments.</strong></p>
       <p><strong>22 Purchase Payments:</strong> This category includes all payments on loans secured to purchase property over $100.</p>
       <p><strong>23 Contract Services to Clients:</strong> This category includes all payments to private attorneys and other entities who provide legal services to eligible clients, including those services provided pursuant to an LSC subgrant. The applicant's subgrant should be reflected on this line.</p>
       <p><strong>24 Contract Services to Applicant:</strong> This category includes all other services to the applicant such as legal counsel, consultant fees exclusive of those paid for training, use of a computer service bureau, bookkeeping or other accounting services (other than those listed under &quot;Audit&quot;), etc.</p>
     <p><strong>25 Other:</strong> This category includes all remaining applicant expenses that are not identified in these definitions.</p></td>
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
								<Argument Value='CurrentExpensesEditor' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
  </ModuleSection>
</span>
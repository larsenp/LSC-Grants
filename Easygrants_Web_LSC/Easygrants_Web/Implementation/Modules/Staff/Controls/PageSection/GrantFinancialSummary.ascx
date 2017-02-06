<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<br/>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Grant Financial Summary</b></td>
	</tr>	
</table>
<br/>


<table id="Table2"  cellspacing='0' cellpadding='2' runat='server' border='0' width='100%'>
    <tr>
        <td valign="top" width='20%'><b>Award Amount</b></td>
        <td width='10%'><span id='spnAwardAmount' runat='server'/></td>
        <td width='15%'>&nbsp;</td>
        <td width='20%'><b>Remaining to Schedule</b></td>
        <td width='35%'><span id='spnRemainingToSchedule' runat='server'/></td>
    </tr>
    <tr>
        <td valign="top"><b>Payments Total</b></td>
        <td><span id='spnNegTotalPayments' runat='server'/></td>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan='2'><hr></td> 
        <td>&nbsp;</td>      
        <td></td>
        <td></td>
    </tr>
     <tr>
        <td valign="top"><b>Remaining Balance</b></td>
        <td><span id='spnRemainingBalance' runat='server'/></td>
        <td>&nbsp;</td>
        <td></td>
        <td></td>
    </tr>	
</table>
<br/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GFSGranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>		
				<DisplayProperty PropertyKey='TotalPayment.AwardAmount' Format='$#,0.00'>
					<Control ID='spnAwardAmount'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='TotalPayment.NegativeFormatPaymentAmount' Format='$#,0.00;($#,0.00)'>
				<NegativeNumberFormat>&lt;font color=&quot;red&quot; &gt;~&lt;/font&gt;</NegativeNumberFormat>		
					<Control ID='CtlNegTotalPayments'
						Container='spnNegTotalPayments'
						Type='cLabel'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='TotalPaymentScheduled.RequestedAmountRemainingBalance' Format='$#,0.00;($#,0.00)'>
				<NegativeNumberFormat>&lt;font color=&quot;red&quot; &gt;~&lt;/font&gt;</NegativeNumberFormat>		
					<Control ID='CtlRemainingToSchedule'
						Container='spnRemainingToSchedule'
						Type='cLabel'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='TotalPayment.PaymentsRemainingBalance' Format='$#,0.00;($#,0.00)'>
				<NegativeNumberFormat>&lt;font color=&quot;red&quot; &gt;~&lt;/font&gt;</NegativeNumberFormat>		
					<Control ID='CtlRemainingBalance'
						Container='spnRemainingBalance'
						Type='cLabel'>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
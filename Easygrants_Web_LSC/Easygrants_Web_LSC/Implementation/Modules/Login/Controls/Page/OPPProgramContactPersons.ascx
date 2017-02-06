<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>


<!-- USER MODIFIABLE CONTENT AREA -->
<style type="text/css">
<!--
#staff td {
	text-align: left;
	vertical-align: top;
	padding: 6px;
}
#staffmain td {
	text-align: left;
	vertical-align: top;
	padding: 6px;
}
.blue {	color: #0000CC;
}
.green {	color: #009900;
}
.red {	color: #CC0000;
}
#contactpersons td {
	text-align: left;
	vertical-align: top;
	padding: 6px;
}
-->
</style>



      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCRecipientInformation">LSC Recipient Information</a> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=StaffContacts">Staff Contacts</a> | Office of Program Performance (OPP) Program Contacts</td>
        </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><h1>Office of Program Performance (OPP) Program Contacts</h1>
                <p>State Assignments&nbsp;-                January 2011 / By State</p>
                <table width="100%" border="1" cellpadding="0" cellspacing="0" id="contactpersons">
                  <tr bgcolor="#A2B5CD">
                    <td width="42" "><p>&nbsp; </p></td>
                    <td width="132""><p><strong> </strong><strong>State </strong></p></td>
                    <td width="114" "><p ><strong> </strong><strong># of Programs </strong></p></td>
                    <td width="144""><p><strong> </strong><strong>Team / Region</strong><strong></strong></p></td>
                    <td width="162"><p align="left"> <strong>Contact Person</strong><sup><font size="1">1</font></sup><a href="#_ftn1" name="_ftnref1"></a></p></td>
                  </tr>
                   <tr>
                    <td width="42" valign="top"><p> AK </p></td>
                    <td width="132" valign="top"><p> Alaska </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Stephanie Edelstein </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> AL </p></td>
                    <td width="132" valign="top"><p> Alabama </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green"> Willie Abrams</p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> AR </p></td>
                    <td width="132" valign="top"><p> Arkansas </p></td>
                    <td width="114" valign="top"><p align="center"> 2 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green"> Willie Abrams</p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> AZ </p></td>
                    <td width="132" valign="top"><p> Arizona </p></td>
                    <td width="114" valign="top"><p align="center"> 3 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Tim Watson </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> CA </p></td>
                    <td width="132" valign="top"><p> California<sup>2</sup><a href="#_ftn2" name="_ftnref2"></a></p></td>
                    <td width="114" valign="top"><p align="center"> 10 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Chuck Greenfield </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> CA </p></td>
                    <td width="132" valign="top"><p> California<sup>3</sup> <a href="#_ftn3" name="_ftnref3"></a></p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Tim Watson </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> CO </p></td>
                    <td width="132" valign="top"><p> Colorado </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Chuck Greenfield </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> CT </p></td>
                    <td width="132" valign="top"><p> Connecticut </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Cheryl Nolan </p></td>
                  </tr>
                    <tr>
                    <td width="42" valign="top"><p> DC </p></td>
                    <td width="132" valign="top"><p> District of Columbia </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Althea Hayward </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> DE </p></td>
                    <td width="132" valign="top"><p> Delaware </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td class="red" width="162" valign="top"><p class="green"> Mytrang Nguyen</p></td>
                  </tr>
                
                  <tr>
                    <td width="42" valign="top"><p> FL </p></td>
                    <td width="132" valign="top"><p> Florida </p></td>
                    <td width="114" valign="top"><p align="center"> 7 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green"> Mike Genz </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> GA </p></td>
                    <td width="132" valign="top"><p> Georgia </p></td>
                    <td width="114" valign="top"><p align="center"> 2 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green">Mytrang Nguyen</p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> GU </p></td>
                    <td width="132" valign="top"><p> Guam </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Stephanie Edelstein </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> HI </p></td>
                    <td width="132" valign="top"><p> Hawaii </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Stephanie Edelstein </p></td>
                  </tr>
                    <tr>
                    <td width="42" valign="top" height="21"><p> IA </p></td>
                    <td width="132" valign="top"><p> Iowa </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Stephanie Edelstein </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> ID </p></td>
                    <td width="132" valign="top"><p> Idaho </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Stephanie Edelstein </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top" height="21"><p> IL </p></td>
                    <td width="132" valign="top"><p> Illinois </p></td>
                    <td width="114" valign="top"><p align="center"> 3 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Christy Fisher </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> IN </p></td>
                    <td width="132" valign="top"><p> Indiana </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Christy Fisher </p></td>
                  </tr>
                
                  <tr>
                    <td width="42" valign="top"><p> KS </p></td>
                    <td width="132" valign="top"><p> Kansas </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Chuck Greenfield </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> KY </p></td>
                    <td width="132" valign="top"><p> Kentucky </p></td>
                    <td width="114" valign="top"><p align="center"> 4 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green"> Tillie Lacayo </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> LA </p></td>
                    <td width="132" valign="top"><p> Louisiana </p></td>
                    <td width="114" valign="top"><p align="center"> 4 </p></td>
                    <td width="144" valign="top"><p align="center"> <span class="green">South</span> </p></td>
                    <td width="162" valign="top"><p class="green"> Willie Abrams </p></td>
                  </tr>
                   <tr>
                    <td width="42" valign="top"><p> MA </p></td>
                    <td width="132" valign="top"><p> Massachusetts </p></td>
                    <td width="114" valign="top"><p align="center"> 4 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> John Eidleman </p></td>
                  </tr>
                    <tr>
                    <td width="42" valign="top"><p> MD </p></td>
                    <td width="132" valign="top"><p> Maryland </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"><span class="green">South</span></p></td>
                    <td class="red" width="162" valign="top"><p><span class="green">Mytrang Nguyen</span></p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> ME </p></td>
                    <td width="132" valign="top"><p> Maine </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Christy Fisher </p></td>
                  </tr>
                
                 
                  <tr>
                    <td width="42" valign="top"><p> MI </p></td>
                    <td width="132" valign="top"><p> Michigan </p></td>
                    <td width="114" valign="top"><p align="center"> 6 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Althea Hayward </p></td>
                  </tr>
                    <tr>
                    <td width="42" valign="top"><p> MN </p></td>
                    <td width="132" valign="top"><p> Minnesota </p></td>
                    <td width="114" valign="top"><p align="center"> 5 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Evora Thomas </p></td>
                  </tr>
                    <tr>
                    <td width="42" valign="top"><p> MO </p></td>
                    <td width="132" valign="top"><p> Missouri </p></td>
                    <td width="114" valign="top"><p align="center"> 4 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"><span class="green">South</span></p></td>
                    <td class="blue" width="162" valign="top"><p><span class="green">Mytrang Nguyen</span></p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> MP </p></td>
                    <td width="132" valign="top"><p> Micronesia </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Stephanie Edelstein </p></td>
                  </tr>
                
                  <tr>
                    <td width="42" valign="top"><p> MS </p></td>
                    <td width="132" valign="top"><p> Mississippi </p></td>
                    <td width="114" valign="top"><p align="center"> 2 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green"> Willie Abrams </p></td>
                  </tr>
                
                  <tr>
                    <td width="42" valign="top"><p> MT </p></td>
                    <td width="132" valign="top"><p> Montana </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Stephanie Edelstein </p></td>
                  </tr>
                   <tr>
                    <td width="42" valign="top"><p> NC </p></td>
                    <td width="132" valign="top"><p> North Carolina </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green"> Tillie Lacayo </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> ND </p></td>
                    <td width="132" valign="top"><p> North Dakota </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Tim Watson </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> NE </p></td>
                    <td width="132" valign="top"><p> Nebraska </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Evora Thomas </p></td>
                  </tr>
                   <tr>
                    <td width="42" valign="top"><p> NH </p></td>
                    <td width="132" valign="top"><p> New Hampshire </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Cheryl Nolan </p></td>
                  </tr>
                   <tr>
                    <td width="42" valign="top"><p> NJ </p></td>
                    <td width="132" valign="top"><p> New Jersey </p></td>
                    <td width="114" valign="top"><p align="center"> 3 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Christy Fisher </p></td>
                  </tr>
                    <tr>
                    <td width="42" valign="top"><p> NM </p></td>
                    <td width="132" valign="top"><p> New Mexico </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Tim Watson </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> NV </p></td>
                    <td width="132" valign="top"><p> Nevada </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Stephanie Edelstein </p></td>
                  </tr>
                 
                 
                <!--  <tr>
                    <td width="42" valign="top"><p> NJ </p></td>
                    <td width="132" valign="top"><p> New Jersey<sup>5</sup> <a href="#_ftn5" name="_ftnref5"></a></p></td>
                    <td width="114" valign="top"><p align="center"> 3 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Monica Evans </p></td>
                  </tr> -->
                
                  <tr>
                    <td width="42" valign="top"><p> NY </p></td>
                    <td width="132" valign="top"><p> New York </p></td>
                    <td width="114" valign="top"><p align="center"> 7 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Cheryl Nolan </p></td>
                  </tr>
                 
                  <tr>
                    <td width="42" valign="top"><p> OH </p></td>
                    <td width="132" valign="top"><p> Ohio </p></td>
                    <td width="114" valign="top"><p align="center"> 6 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Althea Hayward </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> OK </p></td>
                    <td width="132" valign="top"><p> Oklahoma </p></td>
                    <td width="114" valign="top"><p align="center"> 2 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Evora Thomas </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> OR </p></td>
                    <td width="132" valign="top"><p> Oregon </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Evora Thomas </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> PA </p></td>
                    <td width="132" valign="top"><p> Pennsylvania </p></td>
                    <td width="114" valign="top"><p align="center"> 8 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> John Eidleman </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> PR </p></td>
                    <td width="132" valign="top"><p> Puerto Rico </p></td>
                    <td width="114" valign="top"><p align="center"> 2 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green"> Tillie Lacayo </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> RI </p></td>
                    <td width="132" valign="top"><p> Rhode Island </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Althea Hayward </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> SC </p></td>
                    <td width="132" valign="top"><p> South Carolina </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green"> Tillie Lacayo </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> SD </p></td>
                    <td width="132" valign="top"><p> South Dakota </p></td>
                    <td width="114" valign="top"><p align="center"> 2 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Tim Watson </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> TN </p></td>
                    <td width="132" valign="top"><p> Tennessee </p></td>
                    <td width="114" valign="top"><p align="center"> 4 </p></td>
                    <td width="144" valign="top"><p align="center" class="green"> South </p></td>
                    <td width="162" valign="top"><p class="green"> Tillie Lacayo </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> TX </p></td>
                    <td width="132" valign="top"><p> Texas </p></td>
                    <td width="114" valign="top"><p align="center"> 3 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Stephanie Edelstein </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> UT </p></td>
                    <td width="132" valign="top"><p> Utah </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Evora Thomas </p></td>
                  </tr>
                    <tr>
                    <td width="42" valign="top"><p> VA </p></td>
                    <td width="132" valign="top"><p> Virginia </p></td>
                    <td width="114" valign="top"><p align="center"> 6 </p></td>
                    <td class="green" width="144" valign="top"><p align="center"> South </p></td>
                    <td class="green" width="162" valign="top"><p> Mike Genz </p></td>
                  </tr>
                   <tr>
                    <td width="42" valign="top"><p> VI </p></td>
                    <td width="132" valign="top"><p> Virgin Islands </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="green" width="144" valign="top"><p align="center"> South </p></td>
                    <td class="green" width="162" valign="top"><p>Mytrang Nguyen</p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> VT </p></td>
                    <td width="132" valign="top"><p> Vermont </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Christy Fisher </p></td>
                  </tr>
                 
                
                  <tr>
                    <td width="42" valign="top"><p> WA </p></td>
                    <td width="132" valign="top"><p> Washington </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p>Tim Watson </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> WI </p></td>
                    <td width="132" valign="top"><p> Wisconsin </p></td>
                    <td width="114" valign="top"><p align="center"> 2 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Cheryl Nolan </p></td>
                  </tr>
                  <tr>
                    <td width="42" valign="top"><p> WV </p></td>
                    <td width="132" valign="top"><p> West Virginia </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="red" width="144" valign="top"><p align="center"> North </p></td>
                    <td class="red" width="162" valign="top"><p> Althea Hayward </p></td>
                  </tr>
               
                  <tr>
                    <td width="42" valign="top"><p> WY </p></td>
                    <td width="132" valign="top"><p> Wyoming </p></td>
                    <td width="114" valign="top"><p align="center"> 1 </p></td>
                    <td class="blue" width="144" valign="top"><p align="center"> West </p></td>
                    <td class="blue" width="162" valign="top"><p> Evora Thomas </p></td>
                  </tr>
                </table>                </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><p align="left"><a href="#_ftnref1" name="_ftn1"></a>1 If the Contact Person is not available, please contact the Team Leader <br>
      (<span class="red">North Team &ndash; Althea Hayward</span>, <span class="green">South Team &ndash; Tillie Lacayo</span>, <span class="blue">West Team &ndash; Evora Thomas</span>) </p>
                  <p align="left"><a href="#_ftnref2" name="_ftn2"></a> 2 All programs California except California Indian Legal Services, Inc. </p>
                  <p align="left"><a href="#_ftnref3" name="_ftn3"></a>3 California Indian Legal Services, Inc. </p>
                  <!--<p align="left"><a href="#_ftnref4" name="_ftn4"></a>4 Legal Services of Northwest Jersey, Northeast New Jersey Legal Services Corporation, Essex-Newark Legal Services Project </p>
                  <p align="left"><a href="#_ftnref5" name="_ftn5"></a>5 South Jersey Legal Services, Inc., Ocean-Monmouth Legal Services, Central Jersey Legal Services </p> -->
                  </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
</table>         
            <div style="text-align:center" runat='server' id='spnClose' />
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Login' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
				
			<DisplayProperty PropertyKey=''>
              <Control ID='ctlLogin' Container='spnLogin' Type='cLink' Caption='LSC Grants Login'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='Login' />
                  </Parameters>
                </Action>
              </Control>
            </DisplayProperty>
			
			<DisplayProperty PropertyKey=''>
              <Control ID='ctlLogin' Container='spnLogin' Type='cLink' Caption='LSC Grants Login'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='Login' />
                  </Parameters>
                </Action>
              </Control>
            </DisplayProperty>
							
			</DisplayProperties>
		</DataObject>
    </ModuleSection>
  </span>

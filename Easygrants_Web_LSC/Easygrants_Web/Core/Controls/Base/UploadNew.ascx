<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="UploadNew.ascx.vb" Inherits="Core_Web.Controls.Base.cUploadNew" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' tagname='cTextBox' src='TextBox.ascx' %>
<%@ Register Tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>
<%@ Register Tagprefix='Core' tagname='cLink' src='Link.ascx' %>
<%@ Register Tagprefix='Core' tagname='cStaffUploadNew' src='StaffUploadNew.ascx' %>

<br />

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID='TblInstructions'>
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
	<tr>
		<td>
			<br />
			Please follow these instructions to upload the document.
			<br />
			<br />
			<b>1</b> &nbsp; If available, download the template and save the file to your computer. <br />
			<b>2</b> &nbsp; Open the file and enter the required information. Refer to the guidelines for more information. <br />
			<b>3</b> &nbsp; Save the file on your computer in one of the formats specified below. <br />
			<b>4</b> &nbsp; In the <b>Upload</b> section, click <b>Browse</b> to find the file on your computer. <br />
			<b>5</b> &nbsp; After the file name appears in the text box, click <b>Upload</b>. <br />
			<b>6</b> &nbsp; Click on the <b>File/Document Name</b> to view the document to verify it was accepted by the system. If the system encountered errors saving your document, they will appear in the new window.
			<br />
			<br />
		</td>
	</tr>
</table>
<br />
<table id="Table1" width='100%' cellpadding='2' cellspacing='0' runat="server" >
	<tr><td class="SeparatorHdg">Download Template (if available)</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr id="trTemplate" runat="server"><td><Core:cLink id='ctlTemplateLink' runat='server' /></td></tr>
	<tr id="trNoTemplate" runat="server" visible="false"><td>No template available</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id="Table2" width='100%' cellpadding='2' cellspacing='0' runat="server" >
	<tr><td class="SeparatorHdg" colspan='2'>Upload Requirements</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td width="20%"><b>File Name</b></td><td id="tdUploadType" runat="server"></td></tr>
	<tr><td><b>File types allowed</b></td><td id="tdFileExt" runat="server"></td></tr>
	<tr><td><b>Maximum file size allowed</b></td><td id="tdMaxFileSize" runat="server"></td></tr>
	<tr><td><b>Maximum pages allowed</b></td><td id="tdMaxPages" runat="server"></td></tr>
	<tr><td><b>Maximum words allowed</b></td><td id="tdMaxWords" runat="server"></td></tr>
	<tr><td><b>Maximum characters allowed</b><br>(including spaces)</td><td id="tdMaxCharacters" runat="server"></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id="Table3"  width='100%' cellpadding='2' cellspacing='0' runat="server" >
	<tr><td class="SeparatorHdg" colspan='3'>Upload Document</td></tr>
	<tr visible='false' id='trNoFileMessage'>
		<td colspan='3'><br>
			<b><font color='red'><span runat='server' id="spnNoFileMessage" /></font></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan='3'>IMPORTANT: After you have uploaded the file, click the <b>File/Document Name</b> to verify that the system has accepted the document. If there were any errors, you will see a screen with those details. </td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='25%'>
			<asp:FileUpload id='upl' runat='server'/>
		</td>
		<td width='5%'>&nbsp;</td>
		<td align='left' width='70%' id='tdUpload'>
			<Core:cButton id='btnUpload' Caption='Upload' runat='server' />
			<asp:CustomValidator id='valUpload' runat='server'
				ErrorMessage=''
				Enabled='true'
				Display='none'/>
		</td>
	</tr>
</table>
<table cellpadding='0' cellspacing='0' border='0' runat='server'>
	<tr visible='False' runat='server' id='trDescription'>
		<td align='left' valign='top'>
			<b>Description&nbsp;&nbsp;&nbsp;<Core:cTextBox id='txtDescription' runat='server' Size='35' MaxLength='100' /></b>
		</td>
		<td valign='bottom' align='center'>
			&nbsp;<span runat='server' id='spnSave' />&nbsp;
		</td>
	</tr>
</table>
<table id="Table4" cellpadding='0' cellspacing='0' border='0' runat='server'>
	<tr visible='False' runat='server' id='trMessage'>
		<td colspan='4' id='tdMessage' runat='server'>
		</td>
	</tr>
</table>
<table id='tblUploadDetails' width="100%" cellpadding="2" cellspacing="0" runat="server">
<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
		<td align='Left' colspan='5' class='SeparatorHdg'>
			Upload Details
		</td>
	</tr>
	<tr>
		<td colspan='5'>&nbsp;</td>
	</tr>
	<tr>
		<td align='left' width='30%' valign='bottom'>
			<b>File/Document Name</b>
		</td>
		<td align='left' width='20%' valign='bottom'>
			<b>Uploaded By</b>
		</td>
		<td align='left' width='30%' valign='bottom'>
			<b>Uploaded Date</b>
		</td>
		<td align='center' valign='bottom' width='20%'>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan='4' id='tdLine1'>&nbsp;</td>
	</tr>
	<tr>
		<td runat='server' id='tdFileName'><span runat='server' id='spnView' /></td>
		<td runat='server' id='tdUploadedName'/>
		<td runat='server' id='tdSubmitDate'/>
		<td align='center'>
			<span runat='server' id='spnDelete' />
		</td>
	</tr>
	<tr>
		<td colspan='4' id='tdLine2'>&nbsp;</td>
	</tr>
</table>
<Core:cStaffUploadNew id='ctlStaffUpload' visible='true' runat='server' />
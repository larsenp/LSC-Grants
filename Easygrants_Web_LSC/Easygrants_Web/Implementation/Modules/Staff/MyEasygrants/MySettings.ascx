<%@ Control Language="vb" AutoEventWireup="true" Inherits="System.Web.UI.UserControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlSubmission' Src='Implementation/Modules/Staff/MyEasygrants/MyEasygrantsTab.ascx' runat='server'/>

<P>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>My Easygrants Settings</b></td>
	</tr>	
</table>
<P>
Configure your My Easygrants settings below.
<P>
<TABLE border=0 cellspacing=0 cellpadding=0 runat='server' width='50%'>
	<TR>
		<TD><B>My Easygrants Tab</B></TD>
		<TD><B>Show Tab</B></TD>
		<TD><B>Tab Order</B></TD>
	</TR>
	<TR>
		<TD>Personal Tasks</TD>
		<TD>
			<SELECT>
				<OPTION>Yes</OPTION>
				<OPTION>No</OPTION>
			</SELECT>
		</TD>
		<TD>
			<SELECT>
				<OPTION>1</OPTION>
				<OPTION>2</OPTION>
				<OPTION>3</OPTION>
				<OPTION>4</OPTION>
				<OPTION>5</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD>Workgroup Tasks</TD>
		<TD>
			<SELECT>
				<OPTION>Yes</OPTION>
				<OPTION>No</OPTION>
			</SELECT>
		</TD>
		<TD>
			<SELECT>
				<OPTION>1</OPTION>
				<OPTION>2</OPTION>
				<OPTION>3</OPTION>
				<OPTION>4</OPTION>
				<OPTION>5</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD>My Queries</TD>
		<TD>
			<SELECT>
				<OPTION>Yes</OPTION>
				<OPTION>No</OPTION>
			</SELECT>
		</TD>
		<TD>
			<SELECT>
				<OPTION>1</OPTION>
				<OPTION>2</OPTION>
				<OPTION>3</OPTION>
				<OPTION>4</OPTION>
				<OPTION>5</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD>My Contacts</TD>
		<TD>
			<SELECT>
				<OPTION>Yes</OPTION>
				<OPTION>No</OPTION>
			</SELECT>
		</TD>
		<TD>
			<SELECT>
				<OPTION>1</OPTION>
				<OPTION>2</OPTION>
				<OPTION>3</OPTION>
				<OPTION>4</OPTION>
				<OPTION>5</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD>My Easylists</TD>
		<TD>
			<SELECT>
				<OPTION>Yes</OPTION>
				<OPTION>No</OPTION>
			</SELECT>
		</TD>
		<TD>
			<SELECT>
				<OPTION>1</OPTION>
				<OPTION>2</OPTION>
				<OPTION>3</OPTION>
				<OPTION>4</OPTION>
				<OPTION>5</OPTION>
			</SELECT>
		</TD>
	</TR>
</TABLE>
<P>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Password Settings</b></td>
	</tr>	
</table>
<P>
Click below to change your password
<P>
<A href="">Change Password</A>

<!--IMG SRC="MyEasygrants/MyEasylists.gif" border=0 /-->
<!--<P>
<B>Action:</B> <span runat='server' id='spnAction' />&nbsp;&nbsp;<span runat='server' id='spnGo' />
<P>
<HR >-->
<P>
<span runat='server' id='spnMyContacts'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
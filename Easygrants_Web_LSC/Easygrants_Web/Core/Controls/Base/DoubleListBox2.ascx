<%@ Control Language="vb" AutoEventWireup="true" Codebehind="DoubleListBox2.ascx.vb" Inherits="Core_Web.Controls.Base.cDoubleListBox2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<asp:CustomValidator 
	id='valMaxSelected'
	runat='server'
	ErrorMessage='You have selected too many.'
	OnServerValidate='ValidateMaxSelected'
	Display='none'/>
<asp:CustomValidator 
	id='valMinSelected'
	runat='server'
	ErrorMessage='You have selected too few.'
	OnServerValidate='ValidateMinSelected'
	Display='none'/>

<script language="javascript">

/*=====================================================*/

	var	g<%=ControlAbbrevName%>DblListBox;
	
/*=====================================================*/
</script>

<table border='0' cellspacing='0' cellpadding='0'>
	<tr>
		<td>
			<b>Available</b>
		</td>
		<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
		<td>
			<b>Selected</b>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<asp:ListBox id='selLeft' runat='server' EnableViewState='true' SelectionMode='Multiple'>
				<asp:ListItem value="" text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</asp:ListBox>
		</td>
		<td>&nbsp;&nbsp;</td>		
		<td align="center" width='30%'>
			<a href='javascript:g<%=ControlAbbrevName%>DblListBox.MoveFromLeftToRight();' style="vertical-align:top" class="CSSButtonStyle" />Add ></a>
			<BR><BR>
			<a href='javascript:g<%=ControlAbbrevName%>DblListBox.MoveFromRightToLeft();' style="vertical-align:top" class="CSSButtonStyle" />< Remove</a>
			<span runat='server' id='spnMoveAll' >
				<br><br><br><br>
				<a href='javascript:g<%=ControlAbbrevName%>DblListBox.MoveAllFromLeftToRight();' style="vertical-align:top" class="CSSButtonStyle" />Add All >></a>
				<br><br>
				<a href='javascript:g<%=ControlAbbrevName%>DblListBox.MoveAllFromRightToLeft();' style="vertical-align:top" class="CSSButtonStyle" /><< Remove All</a>
			</span>
		</td>
		<td>&nbsp;&nbsp;</td>
		<td>
			<asp:ListBox id='selRight' runat='server' EnableViewState='true' SelectionMode='Multiple'>
				<asp:ListItem value="" text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>
			</asp:ListBox>
			<input type="hidden" id="hdnList" runat="server"/>
			<input type="hidden" id="hdnTextList" runat="server"/>			
		</td>
		<td>&nbsp;&nbsp;</td>
		<td width='15%'>
			<table id='tblSort' runat='server' visible='false'>
				<tr>
					<td>
					<a href='javascript:g<%=ControlAbbrevName%>DblListBox.MoveUp();' style="vertical-align:top" class="CSSButtonStyle" visible='false' >Up</a>				
					<br><br>
					<a href='javascript:g<%=ControlAbbrevName%>DblListBox.MoveDown();' style="vertical-align:top" class="CSSButtonStyle">Down</a>				
					</td>
				</tr>
			</table>
		</td>	
	</tr>
</table>
<script language="javascript">
//PopulateValueArrays();
g<%=ControlAbbrevName%>DblListBox = new cDblListBox("<%=CoreCtl_ClientID%>")
</script>

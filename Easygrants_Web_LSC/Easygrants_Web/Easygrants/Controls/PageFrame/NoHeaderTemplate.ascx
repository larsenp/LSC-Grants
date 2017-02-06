<%@ Control Language="vb" AutoEventWireup="true" Codebehind="NoHeaderTemplate.ascx.vb" Inherits="Easygrants_Web.Controls.PageFrame.cNoHeaderTemplateCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register tagprefix='Core' tagname='Navigation'	src='../../../Core/Controls/Base/Navigation.ascx' %>
<%@ register tagprefix='Core' tagname='HorizNavigation'	src='../../../Core/Controls/Base/HorizNavigation.ascx' %>

<div id='tdCompetitionStyle' runat='server'/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" runat='server'>
	<tr>
		<td colspan="2" class="CompetitionHdg" id="tdHeader"><span id='tdCompetitionHeader' runat='server'/></td>
	</tr>
	<tr>
		<td colspan="2">
			<table border='0' cellpadding='0' cellspacing='0' width='100%' bgcolor='#FFFFFF' runat='server'>				
				<tr id="rowHorizNavigation" visible='false' runat="server">
					<td bgcolor="white" width="10">&nbsp;</td>
					<td width="140" class="NavigationStd">&nbsp;</td>
					<td align="center">
						<%
							'easiest way to comment control w/out removing it
							'<Core:HorizNavigation id='ctlHorizNavigation' visible='false' runat='server'/>
						%>
					</td>
				</tr>
				<tr>
					<td bgcolor="white" width="5">&nbsp;</td>
					<td width="140" class="NavigationStd">&nbsp;</td>
					<td class="ModuleHdg" id="tdModuleHeader" align="center">
						<!--Module Header -->
					</td>
				</tr>
				<tr> 
					<td width="5" rowspan='3' class='NavigationSel'><img src='<%=WebAppl.Build_RootURL("Easygrants/Images/Transparent_Filler.gif")%>' width='5' border='0'></td> 
					<td width="140" valign="top" class="NavigationStd" rowspan='3'>
						<Core:Navigation id='ctlNavigation' runat='server'/>
					</td>
					<td width='100%' valign='top' runat='server' rowspan=2> <!-- Page Content -->
						<table border='0' cellpadding='0' cellspacing='0' width='100%' runat='server'>
							<tr>
								<td>&nbsp;&nbsp;</td>
								<td width='100%' id='tdPageContent' valign='top'>
										<!-- Page Content -->
								</td>
							</tr>
						</table>
					</td>
				</tr>					
				<tr>
					<td id="tdModuleFooter" align="center">
						<!--Module Footer -->
					</td>
				</tr>
				<tr> 
					<td id='tdCompetitionFooter' align='center'>
					</td>
				</tr>

			</table>
		</td>
	</tr>
</table>


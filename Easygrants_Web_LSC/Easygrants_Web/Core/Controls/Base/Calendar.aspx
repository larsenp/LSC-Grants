<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Calendar.aspx.vb" Inherits="Calendar"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <title>Calendar</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
  </head>
  <body MS_POSITIONING="GridLayout">

    <form id="Form1" method="post" runat="server">
		<span id='spnWinRedirect' visible='false' runat='server'>
			<SCRIPT language="javascript">
				window.opener.SetValue('<%=request.querystring("UniqueID")%>','<%=DateValue%>');
				window.close();
			</SCRIPT>
		</span>
		<asp:Calendar id="Calendar1"
			OnDayRender="Calendar1_DayRender"
            OnSelectionChanged="Date_Selected"
			SelectionMode="Day"
			Font-Name="Verdana" 
			Font-Size="12px"
			NextPrevFormat="ShortMonth"
			SelectWeekText="week"
			SelectMonthText="month"
			runat="server">

			<TodayDayStyle Font-Bold="True"/>
			<DayHeaderStyle Font-Bold="True"/>
			<OtherMonthDayStyle ForeColor="gray"/>
			<TitleStyle BackColor="#3366ff"
						ForeColor="white"
						Font-Bold="True"/>

			<SelectedDayStyle BackColor="#ffcc66"
								Font-Bold="True"/>
			<NextPrevStyle ForeColor="white"
							Font-Size="10px"/>
			<SelectorStyle BackColor="#99ccff" 
						ForeColor="navy"
						Font-Size="9px"/>
		</asp:Calendar>
    </form>

  </body>
</html>

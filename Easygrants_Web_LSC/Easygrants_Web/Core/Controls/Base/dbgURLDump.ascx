<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cdbgURLDumpCtl" Codebehind="dbgURLDump.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<span id='lblList' class='DebugText' runat='server' />
<br>
<Core:cUserCtlLoader CtlID='ctldbgWorksheet' 
	Src='Core/Controls/Base/dbgWorksheet.ascx'
	runat='server'/>

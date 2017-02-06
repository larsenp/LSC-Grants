<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ReportOutputLink.ascx.vb" Inherits="Core_Web.Controls.Base.cReportOutputLink" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Easygrants' tagname='cstaffReportOutput' src='staffReportOutput.ascx' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../../../Core/Controls/Base/CSSButton.ascx' %>

<br><br>
<Core:cButton id='ctlButton' Caption='View PDF' runat='server' CausesValidation="false" />
<br><br>
<Easygrants:cstaffReportOutput id='ctlStaffRptOut' visible='true' runat='server'/>
<Core:cNewWindowOpener runat='server' id='ctlShow'/>
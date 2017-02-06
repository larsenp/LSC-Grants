<%@ Control Language="vb" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Easygrants' tagname='Name' src='../../../../../Easygrants/Controls/PageSection/ReviewCommittee_Editor.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ReviewList' src='../../../../../Easygrants/Controls/PageSection/ReviewCommitteeEditor_List.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
To select a review committee, click on an Available committee name and then click on the Add button.
To select more than one review committee at a time, click on the <b>Ctrl</b> key 
and click on the multiple committees. To move a committee up or down in the selected list, 
use the appropriate Up or Down button.
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Add or Edit Review Committee Assignments</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>

</table>

<Easygrants:Name id='ctlName' runat='server'/>
<br>
<Easygrants:ReviewList id='ctlList' runat='server'/>





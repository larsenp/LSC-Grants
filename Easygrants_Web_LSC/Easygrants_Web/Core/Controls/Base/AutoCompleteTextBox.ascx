<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="AutoCompleteTextBox.ascx.vb" Inherits="Core_Web.Controls.Base.cAutoCompleteTextBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<script type="text/javascript">
	function UpdateHiddenObjects(source, eventArgs){
		document.getElementById("mPageFrameCtl_ctlPageContent_<%=ControlID%>_hdnObjID").value = eventArgs.get_value();
		document.getElementById("mPageFrameCtl_ctlPageContent_<%=ControlID%>_hdnObjText").value = eventArgs.get_text();
		return true;
	}
</script>
<asp:CustomValidator id='valSelection' runat='server'
	ErrorMessage='The selected value is not valid.'
	Enabled='false'
	Display='none'
	OnServerValidate='ValidateSelected'/>
<input type='hidden' id='hdnObjID' runat='server'  enableviewstate="true"/>
<input type='hidden' id='hdnObjText' runat='server'  enableviewstate="true"/>
<asp:TextBox runat="server" ID="txtAutoComplete" EnableViewState="true"/>
<ajaxToolkit:AutoCompleteExtender
    runat="server" 
    BehaviorID="AutoCompleteEx"
    ID="mAutoCompleteExtender" 
    TargetControlID="txtAutoComplete"
    ServicePath="../WebServices/AutoCompleteTextBox.asmx"
    ServiceMethod="GetCompletionList"
    CompletionInterval="1000"
    EnableCaching="true"
    CompletionListCssClass="autocomplete_completionListElement" 
    CompletionListItemCssClass="autocomplete_listItem" 
    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
    UseContextKey="True">
    <Animations>
        <OnShow>
            <Sequence>
                <OpacityAction Opacity="0" />
                <HideAction Visible="true" />
                <ScriptAction Script="
                    // Cache the size and setup the initial size
                    var behavior = $find('AutoCompleteEx');
                    if (!behavior._height) {
                        var target = behavior.get_completionList();
                        behavior._height = target.offsetHeight - 2;
                        target.style.height = '0px';
                    }" />
                <Parallel Duration=".4">
                    <FadeIn />
                    <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                </Parallel>
            </Sequence>
        </OnShow>
        <OnHide>
            <Parallel Duration=".4">
                <FadeOut />
                <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
            </Parallel>
        </OnHide>
	</Animations>
</ajaxToolkit:AutoCompleteExtender>

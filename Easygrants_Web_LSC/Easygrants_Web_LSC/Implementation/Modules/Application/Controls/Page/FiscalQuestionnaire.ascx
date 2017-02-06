<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style="width:600px" class="SeparatorHdg">
	Instructions
</div>
<p>TBD</p>

<div style="width:600px" class="SeparatorHdg">
	Part <span runat='server' id='spnRomanNumeral1'/>: <span runat='server' id='spnName1'/>
</div>
<Core:cUserCtlLoader CtlID='ctlP1Q1' 
	Src='Implementation/Modules/Application/Controls/PageSection/FiscalQuestionWithSubquestions.ascx'
	Properties='PartNum=1&QuestionNum=1'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlP1Q2' 
	Src='Implementation/Modules/Application/Controls/PageSection/FiscalQuestionWithSubquestions.ascx'
	Properties='PartNum=1&QuestionNum=2'
	runat='server'/>
<br />

<span runat='server' id='spnSave'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscCompFiscalPart1' DataObjectDefinitionKey='LscCompFiscalPart' Updatable='True'>
			<Filters>
				<Argument PropertyKey='SortOrder' Value="1"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RomanNumeral'>
					<Control ID='spnRomanNumeral1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Name'>
					<Control ID='spnName1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlP1Q1'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlP1Q2'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

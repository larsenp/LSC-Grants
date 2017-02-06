<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ActualCaseServ.Controls.PageSection.cActualCaseServGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<style>
<!--

	.DetailTB {
		text-align: right;
	}

	.DetailTD {
		text-align: right;
	}
	
	.DetailTotal {
		font-weight: bold;
		text-align: right;
		padding-right: 10px
	}

	.Subhead {
		font-weight: bold;
	}

	.Subtotal {
		font-weight: bold;
		text-align: right;
		padding-right: 10px;
	}
	
	.Subtotal td {
		border-bottom-width: 2px;
		border-bottom-color: #888888
	}

	.SubtotalRowHead {
		font-weight: bold;
	}

	.SubtotalRowTotal {
		font-weight: bold;
		text-align: right;
		padding-right: 10px
	}
	.Total {
		font-weight: bold;
		text-align: right;
		padding-right: 10px;
		border-bottom-width: 2px;
		border-bottom-color: #000000
	}

	.TotalRowHead {
		font-weight: bold;
	}

	.TotalRowTotal {
		font-weight: bold;
		text-align: right;
		padding-right: 10px
	}
-->
</style>

<!--The table row trHeader is copied by the code and placed in the page multiple times. This is why its visibility is initially set to false. -->
<table runat='server' id='tblGrid' cellpadding='5' cellspacing='0' >
	<tr id='trHeader' visible='false'> 
		<td class='MinorSeparatorHdg' width='20'>&nbsp;</td>
		<td class='MinorSeparatorHdg' width='140'>&nbsp;</td>
		<td class='MinorSeparatorHdg' valign='top' align='center'>
			A. Counsel and Advice
		</td>
		<td class='MinorSeparatorHdg' valign='top' align='center' >
			B. Limited Action
		</td>
		<td class='MinorSeparatorHdg' valign='top'  align='center'>
			F.<br>
		  Negot. Settlement w/o Litig.
		</td>
		<td class='MinorSeparatorHdg'  valign='top' align='center'>
			G.<br>
		  Negot. Settlement w/ Litig.
		</td>
		<td class='MinorSeparatorHdg'  valign='top' align='center'>
			H. Agency Decision
		</td>
		<td class='MinorSeparatorHdg'  valign='top' align='center'>
			I(a).<br>
		  Court Decision Uncontested
		</td>
		<td class='MinorSeparatorHdg'  valign='top' align='center'>
			I(b).<br>
		  Court Decision Contested
		</td>
		<td class='MinorSeparatorHdg'  valign='top' align='center'>
			I(c). Court Decision Appeals
		</td>
		<td class='MinorSeparatorHdg'  valign='top' align='center'>
			K. Other Closure Method
		</td>
		<td class='MinorSeparatorHdg'  valign='top' align='center'>
			L. Extensive Services
		</td>
		<td class='MinorSeparatorHdg'  valign='top' align='center'>
			Total Cases Closed
		</td>
	</tr>
</table>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='LscCaseCategory' DataObjectDefinitionKey='LscCaseCategory' Updatable='True' CreateNew='False'>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
		</DataObject>
		<!--The following DataObject element is used by the codebehind. It is ignored by the normal DataPresenter data selection functionality.-->
		<DataObject Key='LscCaseType' DataObjectDefinitionKey='LscCaseType' GetData='False'>
			<Filters>
				<Argument PropertyKey='LscCaseCategoryID' Value='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
		</DataObject>
		<!--The following element is used by the codebehind to set properties for each text box in the grid.-->
		<MoneyTextBoxConfiguration>
			<Property Key='DecimalErrorMessage' Value='Every entry in the grid must be a whole number.' />
			<Property Key='RegExErrorMessage' Value='Every entry in the grid must be a whole number.' />
			<Property Key='CommaErrorMessage' Value='Commas are not allowed in numeric values.' />
		</MoneyTextBoxConfiguration>
	</ModuleSection>
</span>
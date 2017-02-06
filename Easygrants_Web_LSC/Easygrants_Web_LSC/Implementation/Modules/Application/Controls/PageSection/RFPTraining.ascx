<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Training</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area Three, Criterion 1 - <i>Legal representation: </i></b> </td>
	</tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td>
		  		<p>Use the RFP Chart to indicate what proportion of the staff received each type of training in the last twenty-four months. Complete the form by making a choice from the drop down menu (“all (100%),” “many (50% or more),” “some (less than 50%),” or “none”).</p>  
			 	<p style="color:red">For those applying to multiple service areas: This RFP Chart is <em>not</em> linked across service areas. Applicants should enter information into this form that is specific to this service area.</p>
				<p>All fields are required fields. When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return.</p>
				<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>			</td>
		</td>
         <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
    </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td  colspan='11' class="SeparatorHdg" >Training Chart</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr style="background-color:#DDDDDD" >
        <td width='26%' align="center"><b>Type of Training</b></td>
        <td width='74%' align="center"><b>Position Category</b></td>
    </tr>
</table>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr >
        <td width='22%'><b></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'><b>Attorneys</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'><b>Paralegals</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'><b>Managers/Supervisors</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'><b>Adminstrators</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'><b>Support Staff</b></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
<!--</table>
<br />
<br />
<table width='100%'> -->
	<tr>
		<td width='22%'><b>1. Advocacy Skills <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'>
			<span runat='server' id='spnType1Attorneys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'>
			<span runat='server' id='spnType1Paralegals' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'>
			<span runat='server' id='spnType1Managers' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'>
			<span runat='server' id='spnType1Admins' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'>
			<span runat='server' id='spnType1Staff' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>2. Substantive Law <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType2Attorneys' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType2Paralegals' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType2Managers' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType2Admins' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType2Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>3. Technology <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType3Attorneys' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType3Paralegals' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType3Managers' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType3Admins' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType3Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>4. Management <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType4Attorneys' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType4Paralegals' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType4Managers' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType4Admins' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType4Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>5. Leadership <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType5Attorneys' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType5Paralegals' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType5Managers' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType5Admins' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType5Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>6. Cultural Competency <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType6Attorneys' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType6Paralegals' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType6Managers' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType6Admins' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType6Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>7. Foreign Language <%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType7Attorneys' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType7Paralegals' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType7Managers' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType7Admins' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType7Staff' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>8. Other (Specify)<%=kDenoteRequiredField%></b></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		
		
	</tr>
	<tr>
	    <td><span runat='server' id='spnOtherTxtbx' /></td>
	    <td>&nbsp;</td>
	    <td align='center'><span runat='server' id='spnType8Attorneys' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType8Paralegals' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType8Managers' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType8Admins' /></td>
		<td>&nbsp;</td>
		<td align='center'><span runat='server' id='spnType8Staff' /></td>
	</tr>
	
</table>
<br />
<br />
<br />
<br />
<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveCloseStd' />
			<span runat='server' id='spnSaveClosePPQV' />
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'> 
	<ModuleSection> 
	    <DataObject Key='LSCRFPTRAINING' DataObjectDefinitionKey='LSCRFPTRAINING' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
	        <DisplayProperties>
	            <DisplayProperty PropertyKey='Type1Attorneys'> 
					<Control ID='ctlType1Attorneys'
						Container='spnType1Attorneys'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type1Paralegals'> 
					<Control ID='ctlType1Paralegals'
						Container='spnType1Paralegals'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type1Managers'> 
					<Control ID='ctlType1Managers'
						Container='spnType1Managers'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type1Admins'> 
					<Control ID='ctlType1Admins'
						Container='spnType1Admins'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type1Staff'> 
					<Control ID='ctlType1Staff'
						Container='spnType1Staff'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    
			     <DisplayProperty PropertyKey='Type2Attorneys'> 
					<Control ID='ctlType2Attorneys'
						Container='spnType2Attorneys'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type2Paralegals'> 
					<Control ID='ctlType2Paralegals'
						Container='spnType2Paralegals'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type2Managers'> 
					<Control ID='ctlType2Managers'
						Container='spnType2Managers'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type2Admins'> 
					<Control ID='ctlType2Admins'
						Container='spnType2Admins'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type2Staff'> 
					<Control ID='ctlType2Staff'
						Container='spnType2Staff'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
	        
	            <DisplayProperty PropertyKey='Type3Attorneys'> 
					<Control ID='ctlType3Attorneys'
						Container='spnType3Attorneys'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type3Paralegals'> 
					<Control ID='ctlType3Paralegals'
						Container='spnType3Paralegals'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type3Managers'> 
					<Control ID='ctlType3Managers'
						Container='spnType3Managers'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type3Admins'> 
					<Control ID='ctlType3Admins'
						Container='spnType3Admins'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type3Staff'> 
					<Control ID='ctlType3Staff'
						Container='spnType3Staff'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    
			    <DisplayProperty PropertyKey='Type4Attorneys'> 
					<Control ID='ctlType4Attorneys'
						Container='spnType4Attorneys'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type4Paralegals'> 
					<Control ID='ctlType4Paralegals'
						Container='spnType4Paralegals'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type4Managers'> 
					<Control ID='ctlType4Managers'
						Container='spnType4Managers'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type4Admins'> 
					<Control ID='ctlType4Admins'
						Container='spnType4Admins'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type4Staff'> 
					<Control ID='ctlType4Staff'
						Container='spnType4Staff'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    
			      <DisplayProperty PropertyKey='Type5Attorneys'> 
					<Control ID='ctlType5Attorneys'
						Container='spnType5Attorneys'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type5Paralegals'> 
					<Control ID='ctlType5Paralegals'
						Container='spnType5Paralegals'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type5Managers'> 
					<Control ID='ctlType5Managers'
						Container='spnType5Managers'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type5Admins'> 
					<Control ID='ctlType5Admins'
						Container='spnType5Admins'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type5Staff'> 
					<Control ID='ctlType5Staff'
						Container='spnType5Staff'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    
			      <DisplayProperty PropertyKey='Type6Attorneys'> 
					<Control ID='ctlType6Attorneys'
						Container='spnType6Attorneys'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type6Paralegals'> 
					<Control ID='ctlType6Paralegals'
						Container='spnType6Paralegals'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type6Managers'> 
					<Control ID='ctlType6Managers'
						Container='spnType6Managers'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type6Admins'> 
					<Control ID='ctlType6Admins'
						Container='spnType6Admins'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type6Staff'> 
					<Control ID='ctlType6Staff'
						Container='spnType6Staff'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
	        
	            <DisplayProperty PropertyKey='Type7Attorneys'> 
					<Control ID='ctlType7Attorneys'
						Container='spnType7Attorneys'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type7Paralegals'> 
					<Control ID='ctlType7Paralegals'
						Container='spnType7Paralegals'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type7Managers'> 
					<Control ID='ctlType7Managers'
						Container='spnType7Managers'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type7Admins'> 
					<Control ID='ctlType7Admins'
						Container='spnType7Admins'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type7Staff'> 
					<Control ID='ctlType7Staff'
						Container='spnType7Staff'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    
	             <DisplayProperty PropertyKey='Type8Name'>
					<Control ID='ctlOtherTxtbx'
						Container='spnOtherTxtbx'
						Type='cTextBox'
						Size='30'/>
				 </DisplayProperty>
			     <DisplayProperty PropertyKey='Type8Attorneys'> 
					<Control ID='ctlType8Attorneys'
						Container='spnType8Attorneys'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type8Paralegals'> 
					<Control ID='ctlType8Paralegals'
						Container='spnType8Paralegals'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type8Managers'> 
					<Control ID='ctlType8Managers'
						Container='spnType8Managers'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type8Admins'> 
					<Control ID='ctlType8Admins'
						Container='spnType8Admins'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='Type8Staff'> 
					<Control ID='ctlType8Staff'
						Container='spnType8Staff'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCRFPTRAININGLKP'
						StoredValue='LscRFPTrainingLkpID'
						DisplayText='Select'
						DisplayValue='Description'> 
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
	        </DisplayProperties>
	     </DataObject>
	     
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
			 <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToCriterion'
						Type='cLabel'
						Container='spnReturnToCriterion'
						LabelText='Save and Return to Criterion Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToPA'
						Type='cLabel'
						Container='spnReturnToPA'
						LabelText='Save and Return to Performance Area Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveCloseStd'
						Type='cButton'
						Container='spnSaveCloseStd'
						Caption='Save and Return to Criterion Page'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="AppFormByCriterion"/>
								<Argument Type='QueryString' TypeKey='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClosePPQV'
						Type='cButton'
						Container='spnSaveClosePPQV'
						Caption='Save and Return to Performance Area Page'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="PostPQVPA3"/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>


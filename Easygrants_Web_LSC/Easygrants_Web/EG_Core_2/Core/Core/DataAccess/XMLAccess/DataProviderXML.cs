using System;
using System.Diagnostics;
using System.Data;
using System.Xml;
using Core.DataAccess.DBAccess;
using Core.DataAccess.XMLAccess;

namespace Core.DataAccess.XMLAccess {
/*====================================================*/

///<summary>
///references XML data definiation document
///</summary>
public class cDataProviderXML : cDataProvider 
{
/*====================================================*/

	private cXMLDoc			mDataDoc;
	
/*-----------------------------------------------------*/

	public cXMLDoc DataDoc {
		get {return mDataDoc;}
	}
	
/*-----------------------------------------------------*/

	public cDataProviderXML(cAppl aAppl, string aDataFile) :
			base(aAppl) {
		mDataDoc = new cXMLDoc(Appl.Build_RootFileSystemPath(aDataFile));
	}

/*====================================================*/

	public override void PopulateDataSet(cDataObjectList aObjList) {
		String	aXPathStr;
	
		aXPathStr = DataProviderXML_Generate_XPath(aObjList.ObjDefNode, aObjList.DataObjectNode);
		
		//Populate rows in DataTable
		XmlNodeList	aPropertiesNodeList = aObjList.ObjDefNode.SelectNodes("Properties/Property");
		XmlNodeList	aDataRowNL = DataDoc.DocElement.SelectNodes(aXPathStr);
		DataTable	aDataTable = aObjList.ObjDataSet.Tables[aObjList.DefinitionKey];
		
		foreach (XmlElement aDataRowEl in aDataRowNL) {
			DataRow		aDataRow = aDataTable.NewRow();
			
			foreach (XmlNode aPropertyNode in aPropertiesNodeList) {
				String		aColumnName = cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
				XmlElement	aColumnEl;
				
				if (aColumnName != "") {
					aColumnEl = (XmlElement)cXMLDoc.FindNode(aDataRowEl, "Column", "Name", aColumnName);
				
					//Debug.WriteLine("Value: " + aColumnEl.FirstChild.Value);
					aDataRow[aColumnName] = aColumnEl.FirstChild.Value;
				}
			} //foreach aPropertyNode
			
			aDataTable.Rows.Add(aDataRow);
		} //foreach aDataRowEl
	}

/*====================================================*/

	protected String DataProviderXML_Generate_XPath(XmlNode aObjDefNode, XmlNode aDataObjectNode) {
		XmlNodeList		aFiltersNodeList;
		String			aXPathStr;

		aXPathStr = "DataRows[@RowSource='" + cXMLDoc.AttributeToString(aObjDefNode, "RowSource") + "']/DataRow";
		//aXPathStr += "[Column[@Name='ProgramID']='1']";
		
		aFiltersNodeList = cXMLDoc.GetFilterArgumentList(aDataObjectNode);
		foreach (XmlNode aArgumentNode in aFiltersNodeList) {
			//currently supports only one filter...
			XmlNode aPropertyNode = cXMLDoc.FindNode(aObjDefNode, "Properties/Property", "Key",
										cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey"));

			aXPathStr += "[Column[@Name='";
			aXPathStr += cXMLDoc.AttributeToString(aPropertyNode, "ColumnSource");
			aXPathStr += "']='";
			aXPathStr += cXMLDoc.AttributeToString(aArgumentNode, "Value");
			aXPathStr += "']";
		}

		return aXPathStr;
	}
	
/*====================================================*/
} //class cDataProviderXML


/*====================================================*/
}  //namespace Core.DataAccess.XMLAccess

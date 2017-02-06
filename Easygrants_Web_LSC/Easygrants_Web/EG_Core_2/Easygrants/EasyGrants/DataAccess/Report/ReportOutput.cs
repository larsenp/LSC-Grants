using System;
using System.Xml;
using System.Data;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;

namespace EasyGrants.DataAccess.Report {
/*====================================================*/

///<summary>
///PDQ reports request system -generates new reports, checks for cashed reports, deletes reports
///</summary>
public class cReportOutput : cDataObject 
{
/*====================================================*/

	public String UniqueDescriptiveName {
		get {return this["ReportOutputID"] + "_" + this["EntityID"] + "_" + this["DefinitionID"];}
	}

/*----------------------------------------------------*/

	public cReportOutput(DataRow aDataObjectRow, cDataObjectList aDataObjectList)
		: base(aDataObjectRow, aDataObjectList) {
	}

/*=====================================================*/

	public static int Get_ReportOutputDefinitionID(cDataObjectFactory aDataObjectFactory, String aKey) {
		cXMLDoc			aXmlDoc;
		XmlNode			aDataObjectNode;
		XmlNode			aFiltersNode;
		XmlNode			aArgNode;
		cDataObject		aRODefDO;

		aXmlDoc = aDataObjectFactory.CreateDataObjectNode("ReportOutputDefinition", out aDataObjectNode, out aFiltersNode);	
		aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
											"Key", aKey));
	
		aRODefDO = aDataObjectFactory.GetDataObject(aDataObjectNode);
		return aRODefDO == null ? 0 : (int)aRODefDO["ReportOutputDefinitionID"];
	}
	
/*=====================================================*/

	public void SaveData(String aFileName, bool aDeleteFlag) {
		cDataObject		aReportOutputData;
		
		aReportOutputData = GetRelatedPropertyDataObject("ReportOutputData");
		if (aReportOutputData == null) {			
			aReportOutputData = DataObjectFactory.CreateNewDataObjectFromKey("ReportOutputData");
			aReportOutputData["ReportOutputID"] = this["ReportOutputID"];
		}
		
		aReportOutputData.WriteFileToBlob("FileData", aFileName, aDeleteFlag);
		DataObjectFactory.SaveDataObject(aReportOutputData);
	}

/*----------------------------------------------------*/

	public int Save_GenerationStatus(int aNewStatus) {
		int		aOldStatus = Convert.ToInt32(this["GenStatus"]);
		
		if (aOldStatus != aNewStatus) {
			this["GenStatus"] = aNewStatus;
			DataObjectFactory.SaveDataObject(this);
		}
		
		return aOldStatus;
	}

/*----------------------------------------------------*/

	public void ReportOutput_Delete() {
		int		aRptOutDataID;
		
		aRptOutDataID = GetRelatedPropertyInt("ReportOutputData.ReportOutputDataID");
		DataObjectFactory.DeleteData("ReportOutputData", aRptOutDataID.ToString());
		
		DataObjectFactory.DeleteData(this);
	}

/*=====================================================*/

	public static cReportOutput ReportOutput_Get(cDataObjectFactory aDataObjectFactory,
												int aEntityID, int aDefinitionID,
												bool aCreateFlag) {
		cXMLDoc			aXmlDoc;
		XmlNode			aDataObjectNode;
		XmlNode			aFiltersNode;
		XmlNode			aArgNode;
		cReportOutput	aReportOutput;

		aXmlDoc = aDataObjectFactory.CreateDataObjectNode("ReportOutput", out aDataObjectNode, out aFiltersNode);	
		aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "EntityID",
						aEntityID.ToString()));
		aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "DefinitionID",
						aDefinitionID.ToString()));
	
		aReportOutput = (cReportOutput)aDataObjectFactory.GetDataObject(aDataObjectNode);
		if (aReportOutput == null && aCreateFlag) 
			return ReportOutput_Create(aDataObjectFactory, aEntityID, aDefinitionID);
		
		return aReportOutput;
	}

/*----------------------------------------------------*/

	public static cReportOutput ReportOutput_Create(cDataObjectFactory aDataObjectFactory, 
											int aEntityID, int aDefinitionID) {
		cReportOutput		aReportOutput;
		
		aReportOutput = (cReportOutput)aDataObjectFactory.CreateNewDataObjectFromKey("ReportOutput");

		aReportOutput["EntityID"] = aEntityID;
		aReportOutput["DefinitionID"] = aDefinitionID;
		aReportOutput["GenRequestDate"] = DateTime.Now;
		aReportOutput["GenStatus"] = 0;
		aReportOutput["GenResult"] = "Report is in the queue to be generated.";
		aDataObjectFactory.SaveDataObject(aReportOutput);

		return aReportOutput;
	}

/*----------------------------------------------------*/

	public static cReportOutput ReportOutput_Get(cDataObjectFactory aDataObjectFactory,
												int aReportOutputID) {

		return (cReportOutput)aDataObjectFactory.GetDataObjectFromPrimaryKey("ReportOutput", aReportOutputID);
	}

/*----------------------------------------------------*/

	public static void ReportOutput_Delete(cDataObjectFactory aDataObjectFactory,
												int aEntityID, int aDefinitionID) {
		cXMLDoc			aXmlDoc;
		XmlNode			aDataObjectNode;
		XmlNode			aFiltersNode;
		XmlNode			aArgNode;
		cReportOutput	aReportOutput;

		aXmlDoc = aDataObjectFactory.CreateDataObjectNode("ReportOutput", out aDataObjectNode, out aFiltersNode);	
		aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "EntityID",
						aEntityID.ToString()));
		aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "DefinitionID",
						aDefinitionID.ToString()));
	
		aReportOutput = (cReportOutput)aDataObjectFactory.GetDataObject(aDataObjectNode);
		if (aReportOutput != null)
			aReportOutput.ReportOutput_Delete();
	}


/*=====================================================*/
} // class cReportOutput


/*====================================================*/
}  //namespace EasyGrants.DataAccess.Report
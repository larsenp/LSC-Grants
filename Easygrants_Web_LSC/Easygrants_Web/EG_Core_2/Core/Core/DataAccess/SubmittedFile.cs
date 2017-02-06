using System;
using System.Data;
using System.Collections;
using System.Xml;
using System.IO;
using Core.Util;
using Core.DataAccess.XMLAccess;
using Core.DataAccess;


namespace Core.DataAccess 
{
/*====================================================*/
///<summary>
///file upload utility - converts and uploads files
///</summary>
public class cSubmittedFile : cDataObject
{

/*-----------------------------------------------------*/

	public cSubmittedFile(DataRow aDataObjectRow, cDataObjectList aDataObjectList)
		: base(aDataObjectRow, aDataObjectList) 
	{
	}

/*====================================================*/

	public String UniqueDescriptiveName 
	{
		get {return this["EntityID"] + "_" + this["FileTypeID"];}
	}

/*----------------------------------------------------*/

	public String SourceExtension 
	{
		get {return cLib.ExtensionFromFileName((String)this["SourceFileName"], "doc").ToLower();}
	}

/*====================================================*/

	public int Save_ConversionStatus(int aNewStatus) 
	{
		//int		aOldStatus = Convert.ToInt32(this["ConversionStatus"]);
		int	aOldStatus = this.GetPropertyInt("ConversionStatus", System.Int32.MinValue);
	
		if (aOldStatus != aNewStatus) 
		{
			this["ConversionStatus"] = aNewStatus;
			DataObjectFactory.SaveDataObject(this);
		}
	
		return aOldStatus;
	}

/*====================================================*/
/*
	Deletes a this SubmittedFile and related data objects
*/
	public void SubmittedFile_Delete() {
		cDataObject		aDataObject;
		
		aDataObject = GetRelatedPropertyDataObject("SubmittedFileData");
		if (aDataObject != null)
			DataObjectFactory.DeleteData(aDataObject);
		aDataObject = GetRelatedPropertyDataObject("ConvertedFileData");
		if (aDataObject != null)
			DataObjectFactory.DeleteData(aDataObject);

		DataObjectFactory.DeleteData(this);
	}
			
/*====================================================*/
} //class cSubmittedFile


/*====================================================*/
}  //namespace Core.DataAccess(
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
    ///file import utility - uploads and imports files
    ///</summary>
    public class cImportedFile : cDataObject
    {

        /*-----------------------------------------------------*/

        public cImportedFile(DataRow aDataObjectRow, cDataObjectList aDataObjectList)
            : base(aDataObjectRow, aDataObjectList)
        {
        }

        /*====================================================*/

        public String UniqueDescriptiveName
        {
            get { return this["ImportedFileID"] + "_" + this["ImportTypeID"]; }
        }

        /*----------------------------------------------------*/

        public String SourceExtension
        {
            get { return cLib.ExtensionFromFileName((String)this["SourceFileName"], "xls").ToLower(); }
        }

        /*====================================================*/

        public int Save_ConversionStatus(int aNewStatus)
        {
            int aOldStatus = Convert.ToInt32(this["ImportStatusID"]);

            if (aOldStatus != aNewStatus)
            {
                this["ImportStatusID"] = aNewStatus;
                DataObjectFactory.SaveDataObject(this);
            }

            return aOldStatus;
        }

        /*====================================================*/
        /*
            Deletes a this ImportedFile and related data objects
        */
        public void ImportedFile_Delete()
        {
            cDataObject aDataObject;

            aDataObject = GetRelatedPropertyDataObject("ImportedFileData");
            if (aDataObject != null)
                DataObjectFactory.DeleteData(aDataObject);
            //		aDataObject = GetRelatedPropertyDataObject("ConvertedFileData");
            //		if (aDataObject != null)
            //			DataObjectFactory.DeleteData(aDataObject);

            DataObjectFactory.DeleteData(this);
        }

        /*====================================================*/
    } //class cImportedFile
}

/*====================================================*/

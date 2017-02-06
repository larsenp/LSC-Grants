using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Xml;
using Core.DataAccess.XMLAccess;
using Core.DataAccess;
using System.Web.Mail;
using System.Text;


namespace Core.Event {
/*====================================================*/

///<summary>
///Event object data wrapper
///</summary>
public class cEventData:cDataObject
{
/*====================================================*/

	public cEventData(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
				base(aDataObjectRow, aDataObjectList) {
	
	}
	
/*====================================================*/
}//cEventData
}// Core.Event
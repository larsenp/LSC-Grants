using System;
using System.Xml;
using System.Web;
using Core.Web;
using Core.DataAccess.DBAccess;
using Core.DataAccess.XMLAccess;
using EasyGrants.DataAccess.Report;

namespace EasyGrants.Web {
/*====================================================*/

///<summary>
///subclass of cWebAppl, provides methods for building report output window URL
///</summary>
public class cEGAppl : cWebAppl 
{
/*====================================================*/

	private const String	kReportOutputReaderURL = "EasyGrants/Controls/Base/pgReportOutputReader.aspx";

/*====================================================*/

	public cEGAppl(HttpApplication aHttpApp, String aConfigFileName) :
		base(aHttpApp, aConfigFileName) {
	}

/*=====================================================*/

	public String Build_ReportOutput_EntityID_URL(string aEntityID, string aDefinitionID) {
		String		aURL;

		aURL = Get_ControlSrc("cpgReportOutputReader");
		if(aURL == "")
			aURL = Build_RootURL(kReportOutputReaderURL);
	
		aURL = cWebLib.AddQuerystringParameter(aURL, "EntityID", aEntityID.ToString());
		aURL = cWebLib.AddQuerystringParameter(aURL, "DefinitionID", aDefinitionID.ToString());
		return aURL;
	}
	
/*----------------------------------------------------*/
	public String Build_ReportOutput_EntityID_URL(string aEntityID, string aDefinitionID, String aValidate)
	{
		String aURL;

		aURL = Get_ControlSrc("cpgReportOutputReader");
		if (aURL == "")
			aURL = Build_RootURL(kReportOutputReaderURL);

		aURL = cWebLib.AddQuerystringParameter(aURL, "EntityID", aEntityID.ToString());
		aURL = cWebLib.AddQuerystringParameter(aURL, "DefinitionID", aDefinitionID.ToString());
		aURL = cWebLib.AddQuerystringParameter(aURL, "Validate", aValidate);
		return aURL;
	}

	/*----------------------------------------------------*/

	public String Build_ReportOutput_ReportOutputID_URL(string aReportOutputID)
	{
		String		aURL;
		
		aURL = Get_ControlSrc("cpgReportOutputReader");
		if(aURL == "")
			aURL = Build_RootURL(kReportOutputReaderURL);
	
		aURL = cWebLib.AddQuerystringParameter(aURL, "ReportOutputID", aReportOutputID.ToString());
		return aURL;
	}
	
/*----------------------------------------------------*/

	public String Build_ReportOutput_ReportOutputID_URL(cReportOutput aReportOutput) {
		return Build_ReportOutput_ReportOutputID_URL(aReportOutput.GetPropertyString("ReportOutputID"));
	}

} // class cEGAppl

}  //namespace EasyGrants.Web
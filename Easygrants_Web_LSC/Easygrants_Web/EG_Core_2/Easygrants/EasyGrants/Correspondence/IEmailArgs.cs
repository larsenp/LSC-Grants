using System;
using Core.DataAccess;
using System.Collections;

namespace EasyGrants.Correspondence
{
	/// <summary>
	/// sets email data args
	/// </summary>
	public interface IEmailArgs {
/*====================================================*/

	cDataObjectList BaseDataObjList {get; set;}
	String NamePropertyKey {get; set;}
	String EmailPropertyKey {get; set;}
	String RcptPersonIDPropertyKey {get; set;}
	
	String GetDisplayNameEmailList();
	String GetToEmailList();
	String GetSendEmailList();
	ArrayList GetDisplayNameList();

/*====================================================*/
} //IEmailArgs

}// EasyGrants.Correspondence

using System;
using System.Web;
using System.Xml;
using Core.DataAccess.XMLAccess;
using Core.Web.Modules;
using EasyGrants.Web.User;
using EasyGrants.Web;


namespace EasyGrants.Web.Modules {
/*====================================================*/

///<summary>
///provides EG accessors to cModulePage methods, user validation
///</summary>
public class cPublicModulePage : cModulePage 
{
/*====================================================*/

	public cEGSession EGSession {
		get {return (cEGSession)WebSession;}
	}
	
/*====================================================*/

	protected void Validate_User_For_PublicModule() {
	
		if (ModuleUser == null) {
			cEGUser aUser;
			
			XmlNode aClassNode = cXMLDoc.FindNode(ModuleNode, "Class", "Name", UserClassName);
		
			aUser =EGSession.EGUser_From_ClassNode(aClassNode);

			WebSession.Add_User(aClassNode, aUser);
		}
	}

/*====================================================*/

	public override void CorePage_Load(Object aSrc, EventArgs aEvent){
		Validate_User_For_PublicModule();
		
		base.CorePage_Load(aSrc, aEvent);
	}

/*====================================================*/
} //cPublicModulePage

}//EasyGrants.Web.Modules


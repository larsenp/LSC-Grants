using Core.Web;

namespace EasyGrants.Web {
/*====================================================*/

///<summary>
///subclass of cCoreCtl, provides EG accessors to CoreCtl methods
///</summary>
public class cEGCtl : cCoreCtl 
{
/*====================================================*/

	public cEGPage EGPage {
		get {return (cEGPage)Page;}
	}

/*----------------------------------------------------*/

	public cEGAppl EGAppl {
		get {return (cEGAppl)WebAppl;}
	}

/*----------------------------------------------------*/

	public cEGSession EGSession {
		get {return (cEGSession)WebSession;}
	}

/*====================================================*/
} //public class cEGCtl


}  //namespace EasyGrants.Web
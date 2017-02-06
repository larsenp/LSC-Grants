using Core.Web;

namespace Core.Web.Modules {
/*====================================================*/

///<summary>
///Core Web Module object provides access to module page object
///</summary>
public class cModuleCtl : cCoreCtl 
{
/*====================================================*/

/*-----------------------------------------------------*/

	public cModulePage ModulePage {
		get {return (cModulePage)CorePage;}
	}
	
/*====================================================*/
} //public class cModuleCtl


}  //namespace Core.Web.Modules
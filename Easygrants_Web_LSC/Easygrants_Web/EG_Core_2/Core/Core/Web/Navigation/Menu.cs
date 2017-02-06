using System;
using System.Data;
using System.Collections;
using Core.Web;
using System.Web.UI;
using Core.Web.Navigation;


namespace Core.Web.Navigation
{
///<summary>
///drop down navigation menu
///</summary>	
public class cMenu : cJSWriter 
{
/*====================================================*/

	private cNavElement		mBaseNavElement;
	
/*-----------------------------------------------------*/

	public cNavElement BaseNavElement {
		get {return mBaseNavElement;}
		set {mBaseNavElement = value;}
	}

/*====================================================*/
/*
	main method to provide this instance JS content
*/
	public override void Render_Content(HtmlTextWriter aTxTWr) {
		String strLastKey = "";
		//write header
		aTxTWr.Write("<!--\r\n");
		aTxTWr.Write("function mmLoadMenus() {\r\n");
		//aTxTWr.Write("if (window.AccTech) return;\r\n");
		
		//iterate through the navigation object to build menus
		
		foreach (cNavElement aNavElement in BaseNavElement.Elements) {
			if (aNavElement.HasChildElements) {
				//build menu:
				aTxTWr.Write("window." + aNavElement.Key + " = new Menu('root',75,18,'Arial, Verdana, sans-serif',12,'#000000','#ffffff','#eeeeee','#333399','left','middle',3,0,501,0,7,true,true,true,3,true,true);\r\n");
				foreach (cNavElement aNavElementOption in aNavElement.Elements) {
					//add menu items
					aTxTWr.Write(aNavElement.Key + ".addMenuItem('" + aNavElementOption.NavTitle + "',\"document.location='" + aNavElementOption.SourceFile + "'\");\r\n");  
				}
				aTxTWr.Write(aNavElement.Key + ".hideOnMouseOut=true;\r\n");	
				aTxTWr.Write(aNavElement.Key + ".menuBorder=1;\r\n");	
				aTxTWr.Write(aNavElement.Key + ".menuLiteBgColor='#eeeeee';\r\n");	
				aTxTWr.Write(aNavElement.Key + ".menuBorderBgColor='#333399';\r\n");	
				aTxTWr.Write(aNavElement.Key + ".bgColor='#eeeeee';\r\n");
				
				strLastKey = aNavElement.Key;
			}	
		}	
			aTxTWr.Write(strLastKey + ".writeMenus();\r\n");
							
		//write footer
		aTxTWr.Write("} // mmLoadMenus()\r\n");
		//aTxTWr.Write("mmLoadMenus();\r\n");
		aTxTWr.Write("//-->\r\n");		
		
	}
	
/*====================================================*/
} //class cMenu

} //namespace Menu

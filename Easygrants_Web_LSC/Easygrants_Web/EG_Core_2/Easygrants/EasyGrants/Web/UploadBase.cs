using Core.Web;
using Core.DataAccess;
using System;
using System.Web.UI;	
using System.Xml;

namespace EasyGrants.Web
{
 public	class cUploadBase: cCoreCtl
	{
		private String mFileTypeControlID = "" ;
		private cUploadValidator mUploadValidator;
	
		public String FileTypeControlID{
			get { return mFileTypeControlID; }
			set {mFileTypeControlID = value;}
		}		

		public cUploadValidator UploadValidator {
			get { return mUploadValidator; }
			set { mUploadValidator = value; }
		}			
		
		public override void CoreCtl_Configure(XmlNode aDisplayControlNode  , cDataObjectList aDataObjectList ){
			base.CoreCtl_Configure(aDisplayControlNode, aDataObjectList);
			if (UploadValidator == null)
				UploadValidator = new cUploadValidator(WebSession, FileTypeControlID);
			AddValidators();	
		}	
		
		public void AddValidators(){
			mUploadValidator.InitializeControls();
			foreach (Control aCtl in mUploadValidator.ValidatorColl)
			{
				this.Controls.Add(aCtl);
			}		
		}
		

		
		
	}
}

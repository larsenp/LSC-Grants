using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Core.Web;

namespace EasyGrants.Web
{
	public class cUploadValidator
	{
		private String mFileTypeControlID = "";
		private ArrayList mValidatorColl;
		private cWebSession mWebSession;

		public String FileTypeControlID {
			get { return mFileTypeControlID; }
			set { mFileTypeControlID = value; }
		}

		public cWebSession WebSession{
			get { return mWebSession; }
			set { mWebSession = value; }
		}


		public ArrayList ValidatorColl {
			get { return mValidatorColl; }
			set { mValidatorColl = value; }
		}

		public cUploadValidator(cWebSession aWebSession, string aFileTypeControlID){
			mValidatorColl = new ArrayList();
			FileTypeControlID = aFileTypeControlID;
			WebSession = aWebSession;			
		}

		public virtual void Add(object aValidator){
			ValidatorColl.Add(aValidator);
		}

		public virtual void Remove(object aValidator){
			ValidatorColl.Remove(aValidator);
		}

		public virtual void InitializeControls(){
			
		}
		
		
	}
}

using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Core.Web;
using System.Web.UI;

namespace EasyGrants.Web
{
	public class cSpUploadValidator : cUploadValidator
	{
		public cSpUploadValidator(cWebSession aWebSession, string aFileTypeControlID)	:
						base(aWebSession,aFileTypeControlID)
		{
		
		}

		public override void InitializeControls(){
			base.InitializeControls();
			base.Add(InvalidFileName());
		}
 
		
		public CustomValidator InvalidFileName() {
			if ( FileTypeControlID != "") {
				String aInvalidFileNameCharacters = WebSession.WebAppl.EGSettingsCollection("SPInvalidFileNameCharacters"); 
				CustomValidator aCustomValidator = new CustomValidator();
				aCustomValidator.ControlToValidate = FileTypeControlID;
				aCustomValidator.ErrorMessage = "File name does not allow characters " + aInvalidFileNameCharacters;
				aCustomValidator.ServerValidate += new ServerValidateEventHandler(ValidateFileName);
				aCustomValidator.Enabled = true;
				aCustomValidator.Display = ValidatorDisplay.None;	
				return aCustomValidator;		
			}
			return null;
		}

		public void ValidateFileName(Object aSrc, ServerValidateEventArgs aArgs) {
			String aInvalidFileNameRegex = WebSession.WebAppl.EGSettingsCollection("SPInvalidFileNameCharactersRegex"); 
			Regex aRegex = new Regex(aInvalidFileNameRegex);
			if (aRegex.IsMatch(aArgs.Value))
				aArgs.IsValid = false;
			else
				aArgs.IsValid = true;
		}
	}
}

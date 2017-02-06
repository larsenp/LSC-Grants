using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Xml;
using System.Web.Mail;
using System.Text;
using Core;
using Core.Util;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using Core.Web;
using System.Text.RegularExpressions;
using EasyGrants.Correspondence;

namespace EasyGrants.Correspondence {
	/*====================================================*/

	///<summary>
	///email correspondence object
	///</summary>
	public class cCorrespondenceJob : cCorrespondenceJobBase {
		/*====================================================*/

		public cCorrespondenceJob(int aUserID)
			: base(aUserID) {

		}

		/*-----------------------------------------------------*/

		protected override XmlNode Get_MailParamNode(cAppl aAppl) {
			XmlNode aEMailParamNode;
			aEMailParamNode = cXMLDoc.FindNodeWithChildNode(((cWebAppl) aAppl).Get_ApplNode(),
											"EMailParams/EMailParam",
											"ReleaseBuild", "BuildKey", aAppl.BuildKey);
			return aEMailParamNode;
		}

		/*-----------------------------------------------------*/

		protected override XmlNode Get_DataObjectEmailPropertiesNode(cDataObject aDataObject) {
			XmlNode aDataObjectEmailPropertiesNode;
			aDataObjectEmailPropertiesNode = cXMLDoc.FindNode(((cWebAppl) aDataObject.DataObjectFactory.Appl).Get_ApplNode(),
				"EMailParams/DataObjectEmailProperties",
				"Key", aDataObject.DefinitionKey);
			return aDataObjectEmailPropertiesNode;
		}

		/*-----------------------------------------------------*/

		protected override string Get_ToAddress(cAppl aAppl) {
			XmlNode aEMailParamNode;
			aEMailParamNode = Get_MailParamNode(aAppl);
			if (aEMailParamNode != null) {
				return cXMLDoc.AttributeToString(aEMailParamNode, "ToAddress", "");
			}
			return "";
		}

		/*-----------------------------------------------------*/

		protected override string Get_SMTPHost(cAppl aAppl) {
			XmlNode aEMailParamNode;
			aEMailParamNode = Get_MailParamNode(aAppl);
			if (aEMailParamNode != null) {
				return cXMLDoc.AttributeToString(aEMailParamNode, "SMTPHost", "");
			}
			return "";
		}
		/*-----------------------------------------------------*/

		public override void SetMailMessageParams(cAppl aAppl) {
			//XmlNode		aEMailParamNode;
			String aEMailParamToAddress;

			mMailMessage = new MailMessage();
			mMailMessage.From = mFrom;
			if (mFromName != "") {
				mMailMessage.Headers.Add("From", string.Format("{0} <{1}>", mFromName, mFrom));
			}

			//email sent from development, testin or demo servers
			aEMailParamToAddress = Get_ToAddress(aAppl);

			if (aAppl.EmailSwitchEnabled == true) {
				if (mIsHtml) {
					mMailMessage.Body = "To: " + mTo + "<br>" + "Cc: " + mCc + "<br>" +
						"Bcc: " + mBcc + "<br>" + "<br>" + mBodyText;
					mMailMessage.BodyFormat = MailFormat.Html;
				} else {
					mMailMessage.Body = "To: " + mTo + "\n" + "Cc: " + mCc + "\n" +
						"Bcc: " + mBcc + "\n" + "\n" + mBodyText;
					mMailMessage.BodyFormat = MailFormat.Text;
				}

				if (aEMailParamToAddress != "") {
					mMailMessage.To = aEMailParamToAddress;
				}
			} else {
				mMailMessage.To = mTo;
				mMailMessage.Cc = mCc;
				mMailMessage.Bcc = mBcc;
				mMailMessage.Body = mBodyText;
				if (mIsHtml)
					mMailMessage.BodyFormat = MailFormat.Html;
				else
					mMailMessage.BodyFormat = MailFormat.Text;
			}
			if (aAppl.BuildKey != "Release") {
				if (mIsHtml) {
					mMailMessage.Body = "Server: " + Server.MachineName + "<br>" + "Build: " + aAppl.BuildKey + "<br>" + mMailMessage.Body;
				} else {
					mMailMessage.Body = "Server: " + Server.MachineName + "\n" + "Build: " + aAppl.BuildKey + "\n" + mMailMessage.Body;
				}
			}

			mMailMessage.Subject = mSubject;
		}

		/*-----------------------------------------------------*/


		/*=====================================================*/
	} // class cCorrespondenceJob


	/*====================================================*/
}  //namespace EasyGrants.Correspondence
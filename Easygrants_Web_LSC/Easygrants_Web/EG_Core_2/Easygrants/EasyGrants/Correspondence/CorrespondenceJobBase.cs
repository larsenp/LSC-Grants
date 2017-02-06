using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Xml;
using System.Web.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Core;
using Core.Util;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using Core.Web;


namespace EasyGrants.Correspondence {
	/*====================================================*/

	///<summary>
	///email correspondence object
	///</summary>
	public class cCorrespondenceJobBase : cCorePage {
		/*====================================================*/

		protected cDataObject mCorrespondenceDefinition;
		protected MailMessage mMailMessage;
		protected IEmailArgs mEmailArgs;
		protected String mBodyText;
		protected String mSubject;
		protected String mTo;
		protected String mCc;
		protected String mBcc;
		protected String mFrom;
		protected String mFromName = "";
		protected bool mIsHtml;	//1 is HTML, 0 is Text
		protected bool mIsLog;	//true - store email history in EMAIL_LOG table, false - do not store
		protected int mUserID;
		protected int mRcptPersonID;
		private String mEmailPropertyKey = "";

		/*-----------------------------------------------------*/

		public cCorrespondenceJobBase(int aUserID) {
			mUserID = aUserID;
		}

		/*-----------------------------------------------------*/

		public cDataObject CorrespondenceDefinition {
			get { return mCorrespondenceDefinition; }
			set { mCorrespondenceDefinition = value; }
		}

		/*-----------------------------------------------------*/

		public IEmailArgs EmailArgs {
			get { return mEmailArgs; }
			set { mEmailArgs = value; }
		}

		/*-----------------------------------------------------*/

		public String BodyText {
			get { return mBodyText; }
			set { mBodyText = value; }
		}

		/*-----------------------------------------------------*/

		public String Subject {
			get { return mSubject; }
			set { mSubject = value; }
		}

		/*-----------------------------------------------------*/

		public String To {
			get { return mTo; }
			set { mTo = value; }
		}

		/*-----------------------------------------------------*/

		public String Cc {
			get { return mCc; }
			set { mCc = value; }
		}

		/*-----------------------------------------------------*/

		public String Bcc {
			get { return mBcc; }
			set { mBcc = value; }
		}

		/*-----------------------------------------------------*/

		public String From {
			get { return mFrom; }
			set { mFrom = value; }
		}

		/*-----------------------------------------------------*/

		public String FromName {
			get { return mFromName; }
			set { mFromName = value; }
		}

		/*-----------------------------------------------------*/

		public bool IsHtml {
			get { return mIsHtml; }
			set { mIsHtml = value; }
		}

		/*====================================================*/

		protected virtual XmlNode Get_MailParamNode(cAppl aAppl) {
			return null;
		}

		/*-----------------------------------------------------*/

		protected virtual XmlNode Get_DataObjectEmailPropertiesNode(cDataObject aDataObject) {
			return null;
		}

		/*-----------------------------------------------------*/

		protected virtual string Get_ToAddress(cAppl aAppl) {
			return "";
		}

		/*-----------------------------------------------------*/

		protected virtual string Get_SMTPHost(cAppl aAppl) {
			return "";
		}

		/*====================================================*/

		public int GetPosition(String BodyText, String FieldCode) {
			int position = BodyText.IndexOf(FieldCode);
			return position;
		}

		/*-----------------------------------------------------*/

		protected string GetOpenTag(cAppl aAppl) {
			String strTag = "<";
			XmlNode aEmailMergeNode;
			aEmailMergeNode = cXMLDoc.FindNode(((cWebAppl) aAppl).Get_ApplNode(),
											"EMailParams/EmailMerge", "Key", "Tags");
			if (aEmailMergeNode != null) {
				strTag = cXMLDoc.AttributeToString(aEmailMergeNode, "OpenTag", "<");
			}
			if (mIsHtml) {
				strTag = strTag + "eg";
			}
			return strTag;
		}

		/*-----------------------------------------------------*/

		protected string GetCloseTag(cAppl aAppl) {
			String strTag = ">";
			XmlNode aEmailMergeNode;
			aEmailMergeNode = cXMLDoc.FindNode(((cWebAppl) aAppl).Get_ApplNode(),
											"EMailParams/EmailMerge", "Key", "Tags");
			if (aEmailMergeNode != null) {
				strTag = cXMLDoc.AttributeToString(aEmailMergeNode, "CloseTag", ">");
			}
			if (mIsHtml) {
				strTag = "/" + strTag;
			}
			return strTag;
		}

		/*-----------------------------------------------------*/

		//new Dimo 11/4/2004 for configurable tags
		public String ReplaceFieldCodes_With_Values(String aSourceTextStr, cDataObject aDataObject) {
			int aFirstPosition;
			int aLastPosition;
			int aLength;
			String aValue;

			//loop through document for ALL field codes
			String aOpenTag = GetOpenTag(aDataObject.DataObjectFactory.Appl);
			String aCloseTag = GetCloseTag(aDataObject.DataObjectFactory.Appl);
			while ((aFirstPosition = cLib.GetCharPostition(aSourceTextStr, aOpenTag)) >= 0) {
				aLastPosition = cLib.GetCharPostition(aSourceTextStr, aCloseTag);
				aLength = (aLastPosition - aFirstPosition) + aCloseTag.Length;

				//error handling for user-generated errors (if staff member incorrectly identifies a tag example: Person.LastNmae )
				try {
					aValue = aDataObject.GetRelatedPropertyString(aSourceTextStr.Substring(aFirstPosition + aOpenTag.Length, aLength - (aOpenTag.Length + aCloseTag.Length)));
				} catch {
					aValue = "--error--";
				}

				aSourceTextStr = aSourceTextStr.Replace(aSourceTextStr.Substring(aFirstPosition, aLength), aValue);
			}

			return aSourceTextStr;
		}

		/*-----------------------------------------------------*/

		public String ReplaceFieldCodes_With_Values(String aSourceTextStr, cDataObject aDataObject, String aOpenTag, String aCloseTag) {
			int aFirstPosition;
			int aLastPosition;
			int aLength;
			int aFormatFirstPosition;
			int aFormatLastPosition;
			String aValue;
			String aPropertyDesignator; //property key plus format string
			String aPropertyKey;
			String aFormat;

			//loop through document for ALL field codes		
			while ((aFirstPosition = cLib.GetCharPostition(aSourceTextStr, aOpenTag)) >= 0) {
				aLastPosition = cLib.GetCharPostition(aSourceTextStr, aCloseTag);
				aLastPosition = aSourceTextStr.IndexOf(aCloseTag, aFirstPosition);
				aLength = (aLastPosition - aFirstPosition);
				aPropertyDesignator = aSourceTextStr.Substring(aFirstPosition + aOpenTag.Length, aLength - aOpenTag.Length);

				//get format string if there is one
				aFormatFirstPosition = cLib.GetCharPostition(aPropertyDesignator, "{");
				if (aFormatFirstPosition > 0) {
					aFormatLastPosition = cLib.GetCharPostition(aPropertyDesignator, "}");
					aPropertyKey = aPropertyDesignator.Substring(0, aFormatFirstPosition);
					aPropertyKey = aPropertyKey.Trim(' ');
					aFormat = aPropertyDesignator.Substring(aFormatFirstPosition + 1, aFormatLastPosition - aFormatFirstPosition - 1);
				} else {
					aPropertyKey = aPropertyDesignator;
					aFormat = "";
				}

				//error handling for user-generated errors (if staff member incorrectly identifies a tag example: Person.LastNmae )
				try {
					//aKey = aSourceTextStr.Substring(aFirstPosition+aOpenTag.Length, aLength-aOpenTag.Length);
					//aValue = aDataObject.GetRelatedPropertyString(aKey);
					aValue = aDataObject.GetRelatedPropertyFormattedString(aPropertyKey, aFormat);
				} catch {
					aValue = "--error--";
				}
				aSourceTextStr = aSourceTextStr.Replace(aSourceTextStr.Substring(aFirstPosition, aLength + aCloseTag.Length), aValue);
			}

			return aSourceTextStr;
		}

		/*-----------------------------------------------------*/

		public void SetEmailParams(cDataObject aDataObject) {
			//Parse the field codes from the bodytext

			mIsHtml = CorrespondenceDefinition.GetPropertyBool("IsHtml");
			mTo = ReplaceFieldCodes_With_Values(CorrespondenceDefinition.GetPropertyString("CorrespondenceTo"), aDataObject);
			mFrom = ReplaceFieldCodes_With_Values(CorrespondenceDefinition.GetPropertyString("CorrespondenceFrom"), aDataObject);
			if (CorrespondenceDefinition.HasProperty("CorrespondenceFromName")) {
				mFromName = ReplaceFieldCodes_With_Values(CorrespondenceDefinition.GetPropertyString("CorrespondenceFromName"), aDataObject);
			}

			if (mTo == "") {
				XmlNode aAttributeNode;
				XmlNode aDataObjectEmailPropertiesNode;
				aDataObjectEmailPropertiesNode = Get_DataObjectEmailPropertiesNode(aDataObject);

				if (aDataObjectEmailPropertiesNode != null) {
					aAttributeNode = aDataObjectEmailPropertiesNode.SelectSingleNode("EMail");
					mEmailPropertyKey = cXMLDoc.AttributeToString(aAttributeNode, "Property", "");
					mTo = aDataObject.GetRelatedPropertyString(mEmailPropertyKey);
				} else {
					switch (aDataObject.DefinitionKey) {
						case "WfTaskAssignment":
							mTo = aDataObject.GetRelatedPropertyString("Person.PersonPrimaryEMail.ContactValue1");
							break;
						case "Person":
							mTo = aDataObject.GetRelatedPropertyString("PersonPrimaryEMail.ContactValue1");
							break;
						case "GranteeProject":
							mTo = aDataObject.GetRelatedPropertyString("PrimaryPerson.PersonPrimaryEMail.ContactValue1");
							break;
					}
				}
			}
			if (EmailArgs != null && EmailArgs.RcptPersonIDPropertyKey != "")
				try {
					mRcptPersonID = aDataObject.GetRelatedPropertyInt(EmailArgs.RcptPersonIDPropertyKey, 0);
				} catch { } else
				mRcptPersonID = 0;
			mCc = ReplaceFieldCodes_With_Values(CorrespondenceDefinition.GetPropertyString("CorrespondenceCC"), aDataObject);
			mBcc = ReplaceFieldCodes_With_Values(CorrespondenceDefinition.GetPropertyString("CorrespondenceBCC"), aDataObject);
			mSubject = ReplaceFieldCodes_With_Values(CorrespondenceDefinition.GetPropertyString("Subject"), aDataObject);
			mBodyText = ReplaceFieldCodes_With_Values(CorrespondenceDefinition.GetPropertyString("Body"), aDataObject, GetOpenTag(aDataObject.DataObjectFactory.Appl), GetCloseTag(aDataObject.DataObjectFactory.Appl));
			mIsLog = CorrespondenceDefinition.GetPropertyBool("IsLog");
		}

		/*-----------------------------------------------------*/

		public void SetEmailParams() {
			mTo = CorrespondenceDefinition.GetPropertyString("CorrespondenceTo");
			mFrom = CorrespondenceDefinition.GetPropertyString("CorrespondenceFrom");
			if (CorrespondenceDefinition.HasProperty("CorrespondenceFromName")) {
				mFromName = CorrespondenceDefinition.GetPropertyString("CorrespondenceFromName");
			}
			mCc = CorrespondenceDefinition.GetPropertyString("CorrespondenceCC");
			mBcc = CorrespondenceDefinition.GetPropertyString("CorrespondenceBCC");
			mSubject = CorrespondenceDefinition.GetPropertyString("Subject");
			mBodyText = CorrespondenceDefinition.GetPropertyString("Body");
			mIsHtml = CorrespondenceDefinition.GetPropertyBool("IsHtml");
			mIsLog = CorrespondenceDefinition.GetPropertyBool("IsLog");
		}

		/*-----------------------------------------------------*/

		public virtual void SetMailMessageParams(cAppl aAppl) {
			//XmlNode		aEMailParamNode;
			//String		aEMailParamToAddress;

			mMailMessage = new MailMessage();
			mMailMessage.From = mFrom;
			if (mFromName != "") {
				mMailMessage.Headers.Add("From", string.Format("{0} <{1}>", mFromName, mFrom));
			}

			//email sent from development, testin or demo servers
			//aEMailParamToAddress = Get_ToAddress(aAppl);

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

				//			if (aEMailParamToAddress != "") {
				//				mMailMessage.To = aEMailParamToAddress;
				//			}
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

		/*----------------------------------------------------*/

		public bool SendEmail(cAppl aAppl) {
			return SendEmail(aAppl, true);
		}

		/*----------------------------------------------------*/

		public bool SendEmail(cAppl aAppl, bool aSetParams) {
			String aSMTPHost;
			bool aReturnValue = false;

			aSMTPHost = Get_SMTPHost(aAppl);
			if (aSMTPHost != "")
				SmtpMail.SmtpServer = aSMTPHost;

			if (EmailArgs != null) {
				foreach (cDataObject aDataObject in EmailArgs.BaseDataObjList) {
					if (aSetParams) {
						SetEmailParams(aDataObject);
						//SetMailMessageParams(aAppl);
					}
					SetMailMessageParams(aAppl);

					if (mMailMessage.To != "") {
						SmtpMail.Send(mMailMessage);
						aReturnValue = true;
					}
					if (mIsLog)
						InsertEmailLog();
				}
			} else {
				if (aSetParams) {
					SetEmailParams();
					//SetMailMessageParams(aAppl);	
				}
				SetMailMessageParams(aAppl);

				if (mMailMessage.To != "") {
					SmtpMail.Send(mMailMessage);
					aReturnValue = true;
				}
				if (mIsLog)
					InsertEmailLog();
			}
			return aReturnValue;
		}

		/*====================================================*/

		protected void InsertEmailLog() {
			cXMLDoc aXmlDoc;
			XmlNode aFiltersNode;
			XmlNode aDataObjectNode;
			cDataObject aEmailLogDO;
			int aCorrespondenceDefinitionID;

			aXmlDoc = CorrespondenceDefinition.DataObjectList.DataObjectFactory.CreateDataObjectNode("EmailLog", out aDataObjectNode, out aFiltersNode);
			aEmailLogDO = CorrespondenceDefinition.DataObjectList.DataObjectFactory.GetNewDataObject(aDataObjectNode);

			aEmailLogDO["UserID"] = mUserID;
			aEmailLogDO["RecipientPersonID"] = mRcptPersonID;
			aCorrespondenceDefinitionID = CorrespondenceDefinition.GetPropertyInt("CorrespondenceDefinitionID", 0);
			if (aCorrespondenceDefinitionID != 0)
				aEmailLogDO["TemplateID"] = aCorrespondenceDefinitionID;
			aEmailLogDO["CorrespondenceTo"] = mTo;
			aEmailLogDO["CorrespondenceCC"] = mCc;
			aEmailLogDO["CorrespondenceBCC"] = mBcc;
			aEmailLogDO["CorrespondenceFrom"] = mMailMessage.From;
			aEmailLogDO["Subject"] = mSubject;
			aEmailLogDO["Body"] = mBodyText;
			aEmailLogDO["IsHtml"] = mIsHtml;
			aEmailLogDO["CreateDate"] = DateTime.Now;

			CorrespondenceDefinition.DataObjectList.DataObjectFactory.SaveDataObject(aEmailLogDO);
		}

		/*=====================================================*/
	} // class cCorrespondenceJob


	/*====================================================*/
}  //namespace EasyGrants.Correspondence
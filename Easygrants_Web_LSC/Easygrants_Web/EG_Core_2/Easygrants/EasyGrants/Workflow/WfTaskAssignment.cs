using System;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using Core.Event;
using EasyGrants.DataAccess.Report;
using EasyGrants.DataAccess;
#if (WEB)
using Core.Web;
#endif


namespace EasyGrants.Workflow {
	/*====================================================*/

	/// <summary>
	/// returns important dates for workflow task assignments, evaluates task
	/// outcome and performs required action 
	/// </summary>
	public class cWfTaskAssignment : cDataObject {

		/*====================================================*/

		private bool mIndexNewWfTAs = false;
		private Hashtable mNewWfTACollection;
		private Hashtable mRelatedDataObjectCollection;
		private bool mRaiseProcessEvents = false;
		private bool mContinueProcessing = true;

		protected enum ProcessType {
			PreAssignment=1,
			PostAssignment,
			PreSubmission,
			PostSubmission,
			PostSubmissionWorkflow
		}
		protected enum WorkflowEventType {
			ProjectTask=1,
			Workflow
		}

		/// <summary>
		/// The event processing is done in the SaveData method. Since the SaveData method can be called even during non-submission, to identify a submission event, 
		/// we need a flag (RaiseProcessEvents) to identify the call to SaveData method during submission.
		/// </summary>

		public bool RaiseProcessEvents {
			get { return mRaiseProcessEvents; }
			set { mRaiseProcessEvents = value; }
		}

		public bool ContinueProcessing {
			get { return mContinueProcessing; }
			set { mContinueProcessing = value; }
		}

		/*====================================================*/

		public bool IndexNewWfTAs {
			/*Indexing new task assignments requires a key for each Task element.
			Since this requirement is not backward-compatible, it will only be enforced
			if this property has been explicitly set to true.*/
			get { return mIndexNewWfTAs; }
			set { mIndexNewWfTAs = value; }
		}

		/*----------------------------------------------------*/

		public Hashtable NewWfTACollection {
			/*a hashtable of the new task assignments created during outcome processing, to 
			be used if a particular task assignment needs to be designated during a later
			step in outcome processing (e.g., to send an e-mail to the workgroup associated with
			the new task assignment)*/
			get {
				if (mNewWfTACollection == null)
					mNewWfTACollection = new Hashtable();
				return mNewWfTACollection;
			}
			set {
				mNewWfTACollection = value;
			}
		}

		/*----------------------------------------------------*/

		public Hashtable RelatedDataObjectCollection {
			/*a hashtable of the related data objects created in conjunction with the new task 
			assignments created during outcome processing, to 
			be used if a particular data object needs to be designated during a later
			step in outcome processing (e.g., to send an e-mail to the workgroup associated with
			the new task assignment)*/
			get {
				if (mRelatedDataObjectCollection == null)
					mRelatedDataObjectCollection = new Hashtable();
				return mRelatedDataObjectCollection;
			}
			set {
				mRelatedDataObjectCollection = value;
			}
		}

		/*====================================================*/

		public cDataObject GetWfProjectTask() {
			cXMLDoc aXMLDoc;
			XmlNode aDataObjectNode;
			XmlNode aFiltersNode;

			aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfProjectTask", out aDataObjectNode, out aFiltersNode);
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfProjectID", GetRelatedPropertyString("GranteeProject.WfProjectID")));
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfTaskID", GetPropertyString("WfTaskID")));

			return DataObjectFactory.GetDataObject(aDataObjectNode);
		}

		/*====================================================*/

		public cDataObject GetProgressWfProjectTask() {
			cXMLDoc aXMLDoc;
			XmlNode aDataObjectNode;
			XmlNode aFiltersNode;
			//cDataObject aWfProject;

			aXMLDoc = DataObjectFactory.CreateDataObjectNode("WfProjectTask", out aDataObjectNode, out aFiltersNode);
			aFiltersNode.AppendChild(DataObjectFactory.CreateArgumentNode(aXMLDoc, "", "WfProjectTaskID", GetPropertyString("ProgressReportTaskID")));

			return DataObjectFactory.GetDataObject(aDataObjectNode);
		}
		/*====================================================*/

		public Object OpenDateCalculated {
			get {
				if (DataObjectRow["OpenDate"] == System.DBNull.Value) {
					//return GetRelatedPropertyValue("WfTask.OpenDate");
					cDataObject aObj = GetWfProjectTask();
					if (aObj != null)
						return aObj.GetPropertyValue("OpenDate");
					else
						return null;
				} else
					return DataObjectRow["OpenDate"];
			}
		}

		/*====================================================*/

		public Object ProgressReportOpenDateCalculated {
			get {
				if (DataObjectRow["OpenDate"] == System.DBNull.Value) {
					//return GetRelatedPropertyValue("WfTask.DueDate");
					cDataObject aObj = GetProgressWfProjectTask();
					if (aObj != null)
						return aObj.GetPropertyValue("OpenDate");
					else
						return null;
				} else
					return DataObjectRow["OpenDate"];
			}
		}

		/*====================================================*/

		public Object DueDateCalculated {
			get {
				if (DataObjectRow["DueDate"] == System.DBNull.Value) {
					//return GetRelatedPropertyValue("WfTask.DueDate");
					cDataObject aObj = GetWfProjectTask();
					if (aObj != null)
						return aObj.GetPropertyValue("DueDate");
					else
						return null;
				} else
					return DataObjectRow["DueDate"];
			}
		}
		/*====================================================*/

		public Object ProgressReportDueDateCalculated {
			get {
				if (DataObjectRow["DueDate"] == System.DBNull.Value) {
					//return GetRelatedPropertyValue("WfTask.DueDate");
					cDataObject aObj = GetProgressWfProjectTask();
					if (aObj != null)
						return aObj.GetPropertyValue("DueDate");
					else
						return null;
				} else
					return DataObjectRow["DueDate"];
			}
		}

		/*====================================================*/

		public Object CloseDateCalculated {
			get {
				if (DataObjectRow["CloseDate"] == System.DBNull.Value) {
					//return GetRelatedPropertyValue("WfTask.CloseDate");
					cDataObject aObj = GetWfProjectTask();
					if (aObj != null)
						return aObj.GetPropertyValue("CloseDate");
					else
						return null;
				} else
					return DataObjectRow["CloseDate"];
			}
		}

		/*====================================================*/

		public Object ProgressReportCloseDateCalculated {
			get {
				if (DataObjectRow["CloseDate"] == System.DBNull.Value) {
					//return GetRelatedPropertyValue("WfTask.DueDate");
					cDataObject aObj = GetProgressWfProjectTask();
					if (aObj != null)
						return aObj.GetPropertyValue("CloseDate");
					else
						return null;
				} else
					return DataObjectRow["CloseDate"];
			}
		}

		/*====================================================*/

		public Object ContentID {
			get {
				if (this.HasProperty("ContentID")) {
					return DataObjectRow["ContentID"];
				} else {
					return System.DBNull.Value;
				}
			}
		}

		/*====================================================*/

		public override Object GetPropertyValue(string aColumnName) {
			switch (aColumnName) {
				case "OpenDateCalculated":
					return OpenDateCalculated;
				case "DueDateCalculated":
					return DueDateCalculated;
				case "CloseDateCalculated":
					return CloseDateCalculated;
				case "ProgressReportOpenDateCalculated":
					return ProgressReportOpenDateCalculated;
				case "ProgressReportDueDateCalculated":
					return ProgressReportDueDateCalculated;
				case "ProgressReportCloseDateCalculated":
					return ProgressReportCloseDateCalculated;
				case "ContentID":
					return ContentID;
				default:
					return base.GetPropertyValue(aColumnName);
			}
		}
		
		/*----------------------------------------------------*/

		

		public cWfTaskAssignment(DataRow aDataObjectRow, cDataObjectList aDataObjectList)
			:
					base(aDataObjectRow, aDataObjectList) {

		}

		/*====================================================*/

		protected XmlNode GetOutcomeNode(XmlNode aOutcomeNode) {
			XmlNode aArgumentNode = null;
			XmlNode aOutcomeValueNode;

			aOutcomeValueNode = aOutcomeNode.SelectSingleNode("OutcomeValue");
			if (aOutcomeValueNode != null) {
				aArgumentNode = aOutcomeValueNode.SelectSingleNode("Argument");
			}
			return aArgumentNode;
		}

		/*====================================================*/

		protected String OutcomeValue_GetArgumentValue(XmlNode aArgumentNode) {
			if (aArgumentNode != null) {

				String aType = cXMLDoc.AttributeToString(aArgumentNode, "Type");
				String aTypeKey = cXMLDoc.AttributeToString(aArgumentNode, "TypeKey");

				switch (aType) {
					case "DataObjectRelated":
						return this.GetRelatedPropertyString(aTypeKey);
					default:
						return "";
				}
			}
			return "";
		}

		/*====================================================*/

		protected String EvaluateOutcome_EvaluateData(cXMLDoc aOutcomeConfigDoc) {
			/*This method evaluates outcomes using the EvaluateData functionality in cDataObject.
			It is more flexible than the original EvaluateOutcome method and was developed for the
			HHMI International competition.
			Peter Larsen 3/25/04
			*/
			String aDefaultOutcomeID;
			XmlNodeList aOutcomeNodeList;
			String aOutcomeKey = "";
			XmlNodeList aEvalNodeList;
			String aDataObjKey;
			cDataObject aDataObject;
			String aResult = "";

			aDefaultOutcomeID = cXMLDoc.AttributeToString(aOutcomeConfigDoc.DocElement.SelectSingleNode("Outcomes"), "DefaultOutcomeKey");
			aOutcomeKey = aDefaultOutcomeID;
			aOutcomeNodeList = aOutcomeConfigDoc.DocElement.SelectNodes("Outcomes/Outcome");
			foreach (XmlNode aOutcomeNode in aOutcomeNodeList) {
				aOutcomeKey = cXMLDoc.AttributeToString(aOutcomeNode, "OutcomeKey");
				aDataObjKey = cXMLDoc.AttributeToString(aOutcomeNode, "DataObjectKey");
				if (aDataObjKey == "WfTaskAssignment")
					aDataObject = this;
				else
					aDataObject = this.GetRelatedPropertyDataObject(aDataObjKey);

				//get list of evaluation nodes
				aEvalNodeList = aOutcomeNode.SelectNodes("Evaluation");
				foreach (XmlElement aEvalEl in aEvalNodeList) {
					aResult = aDataObject.EvaluateData_Item(aEvalEl);
					if (aResult != "1")
						break;
				}
				if (aResult == "1") {
					return cXMLDoc.AttributeToString(aOutcomeNode, "OutcomeKey");
				}
			}
			return aDefaultOutcomeID;
		}

		/*====================================================*/

		protected XmlNode EvaluateOutcome(cXMLDoc aOutcomeConfigDoc) {
			cXMLDoc aXmlDoc;
			XmlNode aDataObjectNode;
			XmlNode aFiltersNode;
			XmlNodeList aOutcomeNodeList;
			XmlNodeList aFilters;
			XmlNodeList aArgumentsList;
			String aOutcomeKey = "";
			bool aBool = true;
			String aDefaultOutcomeID;
			cDataObjectList aDataObjectList;
			String aDataObjKey;
			String aWfTaskFilterKey;

			aDefaultOutcomeID = cXMLDoc.AttributeToString(aOutcomeConfigDoc.DocElement.SelectSingleNode("Outcomes"), "DefaultOutcomeKey");

			aOutcomeNodeList = aOutcomeConfigDoc.DocElement.SelectNodes("Outcomes/Outcome");

			foreach (XmlNode aOutcomeNode in aOutcomeNodeList) {

				aBool = true;

				aOutcomeKey = cXMLDoc.AttributeToString(aOutcomeNode, "OutcomeKey");
				aDataObjKey = cXMLDoc.AttributeToString(aOutcomeNode, "DataObjectKey");
				aWfTaskFilterKey = cXMLDoc.AttributeToString(aOutcomeNode, "WfTaskAssignmentFilterKey");

				if (aDataObjKey == "WfTaskAssignment") {
					aDataObjectList = this.DataObjectList;
				} else {
					aXmlDoc = this.DataObjectFactory.CreateDataObjectNode(aDataObjKey, out aDataObjectNode, out aFiltersNode);
					aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", aWfTaskFilterKey, this.GetPropertyString(aWfTaskFilterKey)));
					aDataObjectList = this.DataObjectFactory.GetDataObjectList(aDataObjectNode);
				}

				aFilters = aOutcomeNode.SelectNodes("Filters");

				if (aOutcomeKey == aDefaultOutcomeID)
					aBool = false;

				foreach (XmlNode aFilterNode in aFilters) {

					aArgumentsList = aFilterNode.SelectNodes("Argument");
					foreach (cDataObject aDataObject in aDataObjectList) {

						aBool = aDataObject.MeetsFilterCriteria(aArgumentsList);
						if (aBool == true) {
							break;
						}
					}
					if (aBool == false)
						break;
				} //For Each aFilterNode

				if (aBool == true) {
					return aOutcomeNode;
				}

			} //For Each aOutcomeNode

			return null;
		}

		/*====================================================*/

		public void SetWfTaskOutcome(cXMLDoc aOutcomeConfigDoc) {
			SetWfTaskOutcome(aOutcomeConfigDoc, false, false, true);
		}

		/*====================================================*/

		public void SetWfTaskOutcome(cXMLDoc aOutcomeConfigDoc, bool aUseEvaluateData) {
			SetWfTaskOutcome(aOutcomeConfigDoc, aUseEvaluateData, false, true);
		}

		/*====================================================*/

		public void SetWfTaskOutcome(cXMLDoc aOutcomeConfigDoc, bool aUseEvaluateData, bool aRaiseSingleEvent) {
			SetWfTaskOutcome(aOutcomeConfigDoc, aUseEvaluateData, aRaiseSingleEvent, true);
		}

		/*====================================================*/
		
		public void SetWfTaskOutcome(cXMLDoc aOutcomeConfigDoc, bool aUseEvaluateData, bool aRaiseSingleEvent, bool aRaiseEvents) {
			SetWfTaskOutcome(aOutcomeConfigDoc, aUseEvaluateData, aRaiseSingleEvent, aRaiseEvents, "");
		}

		/*====================================================*/

		public void SetWfTaskOutcome(cXMLDoc aOutcomeConfigDoc, bool aUseEvaluateData, bool aRaiseSingleEvent, bool aRaiseEvents, string aRcptPersonIDPropertyKey) {
			/*This override of the SetWfTaskOutcome method exists so that both the
			old (EvaluateOutcome) and new (EvaluateOutcome_EvaluateData) models of
			outcome configuration file processing can be used at the same time. Existing
			pages that call SetWfTaskOutcome with no parameters will use the old model to
			which they were written. The old model may or may not eventually be done away with.
			Peter Larsen 3/25/04.
			*/
			XmlNodeList aTaskNodeList;
			XmlNodeList aUpdateDataList;
			XmlNodeList aEventNodeList;
			XmlNode aOutcomeNode;
			String aOutcomeID = "";

			int aUserID;
			aUserID = ((cPerson) this.GetRelatedPropertyDataObject("Person")).Get_EG_User();

			if (aUseEvaluateData) {
				aOutcomeID = EvaluateOutcome_EvaluateData(aOutcomeConfigDoc);
				aOutcomeNode = cXMLDoc.FindNode(aOutcomeConfigDoc.DocElement.SelectSingleNode("Outcomes"),
											"Outcome", "OutcomeKey", aOutcomeID.ToString());
			} else
				aOutcomeNode = EvaluateOutcome(aOutcomeConfigDoc);


			if (aOutcomeNode == null) {
				aOutcomeID = cXMLDoc.AttributeToString(aOutcomeConfigDoc.DocElement.SelectSingleNode("Outcomes"), "DefaultOutcomeKey");
				if (aOutcomeID != "") {
					this["WfTaskOutcomeID"] = aOutcomeID;
				}
				this.DataObjectList.DataObjectFactory.SaveDataObject(this);
			} else {
				String aOutcomeValue = OutcomeValue_GetArgumentValue(GetOutcomeNode(aOutcomeNode));
				if (aOutcomeValue != "")
					aOutcomeID = aOutcomeValue;
				else
					aOutcomeID = cXMLDoc.AttributeToString(aOutcomeNode, "OutcomeKey");

				if (Convert.ToInt32(aOutcomeID) > 0) {
					this["WfTaskOutcomeID"] = aOutcomeID;
					this.DataObjectList.DataObjectFactory.SaveDataObject(this);
				}
				
				XmlNode aProcessingEventsNode = aOutcomeNode.SelectSingleNode("ProcessingEvents");
				if (ContinueProcessing && aProcessingEventsNode != null)  {
					XmlNodeList aDataObjectNodeList = aProcessingEventsNode.SelectNodes("DataObject");
					if (aDataObjectNodeList != null && aDataObjectNodeList.Count > 0) {
						foreach (XmlNode aDataObjectNode in aDataObjectNodeList) {
							XmlNodeList aFilterArgsList = aDataObjectNode.SelectNodes("Filters/Argument");
							foreach (XmlNode aArgNode in aFilterArgsList) {
								WfTaskOutcome_SetRelatedDataObjectArgValues(null, aArgNode);
							}
							cProcessingEvent aProcessingEvent;
							aProcessingEvent = cProcessingEvent.CreateProcessingEventInstance(cXMLDoc.AttributeToString(aDataObjectNode, "DataObjectDefinitionKey"), this.DataObjectFactory);
							aProcessingEvent.ProcessEvent(aDataObjectNode);
							if (aProcessingEvent.StatusID < 1) {
								ContinueProcessing = false;
								break;
							}
						}
					}
				}

				if (!ContinueProcessing) return; //if the event processing failed, stopping continuing the process of creating the tasks or sending emails

				cDataObjectList aWftaReopenRequestDOL=DataObjectFactory.GetDataObjectListWithFilter("WftaReopenRequest","ReopenWfTaskAssignmentID",this.GetPropertyString("WfTaskAssignmentID"),"Active","True");
				if (aWftaReopenRequestDOL.Count > 0){
					cDataObject aRequestingWfTaskAssignmentDo = aWftaReopenRequestDOL[0].GetRelatedPropertyDataObject("RequestingWfTaskAssignment");
					aRequestingWfTaskAssignmentDo["WfTaskStatusID"] = "1"; //Incomplete
					aRequestingWfTaskAssignmentDo.SaveData();
					aWftaReopenRequestDOL[0]["Active"]="False";
					aWftaReopenRequestDOL[0].SaveData();			
				}
				else {
					XmlNode aTasksNode = aOutcomeNode.SelectSingleNode("Tasks");
						if (aTasksNode != null) {
							IndexNewWfTAs = cXMLDoc.AttributeToBool(aTasksNode, "Index", false);
							aTaskNodeList = aTasksNode.SelectNodes("Task");
							if (aTaskNodeList != null)
								//assign tasks associated with outcome
								ContinueProcessing = WfTaskOutcome_CreateNewTaskAssignments(aTaskNodeList);
						}
				}

				if (!ContinueProcessing) return; //if the pre and post assignment event processing failed, stopping continuing the process of updating and sending emails
				aUpdateDataList = aOutcomeNode.SelectNodes("UpdateData/Argument");
				if (aUpdateDataList != null)
					//update data related to the submitted WfTaskAssignment
					WfTaskOutcome_UpdateData(aUpdateDataList);

				if (aRaiseEvents)
				{
					aEventNodeList = aOutcomeNode.SelectNodes("Events/Event");
					if (aEventNodeList != null) {
						//raise events associated with task outcome
						foreach (XmlNode aEventNode in aEventNodeList) {
							XmlNode aEventDataObjectListNode = aEventNode.SelectSingleNode("EventDataObjectList");
							if (aEventDataObjectListNode == null) {
								if (aRaiseSingleEvent) {
									if (aRcptPersonIDPropertyKey != "") {
										RaiseSingleEvent(cXMLDoc.AttributeToInt(aEventNode, "EventKey"), aUserID, aRcptPersonIDPropertyKey);
									} else {
										RaiseSingleEvent(cXMLDoc.AttributeToInt(aEventNode, "EventKey"), aUserID);
									}
								} else
									RaiseEvent(cXMLDoc.AttributeToInt(aEventNode, "EventKey"), aUserID);
							}
							else {
								//Get the PersonID attribute of the EventDataObjectList node set in case this event is assigned to Grant Primary Staff, etc
								String aPersonPropertyKey = cXMLDoc.AttributeToString(aEventDataObjectListNode, "PersonID", "");
								if (aPersonPropertyKey != "") {
									String aPersonID = "";
									aPersonID = this.GetRelatedPropertyString(aPersonPropertyKey);
									if (aPersonID == "")
										continue;
								}
								XmlNodeList aFilterArgsList = aEventDataObjectListNode.SelectNodes("Filters/Argument");
								foreach (XmlNode aArgNode in aFilterArgsList) {
									WfTaskOutcome_SetRelatedDataObjectArgValues(null, aArgNode);
									//if email is assigned to a grant primary staff person and there is no primary staff person assigned
									//if (cXMLDoc.AttributeToBool(aArgNode, "Null", false) && cXMLDoc.AttributeToString(aArgNode, "TypeKey", "") == "GranteeProject.GranteeProjectPrimaryStaffAffiliation.StaffPersonID" ) {
									if (cXMLDoc.AttributeToBool(aArgNode, "Null", false)) {
										cDataObject aDefaultWorkgroupDO = DataObjectFactory.GetDataObjectListWithFilter("WorkGroup", "IsPrimary", "True")[0];
										if (aDefaultWorkgroupDO != null) {
											aEventDataObjectListNode.Attributes["DataObjectDefinitionKey"].Value = "WorkGroupMember";
											aArgNode.Attributes["TypeKey"].Value = "WorkGroupID";
											aArgNode.Attributes["PropertyKey"].Value = "WorkGroupID";
											aArgNode.Attributes["Value"].Value = aDefaultWorkgroupDO.GetPropertyString("WorkGroupID");
										}
									}
								}
								cDataObjectList aEventDataObjectList = DataObjectFactory.GetDataObjectList(aEventDataObjectListNode);
								if (aRaiseSingleEvent) {
									if (aRcptPersonIDPropertyKey != "") {
										RaiseSingleEvent(cXMLDoc.AttributeToInt(aEventNode, "EventKey"), aUserID, aEventDataObjectList, aRcptPersonIDPropertyKey);
									} else {
										RaiseSingleEvent(cXMLDoc.AttributeToInt(aEventNode, "EventKey"), aUserID, aEventDataObjectList);
									}
								}
								else
									RaiseEvent(cXMLDoc.AttributeToInt(aEventNode, "EventKey"), aUserID, aEventDataObjectList);
							}
						}
					}
				}
			}
		}

		/*-------------------------------------------------------------*/

		public int EvaluateItem(XmlNode aValidationItemNode, cDataObjectFactory aDataObjectFactory) {
			XmlNode aRequirementNode;
			String aPropertyKey;
			String aDataObjectKey;
			cDataObjectList aChildDataObjectList;
			XmlNodeList aFilterNodeList;
			int aCount = 0;
			int aChildCount = 0;
			int aMinCount = 0;
			int aMaxCount = System.Int32.MaxValue;
			int aResultCode;
			XmlNodeList aResultNodeList;

			aDataObjectKey = cXMLDoc.AttributeToString(aValidationItemNode, "DataObjectKey");
			aRequirementNode = aValidationItemNode.SelectSingleNode("Requirement");

			XmlNode aChildRequirementNode = aRequirementNode.SelectSingleNode("Requirement");

			if (aChildRequirementNode != null) {
				aPropertyKey = cXMLDoc.AttributeToString(aChildRequirementNode, "PropertyKey");

				aChildDataObjectList = GetRelatedPropertyDataObjectList(aPropertyKey);
				aFilterNodeList = aChildRequirementNode.SelectNodes("Filters/Argument");
				if (aChildDataObjectList != null) {
					foreach (cDataObject aChildDataObject in aChildDataObjectList) {
						if (aChildDataObject.MeetsFilterCriteria(aFilterNodeList)) {
							aChildCount += 1;
						}
					}
				}
				aMinCount = cXMLDoc.AttributeToInt(aChildRequirementNode, "MinCount", 0);
				aMaxCount = cXMLDoc.AttributeToInt(aChildRequirementNode, "MaxCount", System.Int32.MaxValue);

				if (aChildCount >= aMinCount && aChildCount <= aMaxCount)
					return cXMLDoc.AttributeToInt(aChildRequirementNode, "ResultCode", 0);

			}
			if (aChildRequirementNode == null || aChildCount < aMinCount || aChildCount > aMaxCount) {
				aPropertyKey = cXMLDoc.AttributeToString(aRequirementNode, "PropertyKey");

				aChildDataObjectList = GetRelatedPropertyDataObjectList(aPropertyKey);
				aFilterNodeList = aRequirementNode.SelectNodes("Filters/Argument");
				if (aChildDataObjectList != null) {
					foreach (cDataObject aChildDataObject in aChildDataObjectList) {
						if (aChildDataObject.MeetsFilterCriteria(aFilterNodeList)) {
							aCount += 1;
						}
					}
				}

				aResultNodeList = aValidationItemNode.SelectNodes("Results/Result");
				foreach (XmlNode aResultNode in aResultNodeList) {
					//Set minimum and maximum count values, using default values if they are not specified in XML
					aMinCount = cXMLDoc.AttributeToInt(aResultNode, "MinCount", 0);
					aMaxCount = cXMLDoc.AttributeToInt(aResultNode, "MaxCount", System.Int32.MaxValue);

					if (aCount >= aMinCount && aCount <= aMaxCount) {
						XmlElement aResultEl = (XmlElement) aResultNode;

						cXMLDoc.IndicateValidationResult(ref aResultEl);
						aResultCode = cXMLDoc.AttributeToInt(aResultNode, "ResultCode");
						return aResultCode;
					}
				}
			}
			//If none of the result nodes matched the data, return a result of zero.
			return 0;
		}

		/*====================================================*/
		/*
			public void Notify_DataModified(cDataObjectFactory aDataObjectFactory, Hashtable aDataObjHash) 
			{
				cXMLDoc				aXmlDoc;
				XmlNode				aDataObjectNode;
				XmlNode				aFiltersNode;
				XmlNode				aArgNode;
				cDataObjectList		aRptOutputDefs;

				aXmlDoc = aDataObjectFactory.CreateDataObjectNode("ReportOutputDefinition", out aDataObjectNode, out aFiltersNode);	
				aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
					"EntityDataObjectKey", "WfTaskAssignment"));
				aRptOutputDefs = aDataObjectFactory.GetDataObjectList(aDataObjectNode);
				foreach(cDataObject aRptOutputDef in aRptOutputDefs) 
				{
					//Debug.WriteLine("ID, Description: " + aRptOutputDef["ReportOutputDefinitionID"].ToString() + ", " + aRptOutputDef["Description"].ToString());
					aXmlDoc = aDataObjectFactory.CreateDataObjectNode("ReportOutput", out aDataObjectNode, out aFiltersNode);	
					aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
						"DefinitionID", aRptOutputDef["ReportOutputDefinitionID"].ToString()));
					aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
						"EntityID", this.GetPropertyString("WfTaskAssignmentID"), "AND"));
		
					cDataObjectList		aRptOutputs;
					aRptOutputs = aDataObjectFactory.GetDataObjectList(aDataObjectNode);
					foreach(cReportOutput aRptOutput in aRptOutputs) 
					{
						Debug.WriteLine(" * ReportOutput: " + aRptOutput["ReportOutputID"].ToString());
			
						aRptOutput.ReportOutput_Delete() ;
					}
				}
			}
		*/

		public void Notify_DataModified(cDataObjectFactory aDataObjectFactory, Hashtable aDataObjHash) {
#if (WEB)
			string aApplName;
			aApplName = ((cWebAppl) aDataObjectFactory.Appl).Name;
			if(aApplName.ToUpper() == "HHMI")
			{
				Notify_DataModified_HHMI(aDataObjectFactory);
				return;
			}
#endif

			cDataObject aGP = this.GetRelatedPropertyDataObject("GranteeProject");
			if (aGP != null && this.HasProperty("WfProjectTaskPDF") && this.HasProperty("UnlockedPdfs")) {
				cDataObjectList aUnlockedPdfsList = this.GetRelatedPropertyDataObjectList("UnlockedPdfs");
				foreach (cDataObject aUnlockedPdf in aUnlockedPdfsList) {
					cDataObject aReportOutputDO = aDataObjectFactory.GetDataObjectListWithFilter("ReportOutput", "DefinitionID", aUnlockedPdf.GetPropertyString("ReportOutputDefinitionID"), "EntityID", this.GetPropertyString("WfTaskAssignmentID"))[0];
					if (aReportOutputDO != null) {
						//delete existing pdf
						aDataObjectFactory.DeleteData(aReportOutputDO);
					}
				}
			}
			else if (aGP != null && this.HasProperty("WfProjectTaskPDF"))
			{
				cDataObjectList aWfProjectTaskPDFList = this.GetRelatedPropertyDataObjectList("WfProjectTask.AppPDFReportKeyLink");
				foreach (cDataObject aWfProjectTaskPDF in aWfProjectTaskPDFList)
				{
					if (aWfProjectTaskPDF.GetPropertyInt("ReportOutputDefinitionTypeID", 1) != 1 && aWfProjectTaskPDF.GetPropertyBool("PDFGenerationID", false) == false)
					{
						string aReportOutputDefinitionID = aWfProjectTaskPDF.GetRelatedPropertyString("FinalPDFReportKeyLink.ReportOutputDefinitionID");
						cDataObject aReportOutputDO = aDataObjectFactory.GetDataObjectListWithFilter("ReportOutput", "DefinitionID", aReportOutputDefinitionID, "EntityID", this.GetPropertyString("WfTaskAssignmentID"))[0];
						if (aReportOutputDO != null) {
							//delete existing pdf
							aDataObjectFactory.DeleteData(aReportOutputDO);
						}
					}
				}
			} else {
				cXMLDoc aXmlDoc;
				XmlNode aDataObjectNode;
				XmlNode aFiltersNode;
				XmlNode aArgNode;
				cDataObjectList aRptOutputDefs;

				aXmlDoc = aDataObjectFactory.CreateDataObjectNode("ReportOutputDefinition", out aDataObjectNode, out aFiltersNode);
				aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
					"EntityDataObjectKey", "WfTaskAssignment"));
				aRptOutputDefs = aDataObjectFactory.GetDataObjectList(aDataObjectNode);
				foreach (cDataObject aRptOutputDef in aRptOutputDefs) {
					//Debug.WriteLine("ID, Description: " + aRptOutputDef["ReportOutputDefinitionID"].ToString() + ", " + aRptOutputDef["Description"].ToString());
					aXmlDoc = aDataObjectFactory.CreateDataObjectNode("ReportOutput", out aDataObjectNode, out aFiltersNode);
					aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
						"DefinitionID", aRptOutputDef["ReportOutputDefinitionID"].ToString()));
					aArgNode = aFiltersNode.AppendChild(aDataObjectFactory.CreateArgumentNode(aXmlDoc, "Data",
						"EntityID", this.GetPropertyString("WfTaskAssignmentID"), "AND"));

					cDataObjectList aRptOutputs;
					aRptOutputs = aDataObjectFactory.GetDataObjectList(aDataObjectNode);
					foreach (cReportOutput aRptOutput in aRptOutputs) {
						Debug.WriteLine(" * ReportOutput: " + aRptOutput["ReportOutputID"].ToString());

						aRptOutput.ReportOutput_Delete();
					}
				}
			}
		}

		public void Notify_DataModified_HHMI(cDataObjectFactory aDataObjectFactory) {
			cWfTaskAssignment aApplWfTA = this;

			//find the applicant WfTaskAssignment
			int aRoleID = this.GetPropertyInt("WfTaskRoleID", 0);
			if (aRoleID != 1) {
				cDataObject aGP = this.GetRelatedPropertyDataObject("GranteeProject");
				cDataObjectList aDOL;
				aDOL = aGP.GetRelatedPropertyDataObjectList("ApplWfTaskAssignments");
				foreach (cDataObject aDO in aDOL) {
					if (aDO.GetRelatedPropertyInt("WfTask.WfTaskTypeID", 0) == 1) {
						aApplWfTA = (cWfTaskAssignment) aDO;
						break;
					}
				}
			}

			cDataObjectList aWfProjectPDFList = aApplWfTA.GetRelatedPropertyDataObjectList("GranteeProject.WfProjectPDF");
			foreach (cDataObject aWfProjectPDF in aWfProjectPDFList) {
				if (aWfProjectPDF.GetPropertyInt("PDFGenerationID", 0) == 1) {
					string aReportOutputDefinitionID = aWfProjectPDF.GetRelatedPropertyString("FinalPDFReportKeyLink.ReportOutputDefinitionID");
					cDataObject aReportOutputDO = aDataObjectFactory.GetDataObjectListWithFilter("ReportOutput", "DefinitionID", aReportOutputDefinitionID, "EntityID", aApplWfTA.GetPropertyString("WfTaskAssignmentID"))[0];
					if (aReportOutputDO != null) {
						if (aRoleID != 1 && aWfProjectPDF.GetPropertyInt("ReportOutputDefinitionTypeID", 1) == 1)
							continue; //skip applicant pdf when make changes to third party data
						//delete existing pdf
						aDataObjectFactory.DeleteData(aReportOutputDO);
					}
				}
			}
		}

		/*====================================================*/

		public static void RaiseEvent_From_WfTAID(cDataObjectFactory aDataObjectFactory, int aEventID, int aWfTAID) {
			cWfTaskAssignment aWfTaskAssignment;

			aWfTaskAssignment = (cWfTaskAssignment) aDataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTAID);
			if (aWfTaskAssignment != null) {
				int aUserID;
				aUserID = ((cPerson) aWfTaskAssignment.GetRelatedPropertyDataObject("Person")).Get_EG_User();

				aWfTaskAssignment.RaiseEvent(aEventID, aUserID);
			}
		}

		/*-------------------------------------------------------------*/

		public static void RaiseEvent_From_WfPersonTaskRole(cDataObjectFactory aDataObjectFactory, int aEventID, int aWfPersonID, int aWfTaskID, int aWfTaskRoleID) {
			cWfTaskAssignment aWfTaskAssignment;
			cXMLDoc aXMLDoc;
			XmlNode aDataObjectNode;
			XmlNode aFiltersNode;
			XmlNode aArgNode;

			aXMLDoc = aDataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
			aArgNode = aDataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "PersonID", aWfPersonID.ToString());
			aFiltersNode.AppendChild(aArgNode);
			aArgNode = aDataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskID", aWfTaskID.ToString());
			aFiltersNode.AppendChild(aArgNode);
			aArgNode = aDataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskRoleID", aWfTaskRoleID.ToString());
			aFiltersNode.AppendChild(aArgNode);

			aWfTaskAssignment = (cWfTaskAssignment) aDataObjectFactory.GetDataObject(aDataObjectNode);
			if (aWfTaskAssignment != null) {
				int aUserID;
				aUserID = ((cPerson) aWfTaskAssignment.GetRelatedPropertyDataObject("Person")).Get_EG_User();

				aWfTaskAssignment.RaiseEvent(aEventID, aUserID);
			}
		}

		/*====================================================*/

		public override void SaveData() {
			//if (!this.IsNewDataObject) {
			//    //Before saving updated data, check data in DB to see if PersonID is being changed.
			//    cDataObject aWfTaskAssignment = this.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", GetPropertyInt("WfTaskAssignmentID"));
			//    if (aWfTaskAssignment.GetPropertyValue("PersonID") != System.DBNull.Value) {
					//if (aWfTaskAssignment.GetPropertyInt("PersonID") != this.GetPropertyInt("PersonID")) {
					//    //If so, check to see if this person is the primary person for the GranteeProject
					//    cDataObject aGranteeProject = this.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", GetPropertyInt("GranteeProjectID"));
					//    if (aGranteeProject.GetPropertyValue("PrimaryPersonID") == System.DBNull.Value || aGranteeProject.GetPropertyInt("PrimaryPersonID") == aWfTaskAssignment.GetPropertyInt("PersonID")) {
					//        //If so, update primary person for the GranteeProject and save
					//        aGranteeProject["PrimaryPersonID"] = this.GetPropertyInt("PersonID");
					//        aGranteeProject.SaveData();
					//    }
					//}
			//    }
			//}
			bool aIsNewWFTA = false;
			if (IsNewDataObject) {
				aIsNewWFTA = true;
			}

			if (aIsNewWFTA) { //Process all Pre-Assignment events if it is a new workflow task assignment
				ContinueProcessing = this.GetEventsProcessingResult(ProcessType.PreAssignment, WorkflowEventType.ProjectTask);
			}
			else if (RaiseProcessEvents) { //Process all Pre-Submission events if the SaveData method is being called because of submission
				ContinueProcessing = this.GetEventsProcessingResult(ProcessType.PreSubmission, WorkflowEventType.ProjectTask);
			}
			
			if (!ContinueProcessing)
				return;
				
			base.SaveData();

			if (aIsNewWFTA) { //Process all Post-Assignment events if it is a new workflow task assignment
				ContinueProcessing = this.GetEventsProcessingResult(ProcessType.PostAssignment, WorkflowEventType.ProjectTask);
			}
			else if (RaiseProcessEvents) { //Process all Post-Submission events if the SaveData method is being called because of submission
				ContinueProcessing = this.GetEventsProcessingResult(ProcessType.PostSubmission, WorkflowEventType.ProjectTask);
			}

			if (this.GetPropertyInt("WfTaskStatusID", 0) == 2)
				cGranteeProjectOutcomes.Create_Outcome(this, true, true, false);
			else
				cGranteeProjectOutcomes.Create_Outcome(this, false, true, false);

			//cGranteeProjectOutcomes.Create_Outcome(this, false, true, true);
		}

		/*====================================================*/

		public void UpdateReviewRating() {
			string aWfProjectID;
			string aWfTaskID;
			cDataObjectList aQuestionList;
			cDataObject aRatingsCommentsDO;
			double aRate = 0;

			aWfProjectID = this.GetRelatedPropertyString("GranteeProject.WfProjectID");
			aWfTaskID = this.GetRelatedPropertyString("WfTaskID");
			aQuestionList = this.DataObjectFactory.GetDataObjectListWithFilter("ProjectReviewQuestion", "WfProjectID", aWfProjectID, "WfTaskID", aWfTaskID, "CollectScore", "True");
			foreach (cDataObject aQuestionDO in aQuestionList) {
				aRatingsCommentsDO = this.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", this.GetPropertyString("WfTaskAssignmentID"), "ProjectReviewQuestionID", aQuestionDO.GetPropertyString("ProjectReviewQuestionID"))[0];
				if (aRatingsCommentsDO == null || aRatingsCommentsDO.GetPropertyString("Rating", "") == "") {
					this["ReviewRating"] = System.DBNull.Value;
					this.SaveData();
					return;
				} else {
					if (aQuestionDO.GetPropertyDouble("Weight", -1) != -1)
						aRate += (Convert.ToDouble(aRatingsCommentsDO.GetPropertyString("Rating")) * aQuestionDO.GetPropertyDouble("Weight"));
					else
						aRate += (Convert.ToDouble(aRatingsCommentsDO.GetPropertyString("Rating")));
				}
			}
			this["ReviewRating"] = aRate;
			this.SaveData();
		}

		/*====================================================*/

		protected virtual bool WfTaskOutcome_CreateNewTaskAssignments(XmlNodeList aTaskNodeList)
		{

			foreach (XmlNode aTaskNode in aTaskNodeList) {

				//check if WfTaskAssignment already exists for GranteeProjectID, PersonID, WfTaskID
				int aNewTaskID = cXMLDoc.AttributeToInt(aTaskNode, "TaskKey", 0);
				string aUpdateExistingWFTA = cXMLDoc.AttributeToString(aTaskNode, "UpdateExistingWFTA", "True");
				String aNewPersonProperty;
				int aNewPersonID = -1;
				int aDefaultWorkgroupID = -1;
				if (!cXMLDoc.AttributeToBool(aTaskNode, "NoPersonID", false)) {
					aNewPersonProperty = cXMLDoc.AttributeToString(aTaskNode, "PersonID");
					if (aNewPersonProperty == "")
						aNewPersonProperty = "PersonID";
					aNewPersonID = this.GetRelatedPropertyInt(aNewPersonProperty, -1);
					if (aNewPersonID == 0 || aNewPersonID == -1) {
						aNewPersonID = -1;
						aDefaultWorkgroupID = cXMLDoc.AttributeToInt(aTaskNode, "DefaultWorkgroupID", -1);
					}
				}
				XmlNode aDataObjectNode;
				XmlNode aFiltersNode;
				cXMLDoc aXmlDoc = this.DataObjectList.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", out aDataObjectNode, out aFiltersNode);
				aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", this.GetPropertyString("GranteeProjectID")));
				if (aNewPersonID != -1)
					aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "PersonID", aNewPersonID.ToString()));
				aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aNewTaskID.ToString()));
				aFiltersNode.AppendChild(this.DataObjectList.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "AppWftaID", this.GetPropertyString("WfTaskAssignmentID")));
				XmlNodeList aExistingFiltersList = aTaskNode.SelectNodes("ExistingWfTAFilters/Argument");
				foreach (XmlNode aExistingFilterNode in aExistingFiltersList) {
					WfTaskOutcome_SetRelatedDataObjectArgValues(null, aExistingFilterNode);
					aFiltersNode.InnerXml += aExistingFilterNode.OuterXml;
				}
				cWfTaskAssignment aWfTaskAssgDataObject = (cWfTaskAssignment)this.DataObjectList.DataObjectFactory.GetDataObject(aDataObjectNode);

				if (aWfTaskAssgDataObject == null){ //create new WfTaskAssignment object
					aWfTaskAssgDataObject = (cWfTaskAssignment)DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment");
					aWfTaskAssgDataObject["WfTaskID"] = aNewTaskID;
					if (aNewPersonID != -1)
						aWfTaskAssgDataObject["PersonID"] = aNewPersonID;
					else if (aDefaultWorkgroupID != -1)
						aWfTaskAssgDataObject["WorkgroupID"] = aDefaultWorkgroupID;
					WfTaskOutcome_SaveNewTaskAssignment(aWfTaskAssgDataObject, aTaskNode);
				}
				else
					if (aUpdateExistingWFTA == "True")
					{
						WfTaskOutcome_SaveNewTaskAssignment(aWfTaskAssgDataObject, aTaskNode);
					}

				if (!aWfTaskAssgDataObject.ContinueProcessing)
					return false;
				//create related data objects
				XmlNodeList aRelatedDOList = aTaskNode.SelectNodes("RelatedDataObject");
				foreach (XmlNode aRelatedDONode in aRelatedDOList)
					WfTaskOutcome_CreateTARelatedDataObject(aWfTaskAssgDataObject, aRelatedDONode);
			}
			return true;
		}


		/*----------------------------------------------------*/
		protected void WfTaskOutcome_SaveNewTaskAssignment(cDataObject aWfTaskAssgDataObject, XmlNode aTaskNode)
		{				
				if (cXMLDoc.AttributeToInt(aTaskNode, "RoleID", 0) > 0)
					aWfTaskAssgDataObject["WfTaskRoleID"] = cXMLDoc.AttributeToInt(aTaskNode, "RoleID", 0);
				else
					aWfTaskAssgDataObject["WfTaskRoleID"] = this["WfTaskRoleID"];
				aWfTaskAssgDataObject["GranteeProjectID"] = this["GranteeProjectID"];

				if (aWfTaskAssgDataObject.GetRelatedPropertyValue("WfProjectTask.OpenDate") == null)
					aWfTaskAssgDataObject["OpenDate"] = System.DateTime.Now;
				aWfTaskAssgDataObject["CreateUser"] = this.DataObjectFactory.User.UserID;
				aWfTaskAssgDataObject["CreateDate"] = System.DateTime.Now;
				aWfTaskAssgDataObject["WfTaskStatusID"] = cXMLDoc.AttributeToInt(aTaskNode, "Status", 0);
			
			if (IndexNewWfTAs)
				NewWfTACollection.Add(cXMLDoc.AttributeToString(aTaskNode, "Key"), aWfTaskAssgDataObject);

			//update status and outcome on either new or existing WfTaskAssignment Object. If the task specifies NoPersonID=True
			//(i.e., a workgroup task assignment), the status will not be updated unless the UpdateStatus=True attribute is also present.
			if (!cXMLDoc.AttributeToBool(aTaskNode, "NoPersonID", false) || cXMLDoc.AttributeToBool(aTaskNode, "UpdateStatus", false))
				aWfTaskAssgDataObject["WfTaskStatusID"] = cXMLDoc.AttributeToInt(aTaskNode, "Status", 0);
			if (cXMLDoc.AttributeToInt(aTaskNode, "Outcome", 0) > 0)
				aWfTaskAssgDataObject["WfTaskOutcomeID"] = cXMLDoc.AttributeToInt(aTaskNode, "Outcome");
			if (cXMLDoc.AttributeToString(aTaskNode, "WorkgroupID", "") != "")
				aWfTaskAssgDataObject["WorkgroupID"] = cXMLDoc.AttributeToInt(aTaskNode, "WorkgroupID");

			//save WfTaskAssignment object
			aWfTaskAssgDataObject.SaveData();
		}
		
		/*----------------------------------------------------*/
		protected cDataObject WfTaskOutcome_CreateTARelatedDataObject(cDataObject aNewWfTaskAssgDataObject, XmlNode aRelatedDONode) {
			//Get related data object if it already exists.
			String aDODefKey = cXMLDoc.AttributeToString(aRelatedDONode, "DataObjectDefinitionKey");
			XmlNodeList aFilterArgsList = aRelatedDONode.SelectNodes("Filters/Argument");
			foreach (XmlNode aArgNode in aFilterArgsList) {
				WfTaskOutcome_SetRelatedDataObjectArgValues(aNewWfTaskAssgDataObject, aArgNode);
			}
			cDataObject aDataObject = DataObjectFactory.GetDataObject(aRelatedDONode);
			//If not, create a new one.
			if (aDataObject == null)
				aDataObject = DataObjectFactory.CreateNewDataObjectFromKey(aDODefKey);
			//Populate properties and save.
			XmlNodeList aPropertyArgsList = aRelatedDONode.SelectNodes("DataObjectProperties/Argument");
			foreach (XmlNode aArgNode in aPropertyArgsList) {
				WfTaskOutcome_SetRelatedDataObjectArgValues(aNewWfTaskAssgDataObject, aArgNode);
				String aPropertyKey = cXMLDoc.AttributeToString(aArgNode, "PropertyKey");
				aDataObject[aPropertyKey] = cXMLDoc.AttributeToString(aArgNode, "Value");
			}

			int aUserID;
			aUserID = ((cPerson) this.GetRelatedPropertyDataObject("Person")).Get_EG_User();
			aDataObject.DataObjectList.UserID = aUserID;

			aDataObject.SaveData();
			if (cXMLDoc.AttributeToString(aRelatedDONode, "Key") != "") {
				RelatedDataObjectCollection.Add(cXMLDoc.AttributeToString(aRelatedDONode, "Key"), aDataObject);
			}
			return aDataObject;
		}

		/*----------------------------------------------------*/

		protected void WfTaskOutcome_SetRelatedDataObjectArgValues(cDataObject aNewWfTaskAssgDataObject, XmlNode aArgNode) {
			Object aDataValue = null;
			bool SetDataValue = false;
			XmlAttribute aAttr = aArgNode.Attributes["Value"];
			if (aAttr == null) {
				aAttr = aArgNode.OwnerDocument.CreateAttribute("Value");
				aArgNode.Attributes.Append(aAttr);
			}
			switch (cXMLDoc.AttributeToString(aArgNode, "Type")) {
				case "":
				case "Data":
					//Do nothing
					break;
				case "NewWfTaskAssignment":
					if (aNewWfTaskAssgDataObject != null)
						aDataValue = aNewWfTaskAssgDataObject.GetRelatedPropertyValue(cXMLDoc.AttributeToString(aArgNode, "TypeKey"));
					SetDataValue = true;
					break;
				case "SubmittedWfTaskAssignment":
					aDataValue = this.GetRelatedPropertyValue(cXMLDoc.AttributeToString(aArgNode, "TypeKey"));
					SetDataValue = true;
					break;
				case "NewWfTACollection":
					cDataObject aWfTA = (cDataObject) NewWfTACollection[cXMLDoc.AttributeToString(aArgNode, "TypeKey")];
					aDataValue = aWfTA.GetPropertyValue(cXMLDoc.AttributeToString(aArgNode, "DataObjectPropertyKey"));
					SetDataValue = true;
					break;
				case "RelatedDataObjectCollection":
					aWfTA = (cDataObject) RelatedDataObjectCollection[cXMLDoc.AttributeToString(aArgNode, "TypeKey")];
					aDataValue = aWfTA.GetPropertyValue(cXMLDoc.AttributeToString(aArgNode, "DataObjectPropertyKey"));
					SetDataValue = true;
					break;
			}
			if (SetDataValue) {
				if (aDataValue == System.DBNull.Value || aDataValue == null) {
					cXMLDoc.AddAttribute_ToNode(aArgNode, "Null", "True");
				} else {
					cXMLDoc.AddAttribute_ToNode(aArgNode, "Null", "False");
					aAttr.Value = aDataValue.ToString();
				}
			}
		}

		/*----------------------------------------------------*/

		protected void WfTaskOutcome_UpdateData(XmlNodeList aUpdateDataNodeList) {

			foreach (XmlNode aUpdateDataNode in aUpdateDataNodeList) {
				WfTaskOutcome_SetRelatedDataObjectArgValues(null, aUpdateDataNode);
				String aPropertyKey = cXMLDoc.AttributeToString(aUpdateDataNode, "PropertyKey");
				String aFinalKey;

				int aIndex = aPropertyKey.LastIndexOf(".");
				if (aIndex == -1) {
					cDataObject aDataObject = this;
					aFinalKey = aPropertyKey;
					if (cXMLDoc.AttributeToBool(aUpdateDataNode, "Null"))
						aDataObject[aFinalKey] = System.DBNull.Value;
					else
						aDataObject[aFinalKey] = cXMLDoc.AttributeToString(aUpdateDataNode, "Value");
					aDataObject.SaveData();
				} else {
					aFinalKey = aPropertyKey.Substring(aIndex + 1);
					cDataObjectList aDataObjectList = this.GetRelatedPropertyDataObjectList(aPropertyKey.Substring(0, aIndex));
					foreach (cDataObject aDataObject in aDataObjectList) {
						if (cXMLDoc.AttributeToBool(aUpdateDataNode, "Null"))
							aDataObject[aFinalKey] = System.DBNull.Value;
						else
							aDataObject[aFinalKey] = cXMLDoc.AttributeToString(aUpdateDataNode, "Value");
						aDataObject.SaveData();
					}
				}
			}
		}

		/*----------------------------------------------------*/

		public void RaiseEvent(int aEventID, int aUserID, cDataObjectList aEventDataObjectList) {
			if (aEventDataObjectList[0] != null)
				aEventDataObjectList[0].RaiseEvent(aEventID, aUserID);
		}
		
		/*----------------------------------------------------*/

		public void RaiseSingleEvent(int aEventID, int aUserID, cDataObjectList aEventDataObjectList) {
			RaiseSingleEvent(aEventID, aUserID, aEventDataObjectList, "");
		}

		/*----------------------------------------------------*/

		public void RaiseSingleEvent(int aEventID, int aUserID, cDataObjectList aEventDataObjectList, string aRcptPersonIDPropertyKey) {
			if (aEventDataObjectList[0] != null) {
				if (aRcptPersonIDPropertyKey != "") {
					aEventDataObjectList[0].RaiseSingleEvent(aEventID, aUserID, aRcptPersonIDPropertyKey);
				} else {
					aEventDataObjectList[0].RaiseSingleEvent(aEventID, aUserID);
				}
			}
		}

		/*----------------------------------------------------*/

		protected cDataObjectList GetEvents(ProcessType aProcessType, WorkflowEventType aWorkflowEventType)
		{
			cXMLDoc aXmlDoc;
			XmlNode aDataObjectNode, aFiltersNode, aSortNode;
			string aWfProjectTaskID = "";
			//if (aProcessType == ProcessType.PreAssignment) {
			//    cDataObject aGranteeProjectDO = this.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", this.GetPropertyString("GranteeProjectID"));
			//    cDataObjectList aWfProjectTaskDOL = this.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", aGranteeProjectDO.GetPropertyString("WfProjectID"), "WfTaskID", this.GetPropertyString("WfTaskID"));
			//    if (aWfProjectTaskDOL != null && aWfProjectTaskDOL.Count > 0)
			//        aWfProjectTaskID = aWfProjectTaskDOL[0].GetPropertyString("WfProjectTaskID");
			//}
			//else {
			//    aWfProjectTaskID = this.GetWfProjectTask().GetPropertyString("WfProjectTaskID");
			//}
			cDataObject aGranteeProjectDO = this.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", this.GetPropertyString("GranteeProjectID"));
			cDataObjectList aWfProjectTaskDOL = this.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", aGranteeProjectDO.GetPropertyString("WfProjectID"), "WfTaskID", this.GetPropertyString("WfTaskID"));
			if (aWfProjectTaskDOL != null && aWfProjectTaskDOL.Count > 0)
				aWfProjectTaskID = aWfProjectTaskDOL[0].GetPropertyString("WfProjectTaskID");
			
			aXmlDoc = this.DataObjectFactory.CreateDataObjectNode("WorkflowEvents", out aDataObjectNode, out aFiltersNode);
			aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ProcessTypeID", Convert.ToString((Int32)aProcessType)));
			aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowEventTypeID", Convert.ToString((Int32)aWorkflowEventType)));
			aFiltersNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowID", aWfProjectTaskID));
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode());
			aSortNode.AppendChild(this.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""));
			return this.DataObjectFactory.GetDataObjectList(aDataObjectNode);
		}

		/*----------------------------------------------------*/
		
		protected Boolean GetEventsProcessingResult(ProcessType aProcessType, WorkflowEventType aWorkflowEventType)
		{
			cDataObjectList aWorkflowEventsDOL = GetEvents(aProcessType, aWorkflowEventType);
			Boolean aProcessSuccess = true;
			string aFilterName = "";
			foreach (cDataObject aWorkflowEventsDO in aWorkflowEventsDOL) {
				cProcessingEvent aProcessingEvent;
				string aProcessDefinitionKey = aWorkflowEventsDO.GetRelatedPropertyString("EventManagerEvents.ProcessName");
				aProcessingEvent = cProcessingEvent.CreateProcessingEventInstance(aProcessDefinitionKey, this.DataObjectFactory);
				if (aProcessType == ProcessType.PreAssignment) {
					aFilterName = "GranteeProjectID";
				}
		        else {
					aFilterName = "WfTaskAssignmentID";
				}
				aProcessingEvent.ProcessEvent(aFilterName, this.GetPropertyString(aFilterName));
				if (aProcessingEvent.StatusID < 1) {
					aProcessSuccess = false;
					break;
				}
			}
			return aProcessSuccess;
		}

		/*====================================================*/
	}//cWfTaskAssignment

}// EasyGrants.Workflow
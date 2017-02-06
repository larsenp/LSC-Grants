Imports System.Xml
Imports Core.DataAccess
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.ApplReview.Controls.Page

	Public Class cValidationSections
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected txtValidation As cTextArea
		Protected mXDoc As XmlDocument
		Protected mDocEl As XmlElement

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			txtValidation = Me.GetControl("txtValidation")
			BuildXML()
		End Sub

		Public Sub BuildXML()
			Dim aList As cDataObjectList = DataObjectCollection("Inquiry")
			Dim aObj As cDataObject
			Dim aPA As Integer = 0

			Dim aCrit As String = ""
			Dim aInq As String = ""
			mXDoc = New XmlDocument()
			mDocEl = mXDoc.CreateElement("DocElement")
			mXDoc.AppendChild(mDocEl)
			Dim aSectionEl As XmlElement
			Dim aItemEl As XmlElement
			For Each aObj In aList
				If aObj.GetRelatedPropertyString("LscReviewCriterion.LscReviewPerformanceArea.SortOrder") <> aPA Then
					aPA = aObj.GetRelatedPropertyString("LscReviewCriterion.LscReviewPerformanceArea.SortOrder")
				End If
				If aObj.GetRelatedPropertyString("LscReviewCriterion.Abbr") <> aCrit Then
					aCrit = aObj.GetRelatedPropertyString("LscReviewCriterion.Abbr")
				End If
				aInq = aObj.GetPropertyString("Abbr")
				aSectionEl = CreateSectionEl(aPA, aCrit, aInq)
				mDocEl.AppendChild(aSectionEl)
				txtValidation.Value = mXDoc.DocumentElement.OuterXml
			Next

		End Sub

		Public Function CreateSectionEl(ByVal aPA As Integer, ByVal aCrit As String, ByVal aInq As String) As XmlElement
			Dim aItemEl As XmlElement
			Dim aEl As XmlElement = mXDoc.CreateElement("ValidationSection")
			Dim aKey As String = "PA" + aPA.ToString + "C" + aCrit.ToString + "Q" + aInq
			Dim aAtt As XmlAttribute = mXDoc.CreateAttribute("Key")
			aAtt.Value = aKey
			aEl.Attributes.Append(aAtt)

			aAtt = mXDoc.CreateAttribute("DisplayName")
			aAtt.Value = "PA" + aPA.ToString + ", C" + aCrit.ToString + ", Q #" + aInq
			aEl.Attributes.Append(aAtt)

			aAtt = mXDoc.CreateAttribute("PageKey")
			aAtt.Value = aKey
			aEl.Attributes.Append(aAtt)

			'Required score validation item
			aItemEl = CreateRequiredScoreEl(aPA, aCrit, aInq)
			aEl.AppendChild(aItemEl)


			'Low score validation item
			aItemEl = CreateCommentRequiredEl(aPA, aCrit, aInq, "2", "LessThanEqual", "Score is 2.0 or below. Comment is required.")
			aEl.AppendChild(aItemEl)

			'High score validation item
			aItemEl = CreateCommentRequiredEl(aPA, aCrit, aInq, "4", "GreaterThanEqual", "Score is 4.0 or higher. Comment is required.")
			aEl.AppendChild(aItemEl)

			Return aEl
		End Function

		Private Function CreateRequiredScoreEl(ByVal aPA As Integer, ByVal aCrit As String, ByVal aInq As String) As XmlElement
			Dim aAtt As XmlAttribute
			Dim aEl As XmlElement = mXDoc.CreateElement("ValidationItem")
			'Requirement element
			Dim aReqEl As XmlElement = mXDoc.CreateElement("Requirement")
			aEl.AppendChild(aReqEl)

			'Property key attribute
			aAtt = mXDoc.CreateAttribute("PropertyKey")
			aAtt.Value = "LscReviewAssignmentInquiry"
			aReqEl.Attributes.Append(aAtt)

			'Filters element
			Dim aFiltersEl As XmlElement = mXDoc.CreateElement("Filters")
			aReqEl.AppendChild(aFiltersEl)

			aFiltersEl.AppendChild(CreatePAFilterArgumentEl(aPA))
			aFiltersEl.AppendChild(CreateCritFilterArgumentEl(aCrit))
			aFiltersEl.AppendChild(CreateInqFilterArgumentEl(aInq))

			Dim aArgEl As XmlElement = mXDoc.CreateElement("Argument")
			aFiltersEl.AppendChild(aArgEl)
			aAtt = mXDoc.CreateAttribute("PropertyKey")
			aAtt.Value = "LscReviewInquiryScoreID"
			aArgEl.Attributes.Append(aAtt)
			aAtt = mXDoc.CreateAttribute("Value")
			aAtt.Value = ""
			aArgEl.Attributes.Append(aAtt)
			aAtt = mXDoc.CreateAttribute("Operator")
			aAtt.Value = "NotEqual"
			aArgEl.Attributes.Append(aAtt)

			'Results element
			Dim aResultsEl As XmlElement = mXDoc.CreateElement("Results")
			aEl.AppendChild(aResultsEl)
			Dim aResultEl As XmlElement = mXDoc.CreateElement("Result")
			aResultsEl.AppendChild(aResultEl)
			AddAttribute(aResultEl, "ResultCode", "3")
			AddAttribute(aResultEl, "Message", "You must provide a score for this inquiry.")
			AddAttribute(aResultEl, "MaxCount", "0")
			Return aEl
		End Function

		Private Function CreateCommentRequiredEl(ByVal aPA As Integer, ByVal aCrit As String, ByVal aInq As String, ByVal aScore As String, _
					ByVal aOperator As String, ByVal aMessage As String) As XmlElement

			Dim aEl As XmlElement = mXDoc.CreateElement("ValidationItem")
			'Requirement element
			Dim aReqEl As XmlElement = mXDoc.CreateElement("Requirement")
			aEl.AppendChild(aReqEl)
			AddAttribute(aReqEl, "PropertyKey", "LscReviewAssignmentInquiry")

				'Filters element
				Dim aFiltersEl As XmlElement = mXDoc.CreateElement("Filters")
				aReqEl.AppendChild(aFiltersEl)

				aFiltersEl.AppendChild(CreatePAFilterArgumentEl(aPA))
				aFiltersEl.AppendChild(CreateCritFilterArgumentEl(aCrit))
				aFiltersEl.AppendChild(CreateInqFilterArgumentEl(aInq))

					'Score argument
					Dim aArgEl As XmlElement = mXDoc.CreateElement("Argument")
					aFiltersEl.AppendChild(aArgEl)
					AddAttribute(aArgEl, "PropertyKey", "Value")
					AddAttribute(aArgEl, "Value", aScore)
					AddAttribute(aArgEl, "Operator", aOperator)
					Dim aRPEl As XmlElement = mXDoc.CreateElement("RelatedProperty")
					aArgEl.AppendChild(aRPEl)
					AddAttribute(aRPEl, "PropertyKey", "LscReviewInquiryScore")

					'Comment argument
					aArgEl = mXDoc.CreateElement("Argument")
					aFiltersEl.AppendChild(aArgEl)
					AddAttribute(aArgEl, "PropertyKey", "Comment")
					AddAttribute(aArgEl, "Value", "")

			'Results element
			Dim aResultsEl As XmlElement = mXDoc.CreateElement("Results")
			aEl.AppendChild(aResultsEl)
			Dim aResultEl As XmlElement = mXDoc.CreateElement("Result")
			aResultsEl.AppendChild(aResultEl)
			AddAttribute(aResultEl, "ResultCode", "3")
			AddAttribute(aResultEl, "Message", aMessage)
			AddAttribute(aResultEl, "MinCount", "1")

			Return aEl
		End Function

		Private Function CreatePAFilterArgumentEl(ByVal aPA As Integer) As XmlElement
			Dim aAtt As XmlAttribute
			Dim aEl As XmlElement = mXDoc.CreateElement("Argument")
			aAtt = mXDoc.CreateAttribute("PropertyKey")
			aAtt.Value = "SortOrder"
			aEl.Attributes.Append(aAtt)
			aAtt = mXDoc.CreateAttribute("Value")
			aAtt.Value = aPA.ToString
			aEl.Attributes.Append(aAtt)

			Dim aRelEl As XmlElement = mXDoc.CreateElement("RelatedProperty")
			aEl.AppendChild(aRelEl)
			aAtt = mXDoc.CreateAttribute("PropertyKey")
			aAtt.Value = "LscReviewInquiry.LscReviewCriterion.LscReviewPerformanceArea"
			aRelEl.Attributes.Append(aAtt)

			Return aEl
		End Function

		Private Function CreateCritFilterArgumentEl(ByVal aCrit As String) As XmlElement
			Dim aAtt As XmlAttribute
			Dim aEl As XmlElement = mXDoc.CreateElement("Argument")
			aAtt = mXDoc.CreateAttribute("PropertyKey")
			aAtt.Value = "Abbr"
			aEl.Attributes.Append(aAtt)
			aAtt = mXDoc.CreateAttribute("Value")
			aAtt.Value = aCrit
			aEl.Attributes.Append(aAtt)

			Dim aRelEl As XmlElement = mXDoc.CreateElement("RelatedProperty")
			aEl.AppendChild(aRelEl)
			aAtt = mXDoc.CreateAttribute("PropertyKey")
			aAtt.Value = "LscReviewInquiry.LscReviewCriterion"
			aRelEl.Attributes.Append(aAtt)

			Return aEl
		End Function

		Private Function CreateInqFilterArgumentEl(ByVal aInq As String) As XmlElement
			Dim aAtt As XmlAttribute
			Dim aEl As XmlElement = mXDoc.CreateElement("Argument")
			aAtt = mXDoc.CreateAttribute("PropertyKey")
			aAtt.Value = "Abbr"
			aEl.Attributes.Append(aAtt)
			aAtt = mXDoc.CreateAttribute("Value")
			aAtt.Value = aInq
			aEl.Attributes.Append(aAtt)

			Dim aRelEl As XmlElement = mXDoc.CreateElement("RelatedProperty")
			aEl.AppendChild(aRelEl)
			aAtt = mXDoc.CreateAttribute("PropertyKey")
			aAtt.Value = "LscReviewInquiry"
			aRelEl.Attributes.Append(aAtt)

			Return aEl
		End Function

		Private Function AddAttribute(ByVal aEl As XmlElement, ByVal aName As String, ByVal aValue As String) As XmlAttribute
			Dim aAtt As XmlAttribute = mXDoc.CreateAttribute(aName)
			aAtt.Value = aValue
			aEl.Attributes.Append(aAtt)
			Return aAtt
		End Function
	End Class



End Namespace

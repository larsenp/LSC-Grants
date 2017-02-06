Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Implementation.Modules.TIG_LOI_Review.Forms

Public Class cScoresandCritiques_TIGLOIReview_OPP
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Public Overrides Sub DataPresenter_SaveDataObject(ByVal aDataObjectElement As XmlElement)
		MyBase.DataPresenter_SaveDataObject(aDataObjectElement)
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key", "") = "LscTigLoiReviewOpp" Then
			SetReviewScore()
		End If
	End Sub

	Protected Overridable Sub SetReviewScore()
		Dim aWfTA As cDataObject = DataObjectCollection("ReviewWfTA")(0)
		Dim aReview As cDataObject = DataObjectCollection("LscTigLoiReviewOpp")(0)
		If aWfTA Is Nothing Or aReview Is Nothing Then Exit Sub
		Dim aWfTaskID As Integer = aWfTA.GetPropertyInt("WfTaskID", 0)
		Dim aScore As Double = CalculateReviewScore(aReview, aWfTaskID)
		aWfTA("ReviewRating") = aScore
		aWfTA.SaveData()
	End Sub

	Protected Overridable Function CalculateReviewScore(ByVal aReview As cDataObject, ByVal aWfTaskID As Integer) As Double
		Dim aScore As Double = 0
		Dim aWeightingsEl As XmlElement = mXMLDoc.DocElement.SelectSingleNode("Weightings")
		Select Case aWfTaskID
			Case 39	'Open/Replication/Website Improvement
				aScore += aReview.GetPropertyDouble("ProjectDescriptionScore", 0) * cXMLDoc.AttributeToInt(aWeightingsEl.SelectSingleNode("Weighting[@Key='ProjectDescription']"), "Value", 0) / 100
				aScore += aReview.GetPropertyDouble("BenefitsScore", 0) * cXMLDoc.AttributeToInt(aWeightingsEl.SelectSingleNode("Weighting[@Key='Benefits']"), "Value", 0) / 100
				aScore += aReview.GetPropertyDouble("CostsScore", 0) * cXMLDoc.AttributeToInt(aWeightingsEl.SelectSingleNode("Weighting[@Key='Costs']"), "Value", 0) / 100
				aScore += aReview.GetPropertyDouble("PartnersScore", 0) * cXMLDoc.AttributeToInt(aWeightingsEl.SelectSingleNode("Weighting[@Key='Partners']"), "Value", 0) / 100
				aScore += aReview.GetPropertyDouble("InnovationScore", 0) * cXMLDoc.AttributeToInt(aWeightingsEl.SelectSingleNode("Weighting[@Key='Innovation']"), "Value", 0) / 100
			Case 40	'Continuation/Renewal
				aScore += aReview.GetPropertyDouble("PrevWebSiteGrantsScore", 0) * cXMLDoc.AttributeToInt(aWeightingsEl.SelectSingleNode("Weighting[@Key='PrevWebSiteGrants']"), "Value", 0) / 100
				aScore += aReview.GetPropertyDouble("NonWebSiteGrantsScore", 0) * cXMLDoc.AttributeToInt(aWeightingsEl.SelectSingleNode("Weighting[@Key='NonWebSiteGrants']"), "Value", 0) / 100
				aScore += aReview.GetPropertyDouble("AddlInfoScore", 0) * cXMLDoc.AttributeToInt(aWeightingsEl.SelectSingleNode("Weighting[@Key='AddlInfo']"), "Value", 0) / 100

		End Select
		Return aScore
	End Function

End Class

End Namespace
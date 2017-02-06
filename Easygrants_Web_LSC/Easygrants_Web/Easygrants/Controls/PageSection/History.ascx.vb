Imports System.Xml
Imports System.Diagnostics
Imports Core_Web.Controls.Base
Imports System.Reflection
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Namespace Easygrants_Web.Controls.PageSection
    Public Class cHistory
        Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

        Protected SpnCreatedBy As HtmlGenericControl
        Protected SpnCreatedDate As HtmlGenericControl
        Protected SpnModifiedBy As HtmlGenericControl
        Protected SpnModifyDate As HtmlGenericControl

        Private mDataObjectID As String
        Private mQueryStringKey As String
        Private mQueryStringValue As String
        Private mSecondQueryStringKey As String
        Private mSecondQueryStringValue As String
        Private mIsPrimaryKey As Boolean

        Public Property DataObjectDefinitionKey() As String
            Get
                Return mDataObjectID
            End Get
            Set(ByVal Value As String)
                mDataObjectID = Value
            End Set
        End Property
        '-------------------------------------------------------------
        Public Property QueryStringKey() As String
            Get
                Return mQueryStringKey
            End Get
            Set(ByVal Value As String)
                mQueryStringKey = Value
            End Set
        End Property
        '-------------------------------------------------------------
        Public Property SecondQueryStringKey() As String
            Get
                Return mSecondQueryStringKey
            End Get
            Set(ByVal Value As String)
                mSecondQueryStringKey = Value
            End Set
        End Property
        '-------------------------------------------------------------
        Public Property IsPrimaryKey() As Boolean
            Get
                Return mIsPrimaryKey
            End Get
            Set(ByVal Value As Boolean)
                mIsPrimaryKey = Value
            End Set
        End Property
        '-------------------------------------------------------------
        Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)


            mQueryStringValue = Request.QueryString(QueryStringKey)

            If IsPrimaryKey = True Then
                Dim aHistoryData As cDataObject
                aHistoryData = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey(DataObjectDefinitionKey, mQueryStringValue)
                If Not aHistoryData Is Nothing AndAlso Not aHistoryData.IsNewDataObject Then
                    SpnCreatedBy.InnerHtml = aHistoryData.GetRelatedPropertyString("CreatedByUser.Person.LastNameFirstName")
                    If Not aHistoryData.GetPropertyValue("CreateDate") Is System.DBNull.Value Then
						SpnCreatedDate.InnerHtml = String.Format("{0:d}", aHistoryData.GetPropertyDateTime("CreateDate"))
					End If
                    SpnModifiedBy.InnerHtml = aHistoryData.GetRelatedPropertyString("ModifiedByUser.Person.LastNameFirstName")
                    If Not aHistoryData.GetPropertyValue("ModifyDate") Is System.DBNull.Value Then
						SpnModifyDate.InnerHtml = String.Format("{0:d}", aHistoryData.GetPropertyDateTime("ModifyDate"))
					End If
                End If
            Else
                Dim aHistoryData As cDataObjectList
                mSecondQueryStringValue = Request.QueryString(SecondQueryStringKey)
				If mSecondQueryStringValue Is Nothing Then
					aHistoryData = WebSession.DataObjectFactory.GetDataObjectListWithFilter(DataObjectDefinitionKey, QueryStringKey, mQueryStringValue)
				Else
					aHistoryData = WebSession.DataObjectFactory.GetDataObjectListWithFilter(DataObjectDefinitionKey, QueryStringKey, mQueryStringValue, SecondQueryStringKey, mSecondQueryStringValue)
				End If

                If aHistoryData.Count > 0 Then
                    SpnCreatedBy.InnerHtml = aHistoryData(0).GetRelatedPropertyString("CreatedByUser.Person.LastNameFirstName")
                    SpnModifiedBy.InnerHtml = aHistoryData(0).GetRelatedPropertyString("ModifiedByUser.Person.LastNameFirstName")
                    If Not aHistoryData(0).GetPropertyValue("CreateDate") Is System.DBNull.Value Then
                        SpnCreatedDate.InnerHtml = String.Format("{0:d}", aHistoryData(0).GetPropertyDateTime("CreateDate"))
                    End If
                    If Not aHistoryData(0).GetPropertyValue("ModifyDate") Is System.DBNull.Value Then
                        SpnModifyDate.InnerHtml = String.Format("{0:d}", aHistoryData(0).GetPropertyDateTime("ModifyDate"))
                    End If
                End If

            End If

        End Sub

    End Class
End Namespace
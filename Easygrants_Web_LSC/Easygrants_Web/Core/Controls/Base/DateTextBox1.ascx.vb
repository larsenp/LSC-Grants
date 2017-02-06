Imports System.Xml
Imports Core.Web
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess

Namespace Core_Web.Controls.Base

    '<ValidationPropertyAttribute("TextBox")> 
    Public MustInherit Class cDateTextBox1
        Inherits Core.Web.cCoreCtl

        Protected txt_Date As TextBox
        Private mDisplayPropertyNode As XmlNode
        Private mDate As Date

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

            CorePage.CorePage_RegisterScriptBlock("../../../Core/Includes/popcalendar.js", _
                     "DateTextBox1")
        End Sub

        Public Overrides Sub CoreCtl_SetDataObjectValueFromCtl(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObject As cDataObject)
            Dim aColName As String = aDisplayPropertyNode.SelectSingleNode("@PropertyKey").Value
            aDataObject(aColName) = myDate
        End Sub

        '----------------------------------------------------

        Public Overrides Property DisplayPropertyNode() As XmlNode
            Get
                DisplayPropertyNode = mDisplayPropertyNode
            End Get
            Set(ByVal Value As XmlNode)
                mDisplayPropertyNode = Value
            End Set
        End Property

        Public Overrides Sub CoreCtl_Configure(ByVal aDisplayPropertyNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
            DisplayPropertyNode = aDisplayPropertyNode
        End Sub


        Public Property myDate() As Object
            Get
                'myDate = mDate
                'Changed 8/4/2003 to allow for saving of updated text box value as date
                'Don't know what other consequences this might have.
                'If this is the way to go, should we store the date as a member variable?
                'Peter Larsen
                If txt_Date.Text.Trim() <> "" Then
                    'myDate = DateTime.Parse(txtDate.Value)
                    Try
                        myDate = DateTime.Parse(txt_Date.Text)
                    Catch exFormat As FormatException
                        Dim err As String = exFormat.Message
                    End Try
                Else
                    myDate = System.DBNull.Value
                End If
            End Get
            Set(ByVal Value As Object)
                mDate = Value

            End Set
        End Property


    End Class

    

    '----------------------
End Namespace

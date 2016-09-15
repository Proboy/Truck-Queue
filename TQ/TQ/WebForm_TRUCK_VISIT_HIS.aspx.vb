Public Class WebForm_TRUCK_VISIT_HIS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub EF_TRUCK_VISIT_HIS_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles EF_TRUCK_VISIT_HIS.Selecting
        e.KeyExpression = "TRUCK_VISIT_HIS_ID"
    End Sub

    Protected Sub EF_TRUCK_VISIT_HIS_Inserting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles EF_TRUCK_VISIT_HIS.Inserting
        ' Insert Statement 
        Using db As New Entities_ConnStr()

            db.TQ_TRUCK_VISIT_HIS.Add(New TQ_TRUCK_VISIT_HIS() With {
            .TRUCK_VISIT_NO = e.Values("TRUCK_VISIT_NO"),
            .TERMINAL_ID = e.Values("TERMINAL_ID"),
            .SUB_GATE_NO = e.Values("SUB_GATE_NO"),
            .TRUCK_VISIT_DATE = e.Values("TRUCK_VISIT_DATE"),
            .TRUCK_ID = e.Values("TRUCK_ID"),
            .START_TIME = e.Values("START_TIME"),
            .END_TIME = e.Values("END_TIME"),
            .CREATED_BY = 0,
            .CREATED_DATE = Now})

            db.SaveChanges()

        End Using
        e.Handled = True
    End Sub

    Protected Sub EF_TRUCK_VISIT_HIS_Updating(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles EF_TRUCK_VISIT_HIS.Updating
        ' Create new entities from Entities
        Using db = New Entities_ConnStr()
            ' Update CUSTOMER
            Dim vKey As String = e.Keys(ASPxGridView1.KeyFieldName)

            ' Update Statement
            Dim update = (From c In db.TQ_TRUCK_VISIT_HIS Where c.TRUCK_VISIT_HIS_ID = vKey
                          Select c).FirstOrDefault()
            If update IsNot Nothing Then
                update.TRUCK_VISIT_NO = e.Values("TRUCK_VISIT_NO")
                update.TERMINAL_ID = e.Values("TERMINAL_ID")
                update.SUB_GATE_NO = e.Values("SUB_GATE_NO")
                update.TRUCK_VISIT_DATE = e.Values("TRUCK_VISIT_DATE")
                update.TRUCK_ID = e.Values("TRUCK_ID")
                update.START_TIME = e.Values("START_TIME")
                update.END_TIME = e.Values("END_TIME")
                update.CREATED_BY = 0
                update.CREATED_DATE = Now
            End If

            db.SaveChanges()
        End Using
        e.Handled = True
    End Sub

    Protected Sub EF_TRUCK_VISIT_HIS_Deleting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles EF_TRUCK_VISIT_HIS.Deleting
        ' Create new entities from Entities
        Using db = New Entities_ConnStr()
            ' Update CUSTOMER
            Dim vKey As String = e.Keys(ASPxGridView1.KeyFieldName)

            ' Delete CUSTOMER
            Dim del = db.TQ_TRUCK_VISIT_HIS.Where(Function(o) o.TRUCK_VISIT_HIS_ID = vKey).FirstOrDefault()
            If Not IsNothing(del) Then
                db.TQ_TRUCK_VISIT_HIS.Remove(del)
            End If
            db.SaveChanges()

        End Using
        e.Handled = True
    End Sub

    Protected Sub ASPxGridView1_RowDeleting(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles ASPxGridView1.RowDeleting
        Me.ASPxGridView1.CancelEdit()
    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting
        Me.ASPxGridView1.CancelEdit()
    End Sub

    Protected Sub ASPxGridView1_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating
        Me.ASPxGridView1.CancelEdit()
    End Sub


    'Protected Sub ASPxUploadControl1_FilesUploadComplete(ByVal sender As Object, ByVal e As DevExpress.Web.FilesUploadCompleteEventArgs)
    '    ' Intentionally pauses server-side processing to demonstrate the Loading Panel or Progress Panel functionality
    '    System.Threading.Thread.Sleep(2000)

    '    Dim uploadControl As ASPxUploadControl = TryCast(sender, ASPxUploadControl)

    '    If uploadControl.UploadedFiles IsNot Nothing AndAlso uploadControl.UploadedFiles.Length > 0 Then
    '        For i As Integer = 0 To uploadControl.UploadedFiles.Length - 1
    '            Dim file As UploadedFile = uploadControl.UploadedFiles(i)
    '            If file.FileName <> "" Then
    '                Dim fileName As String = String.Format("{0}{1}", MapPath("~/Images/"), file.FileName)
    '                'file.SaveAs(fileName, True)'OnLine Demo Restriction
    '            End If
    '        Next i
    '    End If
    'End Sub
End Class
Public Class WebForm_Quota_Management
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub EF_Quata_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles EF_Quata.Selecting
        e.KeyExpression = "QUOTA_ID"
    End Sub

    Protected Sub EF_Quata_Inserting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles EF_Quata.Inserting
        ' Insert Statement 
        Using db As New Entities_ConnStr()

            db.TQ_TR_QUOTA.Add(New TQ_TR_QUOTA() With {
            .QUOTA_DATE = e.Values("QUOTA_DATE"),
            .OPERATOR_TYPE = e.Values("OPERATOR_TYPE"),
            .START_TIME = e.Values("START_TIME"),
            .END_TIME = e.Values("END_TIME"),
            .QTY = e.Values("QTY"),
            .CREATED_BY = 0,
            .CREATED_DATE = Now})

            db.SaveChanges()

        End Using
        e.Handled = True
    End Sub

    Protected Sub EF_Quata_Deleting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles EF_Quata.Deleting

        ' Create new entities from Entities
        Using db = New Entities_ConnStr()
            ' Update CUSTOMER
            Dim vKey As String = e.Keys(ASPxGridView1.KeyFieldName)


            ' Find Statement
            Dim find = (From c In db.TQ_TR_QUOTA Where c.RES_QTY = 0 Select c).FirstOrDefault()
            If Not IsNothing(find) Then
                ' Delete CUSTOMER
                Dim del = db.TQ_TR_QUOTA.Where(Function(o) o.QUOTA_ID = vKey).FirstOrDefault()
                If Not IsNothing(del) Then
                    db.TQ_TR_QUOTA.Remove(del)
                End If
                db.SaveChanges()
            Else
                'ClientScript.RegisterClientScriptBlock(Me.GetType(), "PopupScript", "<script>alert('กหด้่หกสาดสากหด');</script>")



            End If

        End Using
        e.Handled = True
    End Sub

    Protected Sub EF_Quata_Updating(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles EF_Quata.Updating
        ' Create new entities from Entities
        Using db = New Entities_ConnStr()
            ' Update CUSTOMER
            Dim vKey As String = e.Keys(ASPxGridView1.KeyFieldName)

            ' Update Statement
            Dim update = (From c In db.TQ_TR_QUOTA Where c.QUOTA_ID = vKey
                          Select c).FirstOrDefault()
            If update IsNot Nothing Then
                update.QUOTA_DATE = e.Values("QUOTA_DATE")
                update.OPERATOR_TYPE = e.Values("OPERATOR_TYPE")
                update.START_TIME = e.Values("START_TIME")
                update.END_TIME = e.Values("END_TIME")
                update.QTY = e.Values("QTY")
                update.UPDATED_BY = 0
                update.UPDATED_DATE = Now
            End If

            db.SaveChanges()
        End Using
        e.Handled = True

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting
        ASPxGridView1.CancelEdit()
    End Sub

    Protected Sub ASPxGridView1_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating
        ASPxGridView1.CancelEdit()
    End Sub


    Protected Sub EF_Quata_Load(sender As Object, e As EventArgs) Handles EF_Quata.Load
        '' Create new entities Object
        'Using db = New Entities_ConnStr()
        '    ' Get data 
        '    Dim ds = (From c In db.TQ_TR_QUOTA Select c Where c.IS_DELETED = "F").ToList()

        '    ' Assign to DataGridView
        '    If ds.Count() > 0 Then
        '        ASPxGridView1.DataSource = ""
        '        ASPxGridView1.DataSourceID = ""
        '        ASPxGridView1.DataSource = ds
        '        ASPxGridView1.DataBind()
        '    End If

        'End Using
    End Sub

End Class
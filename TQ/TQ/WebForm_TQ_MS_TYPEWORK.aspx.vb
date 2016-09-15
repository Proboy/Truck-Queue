Public Class WebForm_TQ_MS_TYPEWORK
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub EntityServerModeDataSource_Tq_TypeWork_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles EntityServerModeDataSource_Tq_TypeWork.Selecting
        e.KeyExpression = "ID"
    End Sub

    Protected Sub EntityServerModeDataSource_Tq_TypeWork_Inserting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles EntityServerModeDataSource_Tq_TypeWork.Inserting

        ' Insert Statement 
        Using db As New Entities_ConnStr()

            db.TQ_MS_TYPEWORK.Add(New TQ_MS_TYPEWORK() With {
            .CODE = e.Values("CODE"),
            .NAME = e.Values("NAME")})

            db.SaveChanges()

        End Using
        e.Handled = True

    End Sub

    Protected Sub EntityServerModeDataSource_Tq_TypeWork_Updating(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles EntityServerModeDataSource_Tq_TypeWork.Updating

        ' Create new entities from Entities
        Using db = New Entities_ConnStr()
            ' Update CUSTOMER
            Dim vKey As String = e.Keys(ASPxGridView1.KeyFieldName)

            ' Update Statement
            Dim update = (From c In db.TQ_MS_TYPEWORK Where c.ID = vKey
                          Select c).FirstOrDefault()
            If update IsNot Nothing Then
                update.CODE = e.Values("CODE")
                update.NAME = e.Values("NAME")
            End If

            db.SaveChanges()
        End Using
        e.Handled = True

    End Sub

    Protected Sub EntityServerModeDataSource_Tq_TypeWork_Deleting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles EntityServerModeDataSource_Tq_TypeWork.Deleting

        ' Create new entities from Entities
        Using db = New Entities_ConnStr()
            ' Delete CUSTOMER
            Dim vKey As String = e.Keys(ASPxGridView1.KeyFieldName)

            ' Delete CUSTOMER
            Dim del = (From c In db.TQ_MS_TYPEWORK Where c.ID = vKey
                       Select c).FirstOrDefault()
            If Not IsNothing(del) Then
                db.TQ_MS_TYPEWORK.Remove(del)
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

End Class
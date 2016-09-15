Imports DevExpress.Web

Public Class WebForm_Driver_Info
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Not IsPostBack) Then

        Else
            UpdateData(ASPxGridView1, Me.ASPxComboBox1.Value)

        End If

    End Sub

    Protected Sub EF_Driver_info_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles EF_Driver_info.Selecting
        e.KeyExpression = "DRIVER_INFO_ID"
    End Sub

    Protected Sub ASPxGridView1_InitNewRow(sender As Object, e As Data.ASPxDataInitNewRowEventArgs) Handles ASPxGridView1.InitNewRow
        e.NewValues("TRANS_ID") = Me.ASPxComboBox1.Value
    End Sub


    Protected Sub ASPxGridView1_RowDeleting(sender As Object, e As Data.ASPxDataDeletingEventArgs) Handles ASPxGridView1.RowDeleting
        ' Create new entities from Entities
        Using db = New Entities_ConnStr()
            ' 
            Dim vKey As String = e.Keys(ASPxGridView1.KeyFieldName)

            ' Delete
            Dim del = (From c In db.TQ_MS_DRIVER_INFO Where c.DRIVER_INFO_ID = vKey Select c).FirstOrDefault
            If Not IsNothing(del) Then
                db.TQ_MS_DRIVER_INFO.Remove(del)
            End If
            db.SaveChanges()

        End Using

        UpdateData(ASPxGridView1, Me.ASPxComboBox1.Value)
        Me.ASPxGridView1.CancelEdit()
        e.Cancel = True

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        ' Insert Statement 
        Using db As New Entities_ConnStr()

            db.TQ_MS_DRIVER_INFO.Add(New TQ_MS_DRIVER_INFO() With {
            .TRANS_ID = e.NewValues("TRANS_ID"),
            .DRIVER_LICENSE = e.NewValues("DRIVER_LICENSE"),
            .DRIVER_NAME = e.NewValues("DRIVER_NAME"),
            .ADDRESS = e.NewValues("ADDRESS"),
            .TEL = e.NewValues("TEL"),
            .CREATED_BY = 0})

            db.SaveChanges()

        End Using

        UpdateData(ASPxGridView1, Me.ASPxComboBox1.Value)
        Me.ASPxGridView1.CancelEdit()
        e.Cancel = True

    End Sub

    Protected Sub ASPxGridView1_RowUpdating(sender As Object, e As Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating
        ' Create new entities from Entities
        Using db = New Entities_ConnStr()
            ' Update CUSTOMER
            Dim vKey As String = e.Keys(ASPxGridView1.KeyFieldName)

            ' Update Statement
            Dim update = (From c In db.TQ_MS_DRIVER_INFO Where c.DRIVER_INFO_ID = vKey Select c).FirstOrDefault()
            If update IsNot Nothing Then
                update.TRANS_ID = e.NewValues("TRANS_ID")
                update.DRIVER_LICENSE = e.NewValues("DRIVER_LICENSE")
                update.DRIVER_NAME = e.NewValues("DRIVER_NAME")
                update.ADDRESS = e.NewValues("ADDRESS")
                update.TEL = e.NewValues("TEL")
            End If

            db.SaveChanges()
        End Using

        UpdateData(ASPxGridView1, Me.ASPxComboBox1.Value)
        Me.ASPxGridView1.CancelEdit()
        e.Cancel = True

    End Sub

    Private Sub UpdateData(ByVal g As ASPxGridView, ByVal v As String)
        Using db As New Entities_ConnStr

            Dim vValue As String = v
            'find
            Dim find = (From c In db.TQ_MS_DRIVER_INFO Where c.TRANS_ID = vValue.ToString Select c).ToList()
            If Not IsNothing(find) Then

                g.DataSource = find
                g.DataBind()
                g.KeyFieldName = "DRIVER_INFO_ID"

            End If

        End Using

    End Sub

    Protected Sub ASPxGridView1_RowValidating(sender As Object, e As Data.ASPxDataValidationEventArgs) Handles ASPxGridView1.RowValidating

        Using db As New Entities_ConnStr

            Dim vNew As String = e.NewValues("DRIVER_LICENSE")
            Dim vOldd As String = e.OldValues("DRIVER_LICENSE")

            'Add
            If vNew = vOldd Then

            Else 'Edit
                'Find duplicate
                Dim ds = (From c In db.TQ_MS_DRIVER_INFO Where c.DRIVER_LICENSE = vNew Select c).FirstOrDefault()

                ' if found item rows
                If Not IsNothing(ds) Then

                    e.RowError = "เลขที่ใบอนุญาตขับขี่มีอยู่ในระบบแล้ว กรุณาตรวจสอบ."

                End If
            End If


        End Using

        '' Checks for null values.
        'For Each column As GridViewColumn In ASPxGridView1.Columns
        '    Dim dataColumn As GridViewDataColumn = TryCast(column, GridViewDataColumn)
        '    If Not dataColumn Is Nothing AndAlso (e.NewValues(dataColumn.FieldName) Is Nothing) Then
        '        e.Errors(dataColumn) = "Value cannot be null."
        '    End If
        'Next column
        '' Displays the error row if there is at least one error.
        'If e.Errors.Count > 0 Then
        'e.RowError = "Please, fill all fields."
        'End If

        'If Not e.NewValues("ContactName") Is Nothing AndAlso e.NewValues("ContactName").ToString().Length < 2 Then
        '    AddError(e.Errors, ASPxGridView1.Columns("ContactName"), "Contact Name must be at least two characters long.")
        'End If

        'If Not e.NewValues("CompanyName") Is Nothing AndAlso e.NewValues("CompanyName").ToString().Length < 2 Then
        '    AddError(e.Errors, ASPxGridView1.Columns("CompanyName"), "Company Name must be at least two characters long.")
        'End If

        'If String.IsNullOrEmpty(e.RowError) AndAlso e.Errors.Count > 0 Then
        '    e.RowError = "Please, correct all errors."
        'End If


    End Sub

End Class
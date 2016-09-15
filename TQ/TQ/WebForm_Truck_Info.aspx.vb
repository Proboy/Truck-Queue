Imports DevExpress.Web

Public Class WebForm_Truck
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then

        Else
            UpdateData(ASPxGridView1, Me.ASPxComboBox1.Value)

        End If
    End Sub

    Private Sub UpdateData(ByVal g As ASPxGridView, ByVal v As String)
        Using db As New Entities_ConnStr

            Dim vValue As String = v
            'find
            Dim find = (From c In db.TQ_MS_TRUCK_INFO Where c.COMPANY_ID = vValue.ToString Select c).ToList()
            If Not IsNothing(find) Then

                g.DataSource = find
                g.DataBind()
                g.KeyFieldName = "TRUCK_INFO_ID"

            End If

        End Using

    End Sub

    Protected Sub EntityServerModeDataSource1_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles EntityServerModeDataSource1.Selecting
        e.KeyExpression = "TRUCK_INFO_ID"
    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        Using db As New Entities_ConnStr
            ' Insert Statement 
            db.TQ_MS_TRUCK_INFO.Add(New TQ_MS_TRUCK_INFO() With {
            .COMPANY_ID = e.NewValues("COMPANY_ID"),
            .TRUCK_ID = e.NewValues("TRUCK_ID"),
            .PROVINCE = e.NewValues("PROVINCE"),
            .TRUCK_LICENSE = e.NewValues("TRUCK_LICENSE"),
            .TRUCK_TYPE = e.NewValues("TRUCK_TYPE"),
            .TRUCK_STATUS = e.NewValues("TRUCK_STATUS"),
            .EXPIRATION_DATE = e.NewValues("EXPIRATION_DATE"),
            .SAFE_WEIGHT = e.NewValues("SAFE_WEIGHT"),
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
            Dim update = (From c In db.TQ_MS_TRUCK_INFO Where c.TRUCK_INFO_ID = vKey Select c).FirstOrDefault()
            If update IsNot Nothing Then
                update.COMPANY_ID = e.NewValues("COMPANY_ID")
                update.TRUCK_ID = e.NewValues("TRUCK_ID")
                update.PROVINCE = e.NewValues("PROVINCE")
                update.TRUCK_LICENSE = e.NewValues("TRUCK_LICENSE")
                update.TRUCK_TYPE = e.NewValues("TRUCK_TYPE")
                update.TRUCK_STATUS = e.NewValues("TRUCK_STATUS")
                update.EXPIRATION_DATE = e.NewValues("EXPIRATION_DATE")
                update.SAFE_WEIGHT = e.NewValues("SAFE_WEIGHT")
            End If

            db.SaveChanges()
        End Using

        UpdateData(ASPxGridView1, Me.ASPxComboBox1.Value)
        Me.ASPxGridView1.CancelEdit()
        e.Cancel = True
    End Sub

    Protected Sub ASPxGridView1_RowDeleting(sender As Object, e As Data.ASPxDataDeletingEventArgs) Handles ASPxGridView1.RowDeleting
        ' Create new entities from Entities
        Using db = New Entities_ConnStr()
            ' 
            Dim vKey As String = e.Keys(ASPxGridView1.KeyFieldName)

            ' Delete
            Dim del = (From c In db.TQ_MS_TRUCK_INFO Where c.TRUCK_INFO_ID = vKey Select c).FirstOrDefault
            If Not IsNothing(del) Then
                db.TQ_MS_TRUCK_INFO.Remove(del)
            End If
            db.SaveChanges()

        End Using

        UpdateData(ASPxGridView1, Me.ASPxComboBox1.Value)
        Me.ASPxGridView1.CancelEdit()
        e.Cancel = True
    End Sub

    Protected Sub ASPxGridView1_InitNewRow(sender As Object, e As Data.ASPxDataInitNewRowEventArgs) Handles ASPxGridView1.InitNewRow
        e.NewValues("COMPANY_ID") = Me.ASPxComboBox1.Value
    End Sub

    Protected Sub ASPxGridView1_RowValidating(sender As Object, e As Data.ASPxDataValidationEventArgs) Handles ASPxGridView1.RowValidating

        Using db As New Entities_ConnStr

            Dim vNew As String = e.NewValues("TRUCK_ID")
            Dim vOldd As String = e.OldValues("TRUCK_ID")

            'Add
            If vNew = vOldd Then

            Else 'Edit
                'Find duplicate
                Dim ds = (From c In db.TQ_MS_TRUCK_INFO Where c.TRUCK_ID = vNew Select c).FirstOrDefault()

                ' if found item rows
                If Not IsNothing(ds) Then

                    e.RowError = "เลขทะเบียนรถบรรทุกมีอยู่ในระบบแล้ว กรุณาตรวจสอบ."

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

    Private Sub AddError(ByVal errors As Dictionary(Of GridViewColumn, String), ByVal column As GridViewColumn, ByVal errorText As String)
        If Not errors.ContainsKey(column) Then
            errors(column) = errorText
        End If
    End Sub

    'Protected Sub ASPxGridView1_StartRowEditing(sender As Object, e As Data.ASPxStartRowEditingEventArgs) Handles ASPxGridView1.StartRowEditing

    '    vOld = ASPxGridView1.GetRowValuesByKeyValue(e.EditingKeyValue, "TRUCK_ID").ToString()

    '    'If ASPxGridView1.GetRowValuesByKeyValue(e.EditingKeyValue, "TRUCK_ID").ToString() <> vOld Then
    '    '    e.Cancel = True
    '    'End If

    '    '' Validates the edited row if it isn't a new row,.
    '    'If (Not ASPxGridView1.IsNewRowEditing) Then
    '    '    ASPxGridView1.DoRowValidation()
    '    'End If

    'End Sub

End Class
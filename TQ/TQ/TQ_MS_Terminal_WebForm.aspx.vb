
Public Class TQ_MS_Terminal_WebForm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            Using db As New Entities_ConnStr

                'find running number
                Dim find = db.TQ_RN_RUNNUMBER.Where(Function(o) (o.RUNTYPE = "TR")).FirstOrDefault()
                If Not IsNothing(find) Then
                    Me.Terminal_CODE.Value = find.RUNCODE + (find.RUNNUMBER + 1).ToString("0000")
                End If

            End Using

            Me.Terminal_NAME.Focus()

            'ASPxFormLayout1.DataSource = ""
            'ASPxFormLayout1.DataBind()
        Else
            'If IsPostBack AndAlso captcha.IsValid AndAlso ASPxEdit.ValidateEditorsInContainer(Me) Then
            '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "<script type=""text/javascript"">alert('You have successfully registered');</script>")
            'End If

        End If

    End Sub

    Protected Sub ASPxFormLayout1_E2_Click(sender As Object, e As EventArgs) Handles ASPxFormLayout1_Button_OK.Click

        If Not Captcha.IsValid Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "<script type=""text/javascript"">alert('You have unsuccessfully registered');</script>")
            Captcha.Focus()
        Else
            Using db As New Entities_ConnStr

                'Update
                Dim ds = (From c In db.TQ_MS_TERMINAL Where c.TERMINAL_CODE = Terminal_CODE.Value.ToString Select c).FirstOrDefault()

                ' if found item rows
                If Not IsNothing(ds) Then

                    ClientScript.RegisterStartupScript(Me.GetType(), "PopupScript", "<script>alert('" + String.Format("รหัสท่าเรือ {0} ถูกใช้งานไปในระบบแล้ว.", Me.Terminal_CODE.Value) + "');</script>")

                Else 'Update
                    'find exsit user
                    Dim dse = (From c In db.TQ_MS_TERMINAL Where c.USER_NAME = USERNAME.Value.ToString Select c).FirstOrDefault()
                    ' if found item rows
                    If Not IsNothing(dse) Then
                        ClientScript.RegisterStartupScript(Me.GetType(), "PopupScript", "<script>alert('" + String.Format("ชื่อผู้ใช้งานในระบบ {0} ถูกใช้งานไปในระบบแล้ว.", Me.Terminal_CODE.Value) + "');</script>")

                        USERNAME.Focus()
                    Else
                        ' Update Running number Statement
                        Dim update_Run = (From c In db.TQ_RN_RUNNUMBER Where c.RUNTYPE = "TR" Select c).FirstOrDefault()
                        If update_Run IsNot Nothing Then
                            update_Run.RUNNUMBER += 1
                        End If

                        'Insert terminal
                        Dim insert = New TQ_MS_TERMINAL()
                        insert.TERMINAL_CODE = Terminal_CODE.Value
                        db.TQ_MS_TERMINAL.Add(insert)

                        db.SaveChanges()

                        Response.Redirect("WebForm_Success.aspx")
                    End If
                End If


            End Using
        End If



    End Sub

    Protected Sub Entity_Terminal_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles Entity_Terminal.Selecting
        e.KeyExpression = "TERMINAL_ID"
    End Sub

End Class
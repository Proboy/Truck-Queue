Public Class WebForm_Truck_Comp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            Using db As New Entities_ConnStr

                'find running number
                Dim find = db.TQ_RN_RUNNUMBER.Where(Function(o) (o.RUNTYPE = "TC")).FirstOrDefault()
                If Not IsNothing(find) Then
                    TRUCK_CODE.Value = find.RUNCODE + (find.RUNNUMBER + 1).ToString("0000")
                End If

            End Using

            TRUCK_NAME.Focus()

            'ASPxFormLayout1.DataSource = ""
            'ASPxFormLayout1.DataBind()
        Else
            'If IsPostBack AndAlso captcha.IsValid AndAlso ASPxEdit.ValidateEditorsInContainer(Me) Then
            '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "<script type=""text/javascript"">alert('You have successfully registered');</script>")
            'End If

        End If
    End Sub

    Protected Sub EF_TruckComp_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles EF_TruckComp.Selecting
        e.KeyExpression = "TRUCK_COMP_ID"
    End Sub


    Protected Sub ASPxFormLayout1_Button_OK_Click(sender As Object, e As EventArgs) Handles ASPxFormLayout1_Button_OK.Click
        If Not Captcha.IsValid Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "<script type=""text/javascript"">alert('You have unsuccessfully registered');</script>")
            Captcha.Focus()
        Else
            Using db As New Entities_ConnStr

                'Update
                Dim ds = (From c In db.TQ_MS_TRUCK_COMP Where c.TRUCK_CODE = TRUCK_CODE.Value.ToString Select c).FirstOrDefault()

                ' if found item rows
                If Not IsNothing(ds) Then

                    ClientScript.RegisterStartupScript(Me.GetType(), "PopupScript", "<script>alert('" + String.Format("รหัสผู้ประกอบขนส่ง {0} ถูกใช้งานไปในระบบแล้ว.", Me.TRUCK_CODE.Value) + "');</script>")

                Else 'Update
                    'find exsit user
                    Dim dse = (From c In db.TQ_MS_TRUCK_COMP Where c.USERNAME = USERNAME.Value.ToString Select c).FirstOrDefault()
                    ' if found item rows
                    If Not IsNothing(dse) Then
                        ClientScript.RegisterStartupScript(Me.GetType(), "PopupScript", "<script>alert('" + String.Format("ชื่อผู้ใช้งาน {0} ถูกใช้งานไปในระบบแล้ว.", Me.USERNAME.Value) + "');</script>")

                        USERNAME.Focus()
                    Else
                        ' Update Running number Statement
                        Dim update_Run = (From c In db.TQ_RN_RUNNUMBER Where c.RUNTYPE = "TC" Select c).FirstOrDefault()
                        If update_Run IsNot Nothing Then
                            update_Run.RUNNUMBER += 1
                        End If

                        'Insert
                        Dim insert = New TQ_MS_TRUCK_COMP()
                        insert.TRUCK_CODE = TRUCK_CODE.Value
                        insert.TRUCK_NAME = TRUCk_Name.Value
                        insert.USERNAME = USERNAME.Value
                        insert.PASSWORD = password.Value
                        insert.CONFIRMPASSWORD = confirmPassword.Value
                        db.TQ_MS_TRUCK_COMP.Add(insert)

                        db.SaveChanges()

                        Response.Redirect("WebForm_Success.aspx")
                    End If
                End If


            End Using
        End If
    End Sub
End Class
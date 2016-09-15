<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Root1.Master" CodeBehind="TQ_MS_Terminal_WebForm.aspx.vb" Inherits="TQ.TQ_MS_Terminal_WebForm" %>

<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var passwordMinLength = 6;
        function GetPasswordRating(password) {
            var result = 0;
            if (password) {
                result++;
                if (password.length >= passwordMinLength) {
                    if (/[a-z]/.test(password))
                        result++;
                    if (/[A-Z]/.test(password))
                        result++;
                    if (/\d/.test(password))
                        result++;
                    if (!(/^[a-z0-9]+$/i.test(password)))
                        result++;
                }
            }
            return result;
        }
        function OnPasswordTextBoxInit(s, e) {
            ApplyCurrentPasswordRating();
        }
        function OnPassChanged(s, e) {
            ApplyCurrentPasswordRating();
        }
        function ApplyCurrentPasswordRating() {
            var password = passwordTextBox.GetText();
            var passwordRating = GetPasswordRating(password);
            ApplyPasswordRating(passwordRating);
        }
        function ApplyPasswordRating(value) {
            ratingControl.SetValue(value);
            switch (value) {
                case 0:
                    ratingLabel.SetValue("Password safety");
                    break;
                case 1:
                    ratingLabel.SetValue("Too simple");
                    break;
                case 2:
                    ratingLabel.SetValue("Not safe");
                    break;
                case 3:
                    ratingLabel.SetValue("Normal");
                    break;
                case 4:
                    ratingLabel.SetValue("Safe");
                    break;
                case 5:
                    ratingLabel.SetValue("Very safe");
                    break;
                default:
                    ratingLabel.SetValue("Password safety");
            }
        }
        function GetErrorText(editor) {
            if (editor === passwordTextBox) {
                if (ratingControl.GetValue() === 1)
                    return "The password is too simple";
            } else if (editor === confirmPasswordTextBox) {
                if (passwordTextBox.GetText() !== confirmPasswordTextBox.GetText())
                    return "The password you entered do not match";
            }
            return "";
        }
        function OnPassValidation(s, e) {
            var errorText = GetErrorText(s);
            if (errorText) {
                e.isValid = false;
                e.errorText = errorText;
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <%--Head--%>
        <table style="margin: 20px 0px 0px 0px; width: 100%; padding: 20px 0px 0px 0px; text-align: center;">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <h3>ลงทะเบียนสำหรับผู้ประกอบการท่าเรือ</h3>
                </td>
                <td style="width: 100%; text-align: left;">&nbsp;</td>
                <td style="width: 100%; text-align: right;">
                    &nbsp;</td>
            </tr>
        </table>   
    </div>

        <%-- Conetent --%>
        <div>
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Theme="Moderno" EnableTheming="True" >
               <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="800" />
                <Items>
                    <dx:LayoutGroup Caption="ข้อมูลผู้ประกอบการท่าเรือ" ColCount="2" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem Caption="รหัสท่าเรือ:" FieldName="TERMINAL_CODE">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="Terminal_CODE" runat="server" Theme="Moderno" ReadOnly="True">
                                            <ValidationSettings>
                                                <RequiredField ErrorText="กรุณาป้อนรหัสท่าเรือ" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <HelpTextStyle ForeColor="Maroon">
                                </HelpTextStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ชื่อผู้ประกอบการท่าเรือ" FieldName="CONNECT_NAME">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="Terminal_NAME" runat="server" Theme="Moderno">
                                            <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="กรุณาป้อนชื่อผู้ประกอบการเรือ." IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <HelpTextStyle ForeColor="Maroon">
                                </HelpTextStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ประเภทผู้ให้บริการ" FieldName="OPERATION">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="OPERATION" runat="server" Theme="Moderno">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="ประเภทที่ 1" />
                                                <dx:ListBoxColumn Caption="ประเภทที่ 2" />
                                                <dx:ListBoxColumn Caption="ประเภทที่ 3" />
                                                <dx:ListBoxColumn Caption="ประเภทที่ 4" />
                                            </Columns>
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ที่อยู่" FieldName="ADDRESS">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ADDRESS" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="หมายเลขประจำตัวผู้เสียภาษี" FieldName="CARD_ID">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="CARD_ID" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ชื่อผู้ติดต่อ" FieldName="CONNECT_NAME">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="CONTACT_NAME" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="โทรศัพท์" FieldName="TEL">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="TEL" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="โทรสาร" FieldName="FAX">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="FAX" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="EMAIL" FieldName="EMAIL">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
<dx:ASPxTextBox runat="server" ID="eMailTextBox">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="true">
                                            <RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            <RequiredField IsRequired="True" ErrorText="The value is required" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="WEBSITE" FieldName="WEBSITE">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="WEBSITE" runat="server" Theme="Moderno">
                                            <ValidationSettings ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <HelpTextStyle ForeColor="Maroon">
                                </HelpTextStyle>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="ข้อมูลการเข้าใช้ระบบ" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem Caption="ชื่อผู้ใช้งานระบบ" FieldName="USER_NAME">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="USERNAME" runat="server" Theme="Moderno">
                                            <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="กรุณาป้อนชื่อผู้ใช้งานระบบ" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="รหัสผ่าน" FieldName="PASSWORD">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="passwordTextBox" runat="server" ClientInstanceName="passwordTextBox" Password="True">
                                            <ClientSideEvents Init="OnPasswordTextBoxInit" KeyUp="OnPassChanged" Validation="OnPassValidation" />
                                            <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                <RequiredField ErrorText="กรุณาป้อนรหัสผ่าน" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ยืนยันรหัสผ่าน" FieldName="CONFIRMPASSWORD">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="confirmPasswordTextBox" runat="server" ClientInstanceName="confirmPasswordTextBox" Password="True">
                                            <ClientSideEvents Validation="OnPassValidation" />
                                            <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                <RequiredField ErrorText="กรุณาป้อนรหัสยืนยัน" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <table>
                                            <tr>
                                                <td>
                                                    <dx:ASPxRatingControl ID="ratingControl" runat="server" ClientInstanceName="ratingControl" ReadOnly="True" Value="0">
                                                    </dx:ASPxRatingControl>
                                                </td>
                                                <td style="padding-left:5px;width:100px">
                                                    <dx:ASPxLabel ID="ratingLabel" runat="server" ClientInstanceName="ratingLabel" Text="Password safety">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                           

                            <dx:LayoutItem Caption="">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
     <dx:ASPxCaptcha ID="Captcha" runat="server">
        <ValidationSettings SetFocusOnError="true" ErrorDisplayMode="Text" />
    </dx:ASPxCaptcha>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                           

                        </Items>
                    </dx:LayoutGroup>

                    <%-- Buttom --%>

                    <dx:LayoutGroup Caption="" GroupBoxDecoration="None">
                        <Items>
                            <dx:LayoutItem Caption="" Width="100px">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxButton ID="ASPxFormLayout1_Button_OK" runat="server" Text="บันทึก" AutoPostBack="true" UseSubmitBehavior="true">
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                   <%-- Password--%>
               <%-- End password--%>

                </Items>
            </dx:ASPxFormLayout>
            <dx:EntityServerModeDataSource ID="Entity_Terminal" runat="server" ContextTypeName="TQ.Entities_ConnStr" TableName="TQ_MS_TERMINAL" />
            <dx:ASPxLabel runat="server" ID="errorMessageLabel" Visible="false" ForeColor="Red" EnableViewState="false" EncodeHtml="false" />
        </div>
</asp:Content>

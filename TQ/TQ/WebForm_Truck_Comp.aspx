<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Root1.Master" CodeBehind="WebForm_Truck_Comp.aspx.vb" Inherits="TQ.WebForm_Truck_Comp" %>
<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <%--Head--%>
        <table style="margin: 20px 0px 0px 0px; width: 100%; padding: 20px 0px 0px 0px; text-align: center;">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <h3>ลงทะเบียนสำหรับผู้ประกอบการขนส่ง</h3>
                </td>
                <td style="width: 100%; text-align: left;">&nbsp;</td>
                <td style="width: 100%; text-align: right;">&nbsp;</td>
            </tr>
        </table>
    </div>

    <div>
        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Theme="Moderno" EnableTheming="True" >
               <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="800" />
                <Items>
                    <dx:LayoutGroup Caption="ข้อมูลผู้ประกอบการขนส่ง" ColCount="2" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem Caption="รหัสผู้ประกอบการขนส่ง:" FieldName="TRUCK_CODE">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="TRUCK_CODE" runat="server" Theme="Moderno" ReadOnly="True">
                                            <ValidationSettings ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                <RequiredField ErrorText="กรุณาป้อนรหัสท่าเรือ" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <HelpTextStyle ForeColor="Maroon">
                                </HelpTextStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ชื่อผู้ประกอบการขนส่ง" FieldName="TRUCK_NAME">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="TRUCK_NAME" runat="server" Theme="Moderno">
                                            <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="กรุณาป้อนชื่อผู้ประกอบการ" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <HelpTextStyle ForeColor="Maroon">
                                </HelpTextStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ที่อยู่" FieldName="ADDRESS_NO">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E31" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ถนน" FieldName="ROAD">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ADDRESS" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ตำบล" FieldName="DISTRICT_ID">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="CARD_ID" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="อำเภท" FieldName="AMPHUR_ID">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="CONTACT_NAME" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="จังหวัด" FieldName="PROVINCE_ID">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="TEL" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="รหัสไปรษณีย์" FieldName="ZIPCODE">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="FAX" runat="server" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="* สถานะใบอนุญาต *">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
<dx:ASPxTextBox runat="server" ID="ASPxFormLayout1_E4">
                                    </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="* ประเภทผู้ลงทะเบียน *" FieldName="WEBSITE">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="Type" runat="server" Theme="Moderno">
                                            <ValidationSettings ErrorTextPosition="Bottom">
                                                <RequiredField ErrorText="" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <HelpTextStyle ForeColor="Maroon">
                                </HelpTextStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ชื่อผู้ติดต่อ" FieldName="CONTACT_NAME">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="โทรศัพท์" FieldName="TEL">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server">
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="โทรสาร" FieldName="FAX">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="* Web site *">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server">
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="* E-mail *">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="eMailTextBox" runat="server">
                                            <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                <RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                <RequiredField ErrorText="The value is required" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="* ข้อมูลผู้ประกอบการขนส่ง (ปัจจุบัน) *" ColCount="2" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem Caption="ชื่อผู้ติดต่อ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ที่อยู่">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E8" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="อำเภอ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ตำบล">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E11" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="รหัสไปรษณีย์">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E12" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="โทรศัพท์">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E13" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="โทรสาร">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E14" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Email">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E15" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="ข้อมูลที่เกี่ยวกับธุระกิจ" ColCount="2" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem Caption="อายุการประกอบการ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E27" runat="server">
                                        </dx:ASPxSpinEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ประเภทการให้บริการ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E19" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="จำนวนพนักงาน">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxSpinEdit ID="ASPxFormLayout1_E29" runat="server">
                                        </dx:ASPxSpinEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="จำนวนรถบรรทุก">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E21" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ประเภทสินค้าที่ขนส่ง">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E22" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="การรับรองมาตรฐาน">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E23" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="การให้บริการอื่นๆ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E24" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="ประเภทของผู้ประกอบการ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E25" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="ข้อมูลการเข้าใช้ระบบ" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem Caption="ชื่อผู้ใช้งานระบบ" FieldName="USERNAME">
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
                                        <dx:ASPxTextBox ID="password" runat="server" ClientInstanceName="passwordTextBox" Password="True">
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
                                        <dx:ASPxTextBox ID="confirmPassword" runat="server" ClientInstanceName="confirmPasswordTextBox" Password="True">
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

<ChallengeImage ForegroundColor="#000000"></ChallengeImage>
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
        <dx:EntityServerModeDataSource ID="EF_TruckComp" runat="server" ContextTypeName="TQ.Entities_ConnStr" EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="TQ_MS_TRUCK_COMP" />
    </div>
</asp:Content>

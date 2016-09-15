<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Root1.Master" CodeBehind="WebForm_Login.aspx.vb" Inherits="TQ.WebForm_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <%--Head--%>
        <table style="width: 100%; padding: 10px">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <h3>หน้าจอเข้าสู่ระบบ (Login)</h3>
                </td>
                <td style="width: 100%; text-align: left;">&nbsp;</td>
                <td style="width: 100%; text-align: right;">&nbsp;</td>
            </tr>
            
        </table>   
    </div>

        <div>
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                <Items>
                    <dx:LayoutGroup Caption="" GroupBoxDecoration="None">
                        <Items>
                            <dx:LayoutItem Caption="ชื่อผู้ใช้งาน:" HelpText="กรุณาป้อน ชื่อผู้ใช้งาน Please, enter your login name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="Username" runat="server">
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="รหัสผ่าน:" HelpText="กรุณาป้อน รหัสผ่าน Please, enter your password.">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="Password" runat="server">
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="" ColCount="2" GroupBoxDecoration="HeadingLine" ShowCaption="False">
                        <Items>
                            <dx:LayoutItem Caption="" HorizontalAlign="Center">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxButton ID="Login" runat="server" Text="เข้าสู่ระบบ">
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="" HorizontalAlign="Center">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E1" runat="server" Text="ลืมรหัสผ่าน?">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="" ColSpan="2" HorizontalAlign="Center">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E2" runat="server" Text="ลงทะเบียน (ผู้ประกอบการท่าเรือ)">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>

        </div>

</asp:Content>



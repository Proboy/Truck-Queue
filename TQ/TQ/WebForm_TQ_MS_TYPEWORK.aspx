<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm_TQ_MS_TYPEWORK.aspx.vb" Inherits="TQ.WebForm_TQ_MS_TYPEWORK" %>

<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--Head--%>
        <table style="margin: 20px 0px 0px 0px; width: 100%; padding: 20px 0px 0px 0px; text-align: center;">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <h3>ข้อมูลประเภทการทำงาน</h3>
                </td>
                <td style="width: 100%; text-align: left;">&nbsp;</td>
                <td style="width: 100%; text-align: right;">
                    &nbsp;</td>
            </tr>
        </table>   
    </div>

        <%-- Conetent --%>
        <div>
            <dx:EntityServerModeDataSource ID="EntityServerModeDataSource_Tq_TypeWork" runat="server" ContextTypeName="TQ.Entities_ConnStr" TableName="TQ_MS_TYPEWORK" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            </dx:EntityServerModeDataSource>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityServerModeDataSource_Tq_TypeWork" KeyFieldName="ID">
                <SettingsPager Visible="False">
                </SettingsPager>
                <SettingsEditing Mode="Inline">
                </SettingsEditing>
                <SettingsBehavior ConfirmDelete="True" />
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="รหัสประเภทงาน" FieldName="CODE" VisibleIndex="2" Width="120px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="รหัสชื่องาน" FieldName="NAME" VisibleIndex="3" Width="280px">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>

    </form>
</body>
</html>

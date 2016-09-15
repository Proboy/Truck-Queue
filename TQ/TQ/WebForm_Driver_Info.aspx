<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Root1.Master" CodeBehind="WebForm_Driver_Info.aspx.vb" Inherits="TQ.WebForm_Driver_Info" %>
<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <%--Head--%>
        <table style="margin: 20px 0px 10px 0px; width: 100%; padding: 20px 0px 0px 0px; text-align: center;">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <h3>ข้อมูลพนักงานขับรถ</h3>
                </td>
                <td style="width: 100%; text-align: left;">&nbsp;</td>
                <td style="width: 100%; text-align: right;">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: left;">
                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Caption="เลือกผู้ประกอบการขนส่ง" DataSourceID="SqlDataSource1" TextFormatString="{0} - {1}" ValueField="TRUCK_CODE" Width="70%" AutoPostBack="True" SelectedIndex="0">
                        <Columns>
                            <dx:ListBoxColumn Caption="รหัสผู้ประกอบการ" FieldName="TRUCK_CODE" Width="180px" />
                            <dx:ListBoxColumn Caption="ชื่อผู้ประกอบการ" FieldName="TRUCK_NAME" Width="280px" />
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TQConnectionString %>" ProviderName="<%$ ConnectionStrings:TQConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TRUCK_CODE&quot;, &quot;TRUCK_NAME&quot; FROM &quot;TQ_MS_TRUCK_COMP&quot;"></asp:SqlDataSource>
                </td>
                <td style="width: 100%; text-align: left;">&nbsp;</td>
                <td style="width: 100%; text-align: right;">&nbsp;</td>
            </tr>
        </table>
    </div>

    <%-- Conetent --%>
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="DRIVER_INFO_ID" Width="100%">
            <SettingsEditing Mode="EditForm">
            </SettingsEditing>
            <Settings GridLines="None" />
            <SettingsBehavior ConfirmDelete="True" />

            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image">
                    <Image Url="/Images/Delete-20.png"></Image>
                </ShowAdaptiveDetailButton>

                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
            </SettingsCommandButton>
            <EditFormLayoutProperties ColCount="2">
                <Items>
                    <dx:GridViewColumnLayoutItem ColumnName="TRANS_ID">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="DRIVER_LICENSE">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="DRIVER_NAME">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="ADDRESS">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="TEL">
                    </dx:GridViewColumnLayoutItem>
                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                    </dx:EditModeCommandLayoutItem>
                </Items>
            </EditFormLayoutProperties>
            <Columns>

                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="10" ButtonRenderMode="Button" ButtonType="Button">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="เลขที่ใบอนุญาตขนส่ง" FieldName="DRIVER_LICENSE" VisibleIndex="1" Width="180px">
                    <PropertiesTextEdit>
                        <ValidationSettings SetFocusOnError="True">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ชื่อพนักงานขับรถ" FieldName="DRIVER_NAME" VisibleIndex="2" Width="260px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ที่อยู่" FieldName="ADDRESS" VisibleIndex="3" Width="280px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="โทรศัพท์" FieldName="TEL" VisibleIndex="4" Width="120px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="รหัสผู้ประกอบการขนส่ง" FieldName="TRANS_ID" ReadOnly="True" VisibleIndex="0" Width="180px">
                    <PropertiesTextEdit EnableFocusedStyle="False">
                    </PropertiesTextEdit>
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <dx:EntityServerModeDataSource ID="EF_Driver_info" runat="server" ContextTypeName="TQ.Entities_ConnStr" EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="TQ_MS_DRIVER_INFO"></dx:EntityServerModeDataSource>
    </div>
</asp:Content>

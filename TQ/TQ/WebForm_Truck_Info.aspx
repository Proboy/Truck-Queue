<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Root1.Master" CodeBehind="WebForm_Truck_Info.aspx.vb" Inherits="TQ.WebForm_Truck" %>
<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div>
        <%--Head--%>
        <table style="margin: 20px 0px 10px 0px; width: 100%; padding: 20px 0px 0px 0px; text-align: center;">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <h3>ข้อมูลหัวรถลาก/รถขนส่ง</h3>
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
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="TRUCK_INFO_ID" Width="100%">
            <SettingsEditing Mode="EditForm">
            </SettingsEditing>
            <Settings GridLines="None" ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True"  />

            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image">
                    <Image Url="/Images/Delete-20.png"></Image>
                </ShowAdaptiveDetailButton>

                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
            </SettingsCommandButton>
            <EditFormLayoutProperties ColCount="2">
                <Items>
                    <dx:GridViewColumnLayoutItem ColumnName="COMPANY_ID">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="TRUCK_ID">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="PROVINCE">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="TRUCK_LICENSE">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="TRUCK_TYPE">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="TRUCK_STATUS">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="EXPIRATION_DATE">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="SAFE_WEIGHT">
                    </dx:GridViewColumnLayoutItem>
                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                    </dx:EditModeCommandLayoutItem>
                </Items>
            </EditFormLayoutProperties>
            <Columns>

                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="9" ButtonRenderMode="Button" ButtonType="Button" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="เลขทะเบียนรถบรรทุก" FieldName="TRUCK_ID" VisibleIndex="1" Width="120px">
                    <PropertiesTextEdit>
                        <ValidationSettings SetFocusOnError="True">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="จังหวัดตามทะเบียนรถ" FieldName="PROVINCE" VisibleIndex="2" Width="120px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="เลขที่ใบอนุญาตรถบรรทุก" FieldName="TRUCK_LICENSE" VisibleIndex="3" Width="120px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ประเภทรถบรรทุก" FieldName="TRUCK_TYPE" VisibleIndex="4" Width="120px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="รหัสผู้ประกอบการขนส่ง" FieldName="COMPANY_ID" ReadOnly="True" VisibleIndex="0" Width="120px">
                    <PropertiesTextEdit EnableFocusedStyle="False">
                    </PropertiesTextEdit>
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="สถานะรถบรรทุก" FieldName="TRUCK_STATUS" VisibleIndex="5" Width="120px">
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataSpinEditColumn Caption="น้ำหนักที่ปลอดภัย" FieldName="SAFE_WEIGHT" VisibleIndex="8" Width="120px">
                    <PropertiesSpinEdit DisplayFormatString="n2" NumberFormat="Custom">
                    </PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
                <dx:GridViewDataDateColumn Caption="วันที่หมดอายุการใช้งาน" FieldName="EXPIRATION_DATE" VisibleIndex="7" Width="120px">
                    <PropertiesDateEdit EditFormat="Custom" EditFormatString="d">
                    </PropertiesDateEdit>
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
            </Columns>
        </dx:ASPxGridView>
        <dx:EntityServerModeDataSource ID="EntityServerModeDataSource1" runat="server" ContextTypeName="TQ.Entities_ConnStr" TableName="TQ_MS_TRUCK_INFO" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </dx:EntityServerModeDataSource>
    </div>
</asp:Content>

<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Root1.Master"  CodeBehind="WebForm_TRUCK_VISIT_HIS.aspx.vb" Inherits="TQ.WebForm_TRUCK_VISIT_HIS" %>

<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <%--Head--%>
        <table style="margin: 20px 0px 0px 0px; width: 100%; padding: 20px 0px 0px 0px; text-align: center;">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <h3>นำข้อมูลเข้าจากไฟล์</h3>
                </td>
                <td style="width: 100%; text-align: left;">&nbsp;</td>
                <td style="width: 100%; text-align: right;">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 100%; text-align: left;">
                    &nbsp;</td>
                <td style="width: 100%; text-align: left;">&nbsp;</td>
                <td style="width: 100%; text-align: right;">&nbsp;</td>
            </tr>
        </table>   
    </div>

        <%-- Import file --%>
        <div>
            <dx:ASPxUploadControl ID="UploadControl" runat="server" UploadMode="Auto"
                ShowProgressPanel="true" ShowUploadButton="True" UploadStorage="FileSystem" Width="80%">
                <AdvancedModeSettings EnableMultiSelect="False" EnableFileList="True" EnableDragAndDrop="False" />
                <ValidationSettings MaxFileSize="10000000" AllowedFileExtensions=".xls,.xlsx" ShowErrors="false" />
            </dx:ASPxUploadControl>
            <p class="Note">
                <b>หมายเหตุ</b>: ขนาดไฟล์ต้องไม่เกิน 10 MB.
            </p>
        </div>

        <div>
            <%--Head--%>
            <table style="width: 100%; padding: 10px">
                <tr>
                    <td style="width: 100%; text-align: left;">
                        <h3>ข้อมูลรถบรรทุกผ่านเข้า-ออก (Truck Visit History Information)</h3>
                    </td>
                    <td style="width: 100%; text-align: left;">&nbsp;</td>
                    <td style="width: 100%; text-align: right;">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 100%; text-align: left;">&nbsp;</td>
                    <td style="width: 100%; text-align: left;">&nbsp;</td>
                    <td style="width: 100%; text-align: right;">&nbsp;</td>
                </tr>
            </table>
        </div>
        <%-- Conetent --%>

        <div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EF_TRUCK_VISIT_HIS" KeyFieldName="TRUCK_VISIT_HIS_ID" Width="100%">
                <SettingsEditing Mode="EditForm">
                </SettingsEditing>
                <Settings GridLines="None" />
                <SettingsBehavior ConfirmDelete="True" />

<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"><Image Url="/Images/Delete-20.png"></Image></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
                <EditFormLayoutProperties ColCount="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="TRUCK_VISIT_NO">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="TERMINAL_ID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="SUB_GATE_NO">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="TRUCK_ID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="TRUCK_VISIT_DATE">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="START_TIME">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="END_TIME">
                        </dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                        </dx:EditModeCommandLayoutItem>
                    </Items>
                </EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="7" ButtonRenderMode="Button" ButtonType="Button">

                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="ท่าเรือ" FieldName="TERMINAL_ID" VisibleIndex="1">
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Gate Number" FieldName="SUB_GATE_NO" VisibleIndex="2">
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Truck ID" FieldName="TRUCK_ID" VisibleIndex="3">
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="วันที่เข้า" FieldName="TRUCK_VISIT_DATE" VisibleIndex="4">
                        <PropertiesDateEdit DisplayFormatInEditMode="True" EditFormat="Custom" EditFormatString="d">
                        </PropertiesDateEdit>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataSpinEditColumn Caption="ลำดับ" FieldName="TRUCK_VISIT_NO" VisibleIndex="0">
                        <PropertiesSpinEdit DisplayFormatString="n0" NumberFormat="Custom">
                        </PropertiesSpinEdit>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataTimeEditColumn Caption="Start time" FieldName="START_TIME" VisibleIndex="5">
                        <PropertiesTimeEdit DisplayFormatInEditMode="True" DisplayFormatString="HH:mm tt" EditFormat="Custom" EditFormatString="HH:mm tt">
                        </PropertiesTimeEdit>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTimeEditColumn>
                    <dx:GridViewDataTimeEditColumn Caption="End time" FieldName="END_TIME" VisibleIndex="6">
                        <PropertiesTimeEdit DisplayFormatInEditMode="True" DisplayFormatString="HH:mm tt" EditFormat="Custom" EditFormatString="HH:mm tt">
                        </PropertiesTimeEdit>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTimeEditColumn>
                </Columns>
            </dx:ASPxGridView>
            <dx:EntityServerModeDataSource ID="EF_TRUCK_VISIT_HIS" runat="server" ContextTypeName="TQ.Entities_ConnStr" EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="TQ_TRUCK_VISIT_HIS">
            </dx:EntityServerModeDataSource>
        </div>

</asp:Content>

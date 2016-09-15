<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Root1.Master" CodeBehind="WebForm_Quota_Management.aspx.vb" Inherits="TQ.WebForm_Quota_Management" %>

<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <%--Head--%>
        <table style="margin: 20px 0px 0px 0px; width: 100%; padding: 20px 0px 0px 0px; text-align: center;">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <h3>กำหนดปริมาณจำนวนการให้บริการ (Quota Management)</h3>
                </td>
                <td style="width: 100%; text-align: left;">&nbsp;</td>
                <td style="width: 100%; text-align: right;">&nbsp;</td>
            </tr>
        </table>
    </div>
                
        <%-- Conetent --%>
        <div  >
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EF_Quata" KeyFieldName="QUOTA_ID" Width="100%">
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
                        <dx:GridViewColumnLayoutItem ColumnName="QUOTA_DATE">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="OPERATOR_TYPE">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="START_TIME">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="END_TIME">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="QTY">
                        </dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                        </dx:EditModeCommandLayoutItem>
                    </Items>
                </EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="5" ButtonRenderMode="Button" ButtonType="Button">

                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataDateColumn Caption="วันที่กำหนดโควต้า" FieldName="QUOTA_DATE" VisibleIndex="0" SortIndex="0" SortOrder="Descending">
                        <PropertiesDateEdit DisplayFormatString="D" DisplayFormatInEditMode="True" EditFormat="Custom" EditFormatString="D">
                            <TimeSectionProperties>
                                <TimeEditProperties DisplayFormatString="D" EditFormatString="D">
                                </TimeEditProperties>
                            </TimeSectionProperties>
                        </PropertiesDateEdit>
                        <FilterCellStyle HorizontalAlign="Center" Wrap="False">
                        </FilterCellStyle>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataSpinEditColumn Caption="จำนวนคิว" FieldName="QTY" VisibleIndex="4">
                        <PropertiesSpinEdit DisplayFormatString="n0" DisplayFormatInEditMode="True" NumberFormat="Custom">
                        </PropertiesSpinEdit>
                        <FilterCellStyle HorizontalAlign="Center" Wrap="False">
                        </FilterCellStyle>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataComboBoxColumn Caption="ประเภทงาน" FieldName="OPERATOR_TYPE" VisibleIndex="1">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Import" Value="Import" />
                                <dx:ListEditItem Text="Export" Value="Export" />
                            </Items>
                        </PropertiesComboBox>
                        <FilterCellStyle HorizontalAlign="Center" Wrap="False">
                        </FilterCellStyle>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTimeEditColumn Caption="ช่วงเวลาตั้งแต่" FieldName="START_TIME" VisibleIndex="2">
                        <PropertiesTimeEdit DisplayFormatInEditMode="True" DisplayFormatString="h:mm tt" EditFormat="Custom" EditFormatString="h:mm tt">
                        </PropertiesTimeEdit>
                        <FilterCellStyle HorizontalAlign="Center" Wrap="False">
                        </FilterCellStyle>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTimeEditColumn>
                    <dx:GridViewDataTimeEditColumn Caption="ถึง" FieldName="END_TIME" VisibleIndex="3">
                        <PropertiesTimeEdit DisplayFormatInEditMode="True" DisplayFormatString="h:mm tt" EditFormat="Custom" EditFormatString="h:mm tt">
                        </PropertiesTimeEdit>
                        <FilterCellStyle HorizontalAlign="Center" Wrap="False">
                        </FilterCellStyle>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <CellStyle HorizontalAlign="Center" Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTimeEditColumn>
                </Columns>
            </dx:ASPxGridView>
            <dx:EntityServerModeDataSource ID="EF_Quata" runat="server" ContextTypeName="TQ.Entities_ConnStr" EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="TQ_TR_QUOTA" />
        </div>

</asp:Content>

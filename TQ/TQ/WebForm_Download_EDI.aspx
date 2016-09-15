<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Root1.Master" CodeBehind="WebForm_Download_EDI.aspx.vb" Inherits="TQ.WebForm_Download_EDI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <%--Head--%>
        <table style="margin: 20px 0px 0px 0px; width: 100%; padding: 20px 0px 0px 0px; text-align: center;">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <h3>ดาวน์โหลดไฟล์ EDI</h3>
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
 
                      
    <div>
        <%-- Import file --%>
        <dx:ASPxUploadControl ID="ASPxUploadControl2" runat="server" UploadMode="Auto"
            ShowProgressPanel="true" ShowUploadButton="true" Width="80%" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete">
            <AdvancedModeSettings EnableMultiSelect="True" EnableFileList="True" EnableDragAndDrop="True" />
            <ValidationSettings MaxFileSize="10000000" AllowedFileExtensions=".xls,.xlsx" />
        </dx:ASPxUploadControl>

        <p class="Note">
            <b>หมายเหตุ</b>: ขนาดไฟล์รวมต้องไม่เกิน 10 MB.
        </p>
    </div>


</asp:Content>

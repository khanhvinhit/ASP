<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="EditRoom.aspx.cs" Inherits="Admin_EditRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" Runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <!-- Hien thi ten trang web -->
                <asp:Label ID="lblTitle" runat="server" CssClass="title" />
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="col-md-6">
                    <!-- Luu ID cua category (neu dung form o trang thai cap nhat) -->
                    <asp:Label ID="lblId" runat="server" Visible="false" />

                    <!-- Hien thi cac thong bao thanh cong / that bai khi them moi/cap nhat category -->
                    <h3 style="text-align: center; color: red;">
                        <asp:Label runat="server" ID="lblStatus" CssClass="status" /></h3>

                    <!-- Form nhap cac thong tin ve category -->
                    <div class="form-group">
                        <label>Tên:</label>
                        <asp:TextBox runat="server" ID="txtName" CssClass="textEntry form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Hãy đặt tên cho thực đơn" ControlToValidate="txtName" SetFocusOnError="true" Display="Static" CssClass="failureNotification" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Hình</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="348px" Height="27px"/>
                    </div>
                    <div class="form-group">
                        <label>Thông tin:</label>
                        <asp:TextBox runat="server" ID="txtAbout" CssClass="textEntry form-control" />
                        </div>
                    <div class="form-group">
                        <label>Loại:</label>
                        <asp:DropDownList ID="txtTypeName" runat="server" CssClass ="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Button Text="Lưu" runat="server" ID="btnSave" CssClass="btn btn-success" />
                        <input type="button" value="Hủy" onclick="location.href = 'Room.aspx'" class="btn btn-default" />
                        <input type="reset" value="Reset" runat="server" id="btnReset" class="btn btn-warning" />
                    </div>
                </div>
                <div class="col-md-6">
                    <asp:Image ID="Image1" runat="server" Width="250px" />
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
</asp:Content>


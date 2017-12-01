<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="EditAbout.aspx.cs" Inherits="Admin_EditAbout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" Runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <style>
                .failureNotification {
                    color: red;
                }
            </style>
            <div class="panel-heading">
                <asp:Label ID="lblTitle" runat="server" CssClass="title" />
            </div>
            <div class="panel-body">
                <div class="col-md-12">
                    <asp:Label ID="lblId" runat="server" Visible="false" />
                    <h3 style="text-align: center; color: red;">
                        <asp:Label runat="server" ID="lblStatus" CssClass="status" />
                    </h3>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Bản đồ:</label>
                        <asp:TextBox runat="server" ID="txtURLMap" CssClass=" form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Vui lòng nhập địa chỉ bản đồ." ControlToValidate="txtURLMap" SetFocusOnError="true" Display="Static" CssClass="failureNotification" runat="server" />
                    </div>

                    <div class="form-group">
                        <label>Tên:</label>
                        <asp:TextBox runat="server" ID="txtName" CssClass=" form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Vui lòng nhập tiêu đề." ControlToValidate="txtName" SetFocusOnError="true" Display="Static" CssClass="failureNotification" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ:</label>
                        <asp:TextBox runat="server" ID="txtAddress" CssClass=" form-control"  />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Vui lòng nhập địa chỉ." ControlToValidate="txtAddress" SetFocusOnError="true" Display="Static" CssClass="failureNotification" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass=" form-control" />

                    </div>
                    <div class="form-group">
                        <label>Số điện thoại:</label>
                        <asp:TextBox runat="server" ID="txtPhone" CssClass=" form-control" />

                    </div>
                    <div class="form-group">
                        <label>Số điện thoại 2:</label>
                        <asp:TextBox runat="server" ID="txtPhone2" CssClass=" form-control" />

                    </div>
                    <div class="form-group">
                        <label>Chi tiết:</label>
                        <textarea  runat="server" ID="txtContents"  class="form-control" rows="5"></textarea>
                       
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="form-group">
                    <asp:Button Text="Lưu" runat="server" ID="btnSave" CssClass="btn btn-success" />
                    <input type="button" value="Hủy" onclick="location.href = 'About.aspx'" class="btn btn-default" />
                    <input type="reset" value="Reset" runat="server" id="btnReset" class="btn btn-warning" />
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="EditAccount.aspx.cs" Inherits="Admin_EditAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" runat="Server">
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
                        <label>Email:</label>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass=" form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Vui lòng nhập email." ControlToValidate="txtEmail" SetFocusOnError="true" Display="Static" CssClass="failureNotification" runat="server" />
                    </div>

                    <div class="form-group">
                        <label>Tên:</label>
                        <asp:TextBox runat="server" ID="txtName" CssClass=" form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Vui lòng nhập họ tên." ControlToValidate="txtName" SetFocusOnError="true" Display="Static" CssClass="failureNotification" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu:</label>
                        <asp:TextBox runat="server" ID="txtPassword" CssClass=" form-control" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Vui lòng nhập mật khẩu." ControlToValidate="txtPassword" SetFocusOnError="true" Display="Static" CssClass="failureNotification" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Loại:</label>
                        <asp:DropDownList ID="txtType" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ:</label>
                        <asp:TextBox runat="server" ID="txtAddress" CssClass=" form-control" />

                    </div>
                    <div class="form-group">
                        <label>Số điện thoại:</label>
                        <asp:TextBox runat="server" ID="txtPhone" CssClass=" form-control" />

                    </div>
                    <div class="form-group">
                        <label>Trạng thái:</label>
                        <label class="radio-inline">
                            <asp:RadioButton GroupName="status" ID="txtStatus" runat="server" />
                            Kích hoạt
                        </label>
                        <label class="radio-inline">
                            <asp:RadioButton GroupName="status" ID="txtStatusFalse" runat="server" />
                            Hủy Kích hoạt
                        </label>

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Hình đại diện:</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="348px" Height="27px" />
                    </div>
                    <asp:Image ID="Image1" runat="server" Width="250px" />
                </div>
            </div>
            <div class="panel-footer">
                <div class="form-group">
                    <asp:Button Text="Lưu" runat="server" ID="btnSave" CssClass="btn btn-success" />
                    <input type="button" value="Hủy" onclick="location.href = 'Account.aspx'" class="btn btn-default" />
                    <input type="reset" value="Reset" runat="server" id="btnReset" class="btn btn-warning" />
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
</asp:Content>


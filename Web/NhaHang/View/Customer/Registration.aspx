<%@ Page Title="" Language="C#" MasterPageFile="~/View/layout/site1.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="View_Customer_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bg-faded p-4 my-4">
    <hr class="divider" />
    <h2 class="text-center text-lg text-uppercase my-0">Đăng <strong>Ký</strong>
    </h2>
    <hr class="divider" />
    <div class="row">
        <div class="card ml-auto mr-auto" style="width: 35rem; box-shadow: 5px 3px 5px #708090">
            <div class="card-body">
                <form runat="server">
                    <div class="form-group row">
                        <label for="inputEmail3" class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                            <asp:TextBox
                                ID="txtEmail"
                                TextMode="Email"
                                runat="server"
                                CssClass="form-control"
                                ToolTip="Nhập email của bạn vào đây."
                                placeholder="Email">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1"
                                runat="server"
                                ControlToValidate="txtEmail"
                                Display="Dynamic"
                                Font-Size="8pt"
                                ForeColor="red">* Hãy nhập email.                                    
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputEmail3" class="col-sm-3 col-form-label">Tên tài khoản</label>
                        <div class="col-sm-9">
                            <asp:TextBox
                                ID="txtName"
                                runat="server"
                                CssClass="form-control"
                                ToolTip="Nhập tên của bạn vào đây."
                                placeholder="Tên tài khoản">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator4"
                                runat="server"
                                ControlToValidate="txtName"
                                Display="Dynamic"
                                Font-Size="8pt"
                                ForeColor="red">* Hãy nhập tên.                                    
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-3 col-form-label">Mật Khẩu</label>
                        <div class="col-sm-9">
                            <asp:TextBox
                                ID="txtPassword"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Password"
                                ToolTip="Nhập mật khẩu của bạn vào đây."
                                placeholder="Mật khẩu">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2"
                                runat="server"
                                ControlToValidate="txtPassword"
                                Display="Dynamic"
                                Font-Size="8pt"
                                ForeColor="red">* Hãy nhập mật khẩu.
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-3 col-form-label">Nhập lại Khẩu</label>
                        <div class="col-sm-9">
                            <asp:TextBox
                                ID="txtPassword2"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Password"
                                ToolTip="Nhập mật khẩu của bạn vào đây."
                                placeholder="Mật khẩu">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3"
                                runat="server"
                                ControlToValidate="txtPassword"
                                Display="Dynamic"
                                Font-Size="8pt"
                                ForeColor="red">* Hãy nhập mật khẩu.
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <asp:Button ID="btnLoginCus" runat="server"
                                CssClass="btn btn-lg btn-success btn-block"
                                Text="Đăng Ký"
                                Font-Bold="False"
                                OnClick="btnLogin_Click" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</asp:Content>


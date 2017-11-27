<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="Room.aspx.cs" Inherits="Admin_Room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" Runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách tài khoản
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>Mã số</th>
                            <th>Email</th>
                            <th>Loại</th>
                            <th>Hình</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="ListTable" runat="server">
                            <ItemTemplate>
                                <tr class="odd gradeX">
                                    <td><%# Eval("ID") %></td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("Type") %></td>
                                    <td><%# Eval("Avatar") %></td>
                                    <td><%# Eval("Status") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
</asp:Content>


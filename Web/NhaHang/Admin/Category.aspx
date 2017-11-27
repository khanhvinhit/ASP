<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Admin_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" Runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách thực đơn
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>Mã số</th>
                            <th>Tên</th>
                            <th>Hình</th>
                            <th>Ngày tạo</th>
                            <th>Người tạo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="ListTable" runat="server">
                            <ItemTemplate>
                                <tr class="odd gradeX">
                                    <td><%# Eval("ID") %></td>
                                    <td><%# Eval("Name") %></td>
                                    <td><%# Eval("Image") %></td>
                                    <td><%# Eval("CreateDate") %></td>
                                    <td><%# Eval("AccountID") %></td>
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


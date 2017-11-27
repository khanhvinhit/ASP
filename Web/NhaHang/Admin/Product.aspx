<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Admin_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách món ăn
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>Mã số</th>
                            <th>Tên</th>
                            <th>Thực đơn</th>
                            <th>Hình</th>
                            <th>Ngày tạo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="ListTable" runat="server">
                            <ItemTemplate>
                                <tr class="odd gradeX">
                                    <td><%# Eval("ID") %></td>
                                    <td><%# Eval("Name") %></td>
                                    <td><%# Eval("CategoryID") %></td>
                                    <td><%# Eval("Images") %></td>
                                    <td><%# Eval("CreateDate") %></td>
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
    <!-- /.col-lg-12 -->
</asp:Content>


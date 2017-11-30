<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Admin_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" Runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách chi tiết hóa đơn
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover list" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>Mã số</th>
                            <th>Mã Hóa Đơn</th>
                            <th>Món ăn</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="ListTable" runat="server">
                            <ItemTemplate>
                                <tr class="odd gradeX">
                                    <td><%#Eval("ID") %></td>
                                    <td><%# Eval("OrderID") %></td>
                                    <td><%# Eval("ProductName") %></td>
                                    <td><%# Eval("UnitPrice") %></td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td><%# Eval("Price") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
            <!-- /.panel-body -->
            <div class="panel-footer">
                <input type="button" value="Quay lại" onclick="location.href = 'Order.aspx'" class="btn btn-default" />
            </div>
        </div>
        <!-- /.panel -->
    </div>
</asp:Content>


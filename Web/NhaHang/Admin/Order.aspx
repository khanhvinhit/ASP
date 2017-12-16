<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Admin_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách hóa đơn
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="well">
                    <asp:Button Text="Xóa" runat="server" ID="btnDelete" CssClass="multidelete btn btn-danger" />
                </div>
                <table width="100%" class="table table-striped table-bordered table-hover list" id="dataTables-example">
                    <thead>
                        <tr>
                            <th class="cid" style="text-align: center">
                                <input type="checkbox" id="chkAll" />
                            </th>
                            <th>Mã số</th>
                            <th>Ngày đặt bàn</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                            <th>Tài khoản</th>
                            <th>Tùy chọn</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="ListTable" runat="server">
                            <AlternatingItemTemplate>
                                <tr class="even">
                                    <td style="text-align: center">
                                        <input type="checkbox" value='<%#Eval("ID") %>' name="cid" id="cid" /></td>
                                    <td><%#Eval("ID") %></td>
                                    <td><%# Eval("CreateDate", "{0:dd/MM/yyyy}") %></td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td><%#Eval("TotalPrice") %></td>
                                    <td><%# Eval("AccountName") %></td>
                                    <td><a href='OrderDetail.aspx?cid=<%#Eval("ID") %>'>Xem chi tiết</a></td>
                                </tr>
                            </AlternatingItemTemplate>
                            <ItemTemplate>
                                <tr class="odd gradeX">
                                    <td style="text-align: center">
                                        <input type="checkbox" value='<%#Eval("ID") %>' name="cid" id="cid" /></td>
                                    <td><%#Eval("ID") %></td>
                                    <td><%# Eval("CreateDate", "{0:dd/MM/yyyy}") %></td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td><%#Eval("TotalPrice") %></td>
                                    <td><%# Eval("AccountName") %></td>
                                    <td><a href='OrderDetail.aspx?cid=<%#Eval("ID") %>'>Xem chi tiết</a></td>
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


<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Admin_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" Runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách thực đơn
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="well">
                    <input type="button" class="btn btn-primary" value="Thêm mới" onclick="location.href = 'EditCategory.aspx'" />
                    <asp:Button Text="Xóa" runat="server" ID="btnDelete" CssClass="multidelete btn btn-danger" />
                </div>
                <table width="100%" class="table table-striped table-bordered table-hover list" id="dataTables-example">
                    <thead>
                        <tr>
                            <th class="cid"  style="text-align: center">
                                <input type="checkbox" id="chkAll" />
                            </th>
                            <th>Mã số</th>
                            <th>Mã Hóa Đơn</th>
                            <th>Mã món ăn</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="ListTable" runat="server">
                            <AlternatingItemTemplate>
                                <tr class="even">
                                    <td style="text-align: center">
                                        <input type="checkbox" value='<%#Eval("ID") %>' name="cid" id="cid" /></td>
                                    <td><%#Eval("ID") %></td>
                                    <td><%# Eval("OrderID") %></td>
                                    <td><%# Eval("ProductID") %></td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td><%# Eval("Price") %></td>
                                </tr>
                            </AlternatingItemTemplate>
                            <ItemTemplate>
                                <tr class="odd gradeX">
                                    <td style="text-align: center">
                                        <input type="checkbox" value='<%#Eval("ID") %>' name="cid" id="cid" /></td>
                                    <td><%#Eval("ID") %></td>
                                    <td><%# Eval("OrderID") %></td>
                                    <td><%# Eval("ProductID") %></td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td><%# Eval("Price") %></td>
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


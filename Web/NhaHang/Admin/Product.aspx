﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Admin_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách thực đơn
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="well">
                    <input type="button" class="btn btn-primary" value="Thêm mới" onclick="location.href = 'EditProduct.aspx'" />
                    <asp:Button Text="Xóa" runat="server" ID="btnDelete" CssClass="multidelete btn btn-danger" />
                </div>
                <table width="100%" class="table table-striped table-bordered table-hover list" id="dataTables-example">
                    <thead>
                        <tr>
                            <th class="cid" style="text-align: center">
                                <input type="checkbox" id="chkAll" />
                            </th>
                            <th>Mã số</th>
                            <th>Tên</th>
                            <th>Thực đơn</th>
                            <th>Hình</th>
                            <th>Ngày tạo</th>
                            <th>Người tạo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="ListTable" runat="server">
                            <AlternatingItemTemplate>
                                <tr class="even">
                                    <td style="text-align: center">
                                        <input type="checkbox" value='<%#Eval("ID") %>' name="cid" id="cid" /></td>
                                    <td><%#Eval("ID") %></td>
                                    <td class="link"><a href='EditProduct.aspx?cid=<%#Eval("ID") %>'><%#Eval("Name") %></a></td>

                                    <td><%# Eval("CategoryName") %></td>
                                    <td style="text-align: center">
                                        <img src="/Content/img/MonAn/<%# Eval("Images") %>" width="30" height="30" alt="<%#Eval("Name") %>" /></td>
                                    <td><%# Eval("CreateDate", "{0:dd/MM/yyyy}") %></td>
                                    <td><%# Eval("AccountName") %></td>
                                    
                                </tr>
                            </AlternatingItemTemplate>
                            <ItemTemplate>
                                <tr class="odd gradeX">
                                    <td style="text-align: center">
                                        <input type="checkbox" value='<%#Eval("ID") %>' name="cid" id="cid" /></td>
                                    <td><%#Eval("ID") %></td>
                                    <td class="link"><a href='EditProduct.aspx?cid=<%#Eval("ID") %>'><%#Eval("Name") %></a></td>

                                    <td><%# Eval("CategoryName") %></td>
                                    <td style="text-align: center">
                                        <img src="/Content/img/MonAn/<%# Eval("Images") %>" width="30" height="30" alt="<%#Eval("Name") %>" /></td>
                                    <td><%# Eval("CreateDate", "{0:dd/MM/yyyy}") %></td>
                                    <td><%# Eval("AccountName") %></td>
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


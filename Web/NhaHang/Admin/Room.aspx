<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="Room.aspx.cs" Inherits="Admin_Room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" Runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách thực đơn
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="well">
                    <input type="button" class="btn btn-primary" value="Thêm mới" onclick="location.href = 'EditRoom.aspx'" />
                    <asp:Button Text="Xóa" runat="server" ID="btnDelete" CssClass="multidelete btn btn-danger" />
                </div>
                <table width="100%" class="table table-striped table-bordered table-hover list" id="dataTables-example">
                    <thead>
                        <tr>
                            <th class="cid"  style="text-align: center">
                                <input type="checkbox" id="chkAll" />
                            </th>
                            <th>Mã số</th>
                            <th>Tên</th>
                            <th>Hình</th>
                            <th>Thông tin</th>
                            <th>Loại</th>
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
                                    <td class="link"><a href='EditRoom.aspx?cid=<%#Eval("ID") %>'><%#Eval("Name") %></a></td>
                                    <td style="text-align: center"><img src="/Admin/Images/<%# Eval("Images") %>" width="30" height="30" alt="<%#Eval("Name") %>"/></td>
                                    <td><%# Eval("About") %></td>
                                    <td><%# Eval("TypeName") %></td>
                                    <td><%# Eval("CreateDate") %></td>
                                    <td><%# Eval("AccountID") %></td>
                                </tr>
                            </AlternatingItemTemplate>
                            <ItemTemplate>
                                <tr class="odd gradeX">
                                    <td style="text-align: center">
                                        <input type="checkbox" value='<%#Eval("ID") %>' name="cid" id="cid" /></td>
                                    <td><%#Eval("ID") %></td>
                                    <td class="link"><a href='EditRoom.aspx?cid=<%#Eval("ID") %>'><%#Eval("Name") %></a></td>
                                    <td style="text-align: center"><img src="/Admin/Images/<%# Eval("Images") %>" width="30" height="30" alt="<%#Eval("Name") %>"/></td>
                                    <td><%# Eval("About") %></td>
                                    <td><%# Eval("TypeName") %></td>
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


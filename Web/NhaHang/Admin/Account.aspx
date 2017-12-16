<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminsite.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Admin_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Table" runat="Server">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách thực đơn
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="well">
                    <input type="button" class="btn btn-primary" value="Thêm mới" onclick="location.href = 'EditAccount.aspx'" />
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
                            <th>Email</th>
                            <th>Loại</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="ListTable" runat="server">
                            <AlternatingItemTemplate>
                                <tr class="even">
                                    <td style="text-align: center">
                                        <input type="checkbox" value='<%#Eval("ID") %>' name="cid" id="cid" /></td>
                                    <td><%#Eval("ID") %></td>
                                    <td class="link"><a href='EditAccount.aspx?cid=<%#Eval("ID") %>'><%#Eval("Name") %></a></td>
                                    <td style="text-align: center"><img src="/Content/img/Avatar/<%# Eval("Avatar") %>" width="30" height="30" alt="<%#Eval("Name") %>"/></td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("TypeName") %></td>
                                    <td><%# Eval("Status") %></td>
                                </tr>
                            </AlternatingItemTemplate>
                            <ItemTemplate>
                                <tr class="odd gradeX">
                                    <td style="text-align: center">
                                        <input type="checkbox" value='<%#Eval("ID") %>' name="cid" id="cid" /></td>
                                    <td><%#Eval("ID") %></td>
                                    <td class="link"><a href='EditAccount.aspx?cid=<%#Eval("ID") %>'><%#Eval("Name") %></a></td>
                                    <td style="text-align: center"><img src="/Content/img/Avatar/<%# Eval("Avatar") %>" width="30" height="30" alt="<%#Eval("Name") %>"/></td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("TypeName") %></td>
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


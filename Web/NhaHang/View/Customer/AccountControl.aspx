<%@ Page Title="" Language="C#" MasterPageFile="~/View/layout/site1.master" AutoEventWireup="true" CodeFile="AccountControl.aspx.cs" Inherits="View_Customer_AccountControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #carouselExampleIndicators {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bg-faded p-4 my-4">
        <hr class="divider" />
        <h2 class="text-center text-lg text-uppercase my-0">Quản lý<strong> tài khoản</strong>
        </h2>
        <hr class="divider" />
        <div class="row">
            <div class="col-3">
                <button class="list-group-item list-group-item-action" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Thông tin tài khoản</button>
                <button class="list-group-item list-group-item-action" type="button" data-toggle="collapse" data-target="#multiCollapseExample1" aria-expanded="false" aria-controls="multiCollapseExample1">Lịch sử đặt bàn</button>
            </div>
            <div class="col-9">
                <div class="col-12 mr-auto">
                    <div class="collapse" id="multiCollapseExample2" role="tabpanel">
                        <div class="card card-body">
                            <asp:Repeater ID="rpCusAcc" runat="server">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-6">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>Email:</td>
                                                        <td><%# Eval("Email") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Tên :</td>
                                                        <td><%# Eval("Name") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Đia chỉ: </td>
                                                        <td><%# Eval("Address") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Số điện thoại: </td>
                                                        <td><%# Eval("Phone") %></td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                        <div class="col-6">
                                            <img src="../../Content/img/Avatar/<%# Eval("Avatar")%>" />
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <div class="col-12 mr-auto">
                    <div class="collapse" id="multiCollapseExample1" role="tabpanel">
                        <div class="card card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Ngày mua</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Tổng giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpOrderHistory" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <th scope="row"><%# Eval("ID") %></th>
                                                <td><%# Eval("CreateDate") %></td>
                                                <td><%# Eval("Quantity") %></td>
                                                <td><%# Eval("TotalPrice") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


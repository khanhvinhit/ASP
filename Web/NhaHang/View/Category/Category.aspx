<%@ Page Title="" Language="C#" MasterPageFile="~/View/layout/site1.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="View_Category_Category" %>

<%@ Register Src="~/View/Product/TopFood.ascx" TagPrefix="uc1" TagName="TopFood" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #carouselExampleIndicators{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bg-faded p-4 my-4">
        <hr class="divider" />
        <h2 class="text-center text-lg text-uppercase my-0">Thực <strong>Đơn</strong> <a href="/ThucDon?Length=8"><span class="badge badge-danger">Xem Thêm</span></a>
        </h2>
        <hr class="divider" />
        <div class="row ">
            <asp:Repeater ID="SelectAll" runat="server">
                <ItemTemplate>
                    <div class="card col-md-5 mr-auto ml-auto mb-4" style="box-shadow: 5px 3px 5px #708090"">
                        <div class="card-header">
                            <%# Eval("Name") %>
                        </div>
                        <div class="card-body">
                            <img class="card-img-top mb-2" src="../../Content/img/Category/<%# Eval("Image") %>" style="max-height: 225px; height:auto;box-shadow: 5px 3px 5px #708090" alt="Card image cap" />
                            <a href="../Product/Detail.aspx?id=<%# Eval("ID") %>" class="btn btn-primary">Xem danh sách món ăn:</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <uc1:TopFood runat="server" ID="TopFood" />
</asp:Content>


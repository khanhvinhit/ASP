<%@ Page Title="" Language="C#" MasterPageFile="~/View/layout/site1.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="View_Product_Detail" %>

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
        <asp:Repeater ID="rpNameCategory" runat="server">
            <ItemTemplate>
                <h2 class="text-center text-lg text-uppercase my-0">Loại món ăn <strong><%# Eval("Name") %></strong>  <a href="../Category/Category.aspx"><span class="badge badge-danger">Quay Lại</span></a>            
                    </h2>
            </ItemTemplate>
        </asp:Repeater>                
        <hr class="divider" />

        <div class="row">
            <asp:Repeater ID="rpDetail" runat="server">
                <ItemTemplate>
                    <div class="media col-md-4 mt-4">
                        <div class="card" style="width: 20rem; box-shadow: 5px 3px 5px #708090">
                            <img class="card-img-top" src="../../Content/img/MonAn/<%# Eval("Images") %>" style="max-height: 225px; min-height: 225px" alt="Card image cap" />
                            <div class="card-body">
                                <h4 class="card-title"><%# Eval("Name") %> </h4>
                                <p class="card-text">
                                    Giá món ăn: <b style="color: #FF4000"><%# Eval("Price") %></b> VND
                                </p>
                                <div>
                                    <div class="col-sm-6 float-left">
                                       <a href="/View/Order/Order.aspx?action=add&id=<%# Eval("ID") %>" class="btn btn-info">Đặt món</a>
                                    </div>
                                    <div class="col-sm-5 float-left">
                                        <button style="font-family: 'Roboto Condensed', sans-serif" class="btn btn-info" data-toggle="modal" data-target=".bd-example-modal-lg-6-<%# Eval("ID") %>">Xem Chi Tiết</button>
                                    </div>
                                </div>
                                <div class="modal fade bd-example-modal-lg-6-<%# Eval("ID") %>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title"><%# Eval("Name") %></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body pre-scrollable text-center" style="min-height: 450px">
                                                <img src="../../Content/img/MonAn/<%# Eval("Images") %>" class="img-fluid" alt="Responsive image" style="width: 800px" />
                                                <p class="text-left"><%# Eval("Contents") %></p>
                                                <br />
                                                <p class="text-left">Số lần được đặt: <%# Eval("QuantityOrder") %></p>

                                            </div>
                                            <div class="card-footer text-muted" style="max-height: 60px">
                                                <div class="float-left ml-3">
                                                    <h6>Giá: <strong style="color: #FF4000"><%# Eval("Price") %> </strong>VND
                                                    </h6>
                                                </div>
                                                <div class="float-right col col-sm-8">
                                                    <div class="col-sm-6 float-left">
                                                        <button type="button" class="btn btn-block btn-secondary" data-dismiss="modal">Xem sau</button>
                                                    </div>
<<<<<<< HEAD
                                                    <div class="col-sm-4 float-left">
                                                        <a href="/View/Order/Order.aspx?action=add&id=<%# Eval("ID") %>" class="btn btn-info">Đặt món</a>
=======
                                                    <div class="col-sm-6 float-left">
                                                        <input type="submit" value="Đặt món" id="btnGioHang" class="btn btn-block btn-info" />
>>>>>>> 41829455d16eff855c3b07378f1cb60db575f6a3
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>        
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item"><asp:HyperLink ID="hlPagePre" runat="server">Previous</asp:HyperLink></li>
                <asp:Repeater ID="rpPage" runat="server" OnItemDataBound="rpPage_ItemDataBound">                    
                    <ItemTemplate>                        
                        <li class="page-item" id="li">
                            <asp:HyperLink ID="hlPage" runat="server">p</asp:HyperLink>
                        </li>
                    </ItemTemplate>                  
                </asp:Repeater>
                <li class="page-item"><asp:HyperLink ID="hlPageNe" runat="server" >Next</asp:HyperLink></li>
            </ul>
        </nav>   
    </div> 
    <uc1:TopFood runat="server" ID="TopFood" />
</asp:Content>


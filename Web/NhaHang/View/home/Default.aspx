<%@ Page Title="" Language="C#" MasterPageFile="~/View/layout/site1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="View_home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bg-faded p-4 my-4">
        <hr class="divider" />
        <h2 class="text-center text-lg text-uppercase my-0">Món <strong>Ngon</strong> <a href="/ThucDon?Length=8"><span class="badge badge-danger">Xem Thêm</span></a>
        </h2>
        <hr class="divider" />
        <div class="row">
            <asp:Repeater ID="NewCreate" runat="server">
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
                                            <input type="submit" value="đặt món" id="btngiohang" class="btn btn-info" />

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
                                                <p class="text-left">Số lần được đặt: 0</p>

                                            </div>
                                            <div class="card-footer text-muted" style="max-height: 60px">
                                                <div class="float-left ml-3">
                                                    <h6>Giá: <strong style="color: #FF4000"><%# Eval("Price") %> </strong>VND
                                                    </h6>
                                                </div>
                                                <div class="float-right col col-sm-4">
                                                    <div class="col-sm-6 float-left">
                                                        <button type="button" class="btn btn-block btn-secondary" data-dismiss="modal">Xem sau</button>
                                                    </div>
                                                    <div class="col-sm-4 float-left">
                                                        <input type="submit" value="Đặt món" id="btnGioHang" class="btn btn-block btn-info" />
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
    </div> 
    <div class="bg-faded p-4 my-4">
        <hr class="divider" />
        <h2 class="text-center text-lg text-uppercase my-0">Món ăn được <strong>xem nhiều</strong> <a href="/ThucDon?Length=8"><span class="badge badge-danger">Xem Thêm</span></a>
        </h2>
        <hr class="divider" />
        <div class="row">
            <asp:Repeater ID="TopHot" runat="server">
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
                                            <input type="submit" value="đặt món" id="btngiohang" class="btn btn-info" />

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
                                                <p class="text-left">Số lần được đặt: 0</p>

                                            </div>
                                            <div class="card-footer text-muted" style="max-height: 60px">
                                                <div class="float-left ml-3">
                                                    <h6>Giá: <strong style="color: #FF4000"><%# Eval("Price") %> </strong>VND
                                                    </h6>
                                                </div>
                                                <div class="float-right col col-sm-4">
                                                    <div class="col-sm-6 float-left">
                                                        <button type="button" class="btn btn-block btn-secondary" data-dismiss="modal">Xem sau</button>
                                                    </div>
                                                    <div class="col-sm-4 float-left">
                                                        <input type="submit" value="Đặt món" id="btnGioHang" class="btn btn-block btn-info" />
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
    </div>     
</asp:Content>


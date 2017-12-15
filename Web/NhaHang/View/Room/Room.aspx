<%@ Page Title="" Language="C#" MasterPageFile="~/View/layout/site1.master" AutoEventWireup="true" CodeFile="Room.aspx.cs" Inherits="View_Room_Room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css' />
    <link href="../../Content/css/Room.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bg-faded p-4 my-4">
        <hr class="divider" />

        <h2 class="text-center text-lg text-uppercase my-0"><strong>Không Gian Nhà Hàng</strong><a href="../Category/Category.aspx"><span class="badge badge-danger">Quay Lại</span></a>
        </h2>

        <hr class="divider" />
        <asp:Repeater ID="room" runat="server">
            <ItemTemplate>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header" role="tab" id="heading-<%# Eval("ID") %>">
                                    <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" href="#collapse-<%# Eval("ID") %>" aria-expanded="false" aria-controls="collapse-<%# Eval("ID") %>">
                                            <%# Eval("Name") %>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapse-<%# Eval("ID") %>" class="collapse" role="tabpanel" aria-labelledby="heading-<%# Eval("ID") %>" data-parent="#accordion">
                                    <div class="card-body">
                                        <%# Eval("About") %>
                                    </div>

                                </div>
                            </div>

                            <!-- begin macbook pro mockup -->
                            <div class="md-macbook-pro md-glare">
                                <div class="md-lid">
                                    <div class="md-camera"></div>
                                    <div class="md-screen">
                                        <!-- content goes here -->
                                        <div class="tab-featured-image">
                                            <div class="tab-content">
                                                <div class="tab-pane  in active" >
                                                    <img class="card-img-top" src="../../Content/img/<%# Eval("Images") %>"  alt="Card image cap"  />
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="md-base"></div>
                            </div>
                            <!-- end macbook pro mockup -->
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/View/layout/site1.master" AutoEventWireup="true" CodeFile="Room.aspx.cs" Inherits="View_Room_Room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css' />
    <link href="../../Content/css/Room.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bg-faded p-4 my-4">
        <hr class="divider" />
        <h2 class="text-center text-lg text-uppercase my-0">Giới  <strong>Thiệu</strong> <a href="/ThucDon?Length=8"><span class="badge badge-danger">Danh Sách phòng</span></a>
        </h2>
        <hr class="divider" />
        <div class="row ">

            <asp:Repeater ID="room" runat="server">
                <ItemTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4">
                                <!-- begin panel group -->
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

                                    <!-- panel 1 -->
                                    <div class="panel panel-default">
                                        <!--wrap panel heading in span to trigger image change as well as collapse -->
                                        <span class="side-tab" data-target="#tab1" data-toggle="tab" role="tab" aria-expanded="false">
                                            <div class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="true" aria-controls="collapseOne">
                                                <h4 class="panel-title"><%# Eval("Name") %></h4>
                                           <%--     <p><%# Eval("About") %></p>--%>
                                            </div>
                                        </span>

                                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="panel-body">
                                                <!-- Tab content goes here -->
                                                <p><%# Eval("About") %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                    <!--wrap panel heading in span to trigger image change as well as collapse -->
                    <span class="side-tab" data-target="#tab2" data-toggle="tab" role="tab" aria-expanded="false">
                        <div class="panel-heading" role="tab" id="headingTwo" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <h4 class="panel-title collapsed"><%# Eval("Name","Lầu dưới") %> </h4>
                        </div>
                    </span>

                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                        <!-- Tab content goes here -->
                        tầng  dưới gồm có tất cả 
                        </div>
                    </div>
                </div>
                <!-- / panel 2 -->
                
                <!--  panel 3 -->
                <div class="panel panel-default">
                    <!--wrap panel heading in span to trigger image change as well as collapse -->
                    <span class="side-tab" data-target="#tab3" data-toggle="tab" role="tab" aria-expanded="false">
                        <div class="panel-heading" role="tab" id="headingThree"  class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <h4 class="panel-title">TAB 3 </h4>
                        </div>
                    </span>

                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                          <div class="panel-body">
                          <!-- tab content goes here -->
                           tab 3 content
                          </div>
                        </div>
                      </div>
                            </div>
                        </div>
                        <!--/ .row -->
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>

</asp:Content>


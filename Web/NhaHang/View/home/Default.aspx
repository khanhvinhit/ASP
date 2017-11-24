<%@ Page Title="" Language="C#" MasterPageFile="~/View/layout/site1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="View_home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <hr class="divider"/>
    <h2 class="text-center text-lg text-uppercase my-0">Món <strong>Ngon</strong> <a href="/ThucDon?Length=8"><span class="badge badge-danger">Xem Thêm</span></a>
    </h2>
    <hr class="divider"/>
    <div class="row">
        <div class="media col-md-4">
            <div class="card" style="width: 20rem; box-shadow: 5px 3px 5px #708090">
                <img class="card-img-top" src="../../Content/img/MonAn/cach-lam-sushi-ca-hoi12.jpg" style="max-height: 225px; min-height: 225px" alt="Card image cap" />
                <div class="card-body">
                    <h4 class="card-title">sushi thịt c&#225; hồi </h4>
                    <p class="card-text">
                        Giá món ăn: <b style="color: #FF4000">80.000</b> VND
                    </p>
                    <div>
                        <div class="col-sm-6 float-left">
                            <form action="/DatBan/ThemGioHang?iMaSP=6&amp;iLoaiDat=1&amp;strURL=http%3A%2F%2Flocalhost%3A60754%2FTrangChu%2FIndex" method="post">
                                <input type="submit" value="Đặt món" id="btnGioHang" class="btn btn-info" />
                            </form>
                        </div>
                        <div class="col-sm-5 float-left">
                            <button style="font-family: 'Roboto Condensed', sans-serif" class="btn btn-info" data-toggle="modal" data-target=".bd-example-modal-lg-6-3">Xem Chi Tiết</button>
                        </div>
                    </div>

                    <div class="modal fade bd-example-modal-lg-6-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">sushi thịt c&#225; hồi</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body pre-scrollable text-center" style="min-height: 450px">
                                    <img src="../../Content/img/MonAn/cach-lam-sushi-ca-hoi12.jpg" class="img-fluid" alt="Responsive image" style="width: 800px" />
                                    <p class="text-left">C&#243; nhiều c&#225;ch kết hợp để ra một m&#243;n sushi ho&#224;n chỉnh. Trong đ&#243; số đ&#243;, sự kết hợp t&#224;i t&#236;nh của vị tươi ngon của c&#225; hồi c&#249;ng vị b&#233;o của bơ s&#225;p sẽ lu&#244;n l&#224;m mọi người th&#237;ch th&#250; với m&#243;n sushi c&#225;c hồi. </p>
                                    <br />
                                    <p class="text-left">Số lần được đặt: 0</p>

                                </div>
                                <div class="card-footer text-muted" style="max-height: 60px">
                                    <div class="float-left ml-3">
                                        <h6>Giá: <strong style="color: #FF4000">80.000 </strong>VND
                                        </h6>
                                    </div>
                                    <div class="float-right col col-sm-4">
                                        <div class="col-sm-6 float-left">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Xem sau</button>
                                        </div>
                                        <div class="col-sm-4 float-left">
                                            <form action="/DatBan/ThemGioHang?iMaSP=6&amp;iLoaiDat=1&amp;strURL=http%3A%2F%2Flocalhost%3A60754%2FTrangChu%2FIndex" method="post">
                                                <input type="submit" value="Đặt món" id="btnGioHang" class="btn btn-info" />
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="media col-md-4">
            <div class="card" style="width: 20rem; box-shadow: 5px 3px 5px #708090">
                <img class="card-img-top" src="../../Content/img/MonAn/sushi-trung-ca-hoi.jpg" style="max-height: 225px; min-height: 225px" alt="Card image cap" />
                <div class="card-body">
                    <h4 class="card-title">sushi trứng c&#225; hồi </h4>
                    <p class="card-text">
                        Giá món ăn: <b style="color: #FF4000">50.000</b> VND
                    </p>
                    <div>
                        <div class="col-sm-6 float-left">
                            <form action="/DatBan/ThemGioHang?iMaSP=5&amp;iLoaiDat=1&amp;strURL=http%3A%2F%2Flocalhost%3A60754%2FTrangChu%2FIndex" method="post">
                                <input type="submit" value="Đặt món" id="btnGioHang" class="btn btn-info" />
                            </form>
                        </div>
                        <div class="col-sm-5 float-left">
                            <button style="font-family: 'Roboto Condensed', sans-serif" class="btn btn-info" data-toggle="modal" data-target=".bd-example-modal-lg-5-3">Xem Chi Tiết</button>
                        </div>
                    </div>

                    <div class="modal fade bd-example-modal-lg-5-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">sushi trứng c&#225; hồi</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body pre-scrollable text-center" style="min-height: 450px">
                                    <img src="../../Content/img/MonAn/sushi-trung-ca-hoi.jpg" class="img-fluid" alt="Responsive image" style="width: 800px"/>
                                    <p class="text-left">Lo&#224;i c&#225; hồi (tự nhi&#234;n) vốn l&#224; một loại c&#225; qu&#253;, ngon v&#224; được ưa chuộng tr&#234;n khắp thế giới. Cũng như thịt c&#225; hồi, trứng của lo&#224;i c&#225; n&#224;y cũng chứa h&#224;m lượng dinh dưỡng rất cao. Việc t&#225;ch trứng khỏi c&#225; hồi, chế biến v&#224; bảo quản v&#244; c&#249;ng khắt khe.</p>
                                    <br />
                                    <p class="text-left">Số lần được đặt: 0</p>

                                </div>
                                <div class="card-footer text-muted" style="max-height: 60px">
                                    <div class="float-left ml-3">
                                        <h6>Giá: <strong style="color: #FF4000">50.000 </strong>VND
                                        </h6>
                                    </div>
                                    <div class="float-right col col-sm-4">
                                        <div class="col-sm-6 float-left">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Xem sau</button>
                                        </div>
                                        <div class="col-sm-4 float-left">
                                            <form action="/DatBan/ThemGioHang?iMaSP=5&amp;iLoaiDat=1&amp;strURL=http%3A%2F%2Flocalhost%3A60754%2FTrangChu%2FIndex" method="post">
                                                <input type="submit" value="Đặt món" id="btnGioHang" class="btn btn-info" />
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="media col-md-4">
            <div class="card" style="width: 20rem; box-shadow: 5px 3px 5px #708090">
                <img class="card-img-top" src="../../Content/img/MonAn/Otoro.jpg" style="max-height: 225px; min-height: 225px" alt="Card image cap"/>
                <div class="card-body">
                    <h4 class="card-title">Otoro(Bụng c&#225; ngừ) </h4>
                    <p class="card-text">
                        Giá món ăn: <b style="color: #FF4000">100.000</b> VND
                    </p>
                    <div>
                        <div class="col-sm-6 float-left">
                            <form action="/DatBan/ThemGioHang?iMaSP=4&amp;iLoaiDat=1&amp;strURL=http%3A%2F%2Flocalhost%3A60754%2FTrangChu%2FIndex" method="post">
                                <input type="submit" value="Đặt món" id="btnGioHang" class="btn btn-info" />
                            </form>
                        </div>
                        <div class="col-sm-5 float-left">
                            <button style="font-family: 'Roboto Condensed', sans-serif" class="btn btn-info" data-toggle="modal" data-target=".bd-example-modal-lg-4-3">Xem Chi Tiết</button>
                        </div>
                    </div>

                    <div class="modal fade bd-example-modal-lg-4-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Otoro(Bụng c&#225; ngừ)</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body pre-scrollable text-center" style="min-height: 450px">
                                    <img src="../../Content/img/MonAn/Otoro.jpg" class="img-fluid" alt="Responsive image" style="width: 800px" />
                                    <p class="text-left">L&#224; phần bụng v&#224; cũng l&#224; phần c&#243; gi&#225; trị nhất bởi vị b&#233;o thơm ngon của n&#243;. Được l&#226;́y từ lớp thịt b&#234;n dưới của cá g&#226;̀n với đ&#226;̀u cá, otoro c&#243; m&#224;u hồng nhạt bắt mắt, xen giữa l&#224; những thớ mỡ trắng đặc trưng.</p>
                                    <br />
                                    <p class="text-left">Số lần được đặt: 0</p>
                                </div>
                                <div class="card-footer text-muted" style="max-height: 60px">
                                    <div class="float-left ml-3">
                                        <h6>Giá: <strong style="color: #FF4000">100.000 </strong>VND
                                        </h6>
                                    </div>
                                    <div class="float-right col col-sm-4">
                                        <div class="col-sm-6 float-left">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Xem sau</button>
                                        </div>
                                        <div class="col-sm-4 float-left">
                                            <form action="/DatBan/ThemGioHang?iMaSP=4&amp;iLoaiDat=1&amp;strURL=http%3A%2F%2Flocalhost%3A60754%2FTrangChu%2FIndex" method="post">
                                                <input type="submit" value="Đặt món" id="btnGioHang" class="btn btn-info" />
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


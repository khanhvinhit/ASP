<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Trang quản trị hệ thống	</title>

	<!-- Bootstrap Core CSS -->
	<link href="Content/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- MetisMenu CSS -->
	<link href="Content/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="Content/dist/css/sb-admin-2.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="Content/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Đăng nhập vào hệ thống</h3>
					</div>
					<div class="panel-body">
						<form role="form" id="frm" runat="server">
							<fieldset>
								<div class="form-group">
									<asp:TextBox
										ID="txtEmail"
										runat="server"
										CssClass="form-control">
									</asp:TextBox>
									<asp:RequiredFieldValidator
										ID="RequiredFieldValidator1"
										runat="server"
										ControlToValidate="txtEmail"
										Display="Dynamic"
										Font-Size="8pt">(*)
									</asp:RequiredFieldValidator>
								</div>

								<div class="form-group">
									<asp:TextBox
										ID="txtPassword"
										runat="server"
										CssClass="form-control"
										TextMode="Password">
									</asp:TextBox>
									<asp:RequiredFieldValidator
										ID="RequiredFieldValidator2"
										runat="server"
										ControlToValidate="txtPassword"
										Display="Dynamic"
										Font-Size="8pt">(*)
									</asp:RequiredFieldValidator>
								</div>
								<asp:Button ID="btnLogin"
									runat="server"
									CssClass="btn btn-lg btn-success btn-block"
									Text="Đăng nhập"
									Font-Bold="False" 
									OnClick="btnLogin_Click"/>

							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="Content/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="Content/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="Content/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="Content/dist/js/sb-admin-2.js"></script>

</body>

</html>


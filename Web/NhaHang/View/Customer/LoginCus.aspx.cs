﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.Classes;
using System.Data;

public partial class View_Customer_LoginCus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["idCus"] != null)
        {
            Response.Redirect("/View/home/Default.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        KiemTra(txtEmail.Text + "", Common.MaHoapass(txtPassword.Text).Trim());
    }
    private void KiemTra(string email,string pass)
    {
        DataTable dt = tblAccount.Check_Login(email, pass).Tables[0];
        int num = 0;
        if (dt.Rows.Count > 0)
        {
            num = int.Parse("0" + dt.Rows[0][0]);
            switch (num)
            {
                case 0: // Khai báo Session cho phép đăng nhập
                    tblAccount account = tblAccount.Get_Accounts_By_Email(email);
                    Session["idCus"] = account.ID;
                    Session["emailCus"] = account.Email;
                    Session["typeidCus"] = account.TypeID;
                    Session["nameCus"] = account.Name;
                    if (account.TypeID == 1 || account.TypeID == 2 )
                    {
                        Session["id"] = account.ID;
                        Session["email"] = account.Email;
                        Session["type"] = account.TypeName;
                        Session["typeID"] = account.TypeID;
                        Session["name"] = account.Name;
                        Session["avatar"] = account.Avatar;
                    }
                    Response.Redirect("/View/home/Default.aspx");
                    break;
                case 1: //Thông báo tên đăng nhập không tồn tại
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Tên đăng nhập không tồn tại');", true);
                    break;
                case 2: // thông báo sai mật khẩu
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi; Mật khẩu đăng nhập không đúng!');", true);
                    break;
                case 3: //thông báo email đã bị khóa
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Tên đăng nhập này đã bị khóa!');", true);
                    break;
                case 4: // Thông báo phải đổi mật khẩu và chuyển người dùng đến trang Doipass.aspx
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Bạn phải đổi mật khẩu trước khi đăng nhập!');", true);
                    break;
            }
        }
        dt.Dispose();
    }
}
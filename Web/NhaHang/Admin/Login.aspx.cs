using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using DataAccess.Classes;
using DataAccess;

public partial class Admin_Login : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
        
        if (Session["email"] != null)
        {
            Response.Redirect("Default.aspx");
        }txtEmail.Focus();
    }
    
    protected void btnLogin_Click(object sender, EventArgs e)
	{
		KiemTraNhap(txtEmail.Text + "", Common.MaHoapass(txtPassword.Text).Trim());
	}

    private void KiemTraNhap(string email, string pass)
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
                    Session["id"] = account.ID;
                    Session["email"] = account.Email;
                    Session["type"] = account.Type;
                    Session["name"] = account.Name;
                    Session["avatar"] = account.Avatar;

                    Response.Redirect("Default.aspx");
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
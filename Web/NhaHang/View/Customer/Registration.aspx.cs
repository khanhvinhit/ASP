using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using DataAccess;

public partial class View_Customer_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        if (txtPassword.Text != txtPassword2.Text)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Mật khẩu sai!');", true);
        }
        else
        {
            if (tblAccount.Get_Accounts_By_Email(txtEmail.Text) != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Email đã tồn tại! Hãy nhập email khác!!');", true);
            }
            else
            {
                Registration(txtEmail.Text,txtName.Text, txtPassword.Text);
                //Response.Redirect("/View/Customer/LoginCus.aspx");
            }
            
        }
    }
    private void Registration(string email,string name, string pass)
    {
        tblAccount acc = null;
        acc = new tblAccount();
        acc.Email = email;
        acc.Password = Common.MaHoapass(pass);
        acc.TypeName = "Khách hàng";
        acc.Status = true;
        acc.Name = name;
        acc.Avatar = null;
        acc.Address = null;
        acc.Phone = null;
        if (tblAccount.Add(acc)!=false)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "var r=confirm('Đã đăng ký thành công! Tài khoản cần được xác nhận!'); if(r==true){window.location='/View/Customer/LoginCus.aspx';}", true);


        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Đăng ký không thành công!');", true);
        }
    }
}
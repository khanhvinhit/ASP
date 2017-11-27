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

public partial class Admin_Login : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
        txtEmail.Focus();
		if (Session["email"] != null)
		{
			Response.Redirect("Default.aspx");
		}
	}
    
    protected void btnLogin_Click(object sender, EventArgs e)
	{
		KiemTraNhap(txtEmail.Text + "", MaHoapass(txtPassword.Text).Trim());
	}

	private void KiemTraNhap(string email, string pass)
	{
		DataTable dtb = StoreToDataTable(email, pass);
		int num = 0;
		if (dtb.Rows.Count > 0)
		{
			num = int.Parse("0" + dtb.Rows[0][0]);
			switch (num)
			{
				case 0: // Khai báo Session cho phép đăng nhập
			        tblAccount account = tblAccount.Get_Accounts_By_Email(email);
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
					ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Bạn phải đổi mật khẩu trước khi đăng nhập!');location.href='Doipass.aspx?userid=" + email + "'", true);
					break;
			}
		}
		dtb.Dispose();
	}
	public string MaHoapass(string password)
	{
		MD5 md5 = new MD5CryptoServiceProvider();

		//Compute hash from the bytes of text
		md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(password));

		//Get hash result after compute it
		byte[] result = md5.Hash;

		StringBuilder strBuilder = new StringBuilder();
		for (int i = 0; i < result.Length; i++)
		{
			//Change it into 2 hexadecimal digits
			//For each byte
			strBuilder.Append(result[i].ToString("x2"));
		}

		return strBuilder.ToString();
	}
	private static DataSet ThucThiStore_DataSet(string StoredProcedure, params SqlParameter[] Parameters)
	{
	    string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; ;// @"Data Source=.\SQLEXPRESS;Initial Catalog=NhaHang;Integrated Security=True";
		SqlConnection Conn = new SqlConnection(ConnectionString);
		SqlCommand Command = new SqlCommand(StoredProcedure, Conn);
		if (Parameters != null)
		{
			Command.Parameters.Clear();
			Command.Parameters.AddRange(Parameters);
		}
		DataSet ds = new DataSet();
		SqlDataAdapter da = new SqlDataAdapter(StoredProcedure, Conn);
		Command.CommandType = CommandType.StoredProcedure;
		da.SelectCommand = Command;
		try
		{
			Conn.Open();
			da.Fill(ds);
		}
		finally
		{
			if (Conn.State == ConnectionState.Open)
				Conn.Close();
			Conn.Dispose();
		}
		return ds;
	}
	private DataTable StoreToDataTable(string email, string pass)
	{
		SqlParameter[] arrParam = {
            new SqlParameter("@Email", SqlDbType.NVarChar),
            new SqlParameter("@Password", SqlDbType.NVarChar)
            };
		arrParam[0].Value = email;
		arrParam[1].Value = pass;
		return ThucThiStore_DataSet("SP_Login", arrParam).Tables[0];
	}
}
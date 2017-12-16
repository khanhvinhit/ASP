using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class Admin_EditAbout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null && Session["typeID"].GetHashCode() == 1)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                PopulateControls();
            }
        }
    }

    private void PopulateControls()
    {
        string cid = Request.QueryString["cid"] ?? "";
        if (cid != "")
        {
            tblAbout data = tblAbout.Single(cid);
            if (data == null)
                Response.Redirect("~/Admin/Account.aspx");

            lblTitle.Text = "Cập nhật giới thiệu";

            lblId.Text = data.ID.ToString();

            txtName.Text = data.Name;
            txtURLMap.Text = data.Name;
            txtAddress.Text = data.Address;
            txtEmail.Text = data.Email;
            txtPhone.Text = data.Phone1;
            txtPhone2.Text = data.Phone2;
            txtContents.InnerText = data.Contents;
            btnReset.Visible = false;
        }
        else
        {
            // Khong co QueryString cid ==> them moi category  
            // Dat ten trang web             
            lblTitle.Text = "Thêm mới giới thiệu";
            // Hien nut reset (xoa trang form de nhap lai)   
            btnReset.Visible = true;


        }
    }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e); // Them su kien cho nut Save      
        btnSave.Click += new EventHandler(btnSave_Click);
    } // Lay du lieu tu form de them moi/cap nhat     

    private tblAbout GetData()
    {
        tblAbout data = null;
        if (lblId.Text != "")
            // lay thong tin cu tu Database de cap nhat     
            data = tblAbout.Single(lblId.Text);
        else
            data = new tblAbout();
        data.Name = txtName.Text;
        data.URLMap = txtURLMap.Text;
        data.Address = txtAddress.Text;
        data.Email = txtEmail.Text;
        data.Phone1 = txtPhone.Text;
        data.Phone2 = txtPhone2.Text;
        data.Contents = txtContents.InnerText;
        data.AccountID = (int)Session["id"];
        data.CreateDate = DateTime.Now;
        return data;
    }

    private void btnSave_Click(object sender, EventArgs e)
    {
        // Neu tat ca du lieu deu duoc nhap hop le       
        if (Page.IsValid)
        {
            bool rs = false;
            // Lay du lieu tu form            
            tblAbout data = GetData();
            // ID > 0 ==> Cap nhat va hien thong bao    
            if (data.ID > 0)
            {
                rs = tblAbout.Update(data);
                lblStatus.Text = rs ? "Cập nhật thành công." : "Cập nhật lỗi.";
            }
            else
            {
                rs = tblAbout.Add(data);
                lblStatus.Text = rs ? "Thêm mới thành công." : "Thêm mới lỗi.";
                // Neu them thanh cong thi xoa trang form de them tiep               
                if (rs)
                    ResetForm();
            }
        }
    } // Xoa trang form     

    bool CheckFileType(string fileName)
    {

        string ext = Path.GetExtension(fileName);
        switch (ext.ToLower())
        {
            case ".gif":
                return true;
            case ".png":
                return true;
            case ".jpg":
                return true;
            case ".jpeg":
                return true;
            default:
                return false;
        }
    }
    private void ResetForm()
    {
        lblId.Text = "";
        
    }
}
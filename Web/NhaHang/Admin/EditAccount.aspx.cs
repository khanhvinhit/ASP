using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.Classes;

public partial class Admin_EditAccount : System.Web.UI.Page
{
    private string img;
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
        int i = 0;
        foreach (tblAccountType itType in tblAccountType.Get_All())
        {
            txtType.Items.Insert(i, new ListItem(itType.Name, itType.ID.ToString()));
            i++;
        }
        string cid = Request.QueryString["cid"] ?? "";
        // Neu co QueryString cid ==> cap nhat Category         
        if (cid != "")
        {
            // Lay category theo gia tri cid             
            tblAccount data = tblAccount.Single(cid);
            // Khong ton tai category nay trong he thong             
            // chuyen huong ve trang Category.aspx             
            if (data == null)
                Response.Redirect("~/Admin/Account.aspx");

            // Nguoc lai thi dua du lieu vao form de tien hanh cap nhap 

            // Dat ten trang web             
            lblTitle.Text = "Cập nhật tài khoản";

            // Luu lai gia tri ID cua category hien dang cap nhat 
            lblId.Text = data.ID.ToString();

            // Gan cac thong tin con lai vao form             
            txtEmail.Text = data.Email;
            data.Password = "";
            txtType.SelectedIndex = txtType.Items.IndexOf(txtType.Items.FindByText(data.TypeName));

            txtName.Text = data.Name;
            txtAddress.Text = data.Address;
            txtPhone.Text = data.Phone;
            txtStatus.Checked = data.Status == true ? true : false;
            Image1.ImageUrl = "/Content/img/Avatar/" + data.Avatar;
            btnReset.Visible = false;
        }
        else
        {
            // Khong co QueryString cid ==> them moi category  
            // Dat ten trang web             
            lblTitle.Text = "Thêm mới tài khoản";
            // Hien nut reset (xoa trang form de nhap lai)   
            btnReset.Visible = true;
            txtType.Controls.Clear();
            txtType.DataBind();


        }
    }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e); // Them su kien cho nut Save      
        btnSave.Click += new EventHandler(btnSave_Click);
    } // Lay du lieu tu form de them moi/cap nhat     

    private tblAccount GetData()
    {
        tblAccount data = null;
        if (lblId.Text != "")
            // lay thong tin cu tu Database de cap nhat     
            data = tblAccount.Single(lblId.Text);
        else
            data = new tblAccount();
        data.Email = txtEmail.Text;
        data.Password = Common.MaHoapass(txtPassword.Text);
        data.TypeName = txtType.SelectedValue;
        data.Name = txtName.Text;
        data.Avatar = img;
        data.Address = txtAddress.Text;
        data.Phone = txtPhone.Text;
        data.Status = txtStatus.Checked ? true : false;
        return data;
    }

    private void btnSave_Click(object sender, EventArgs e)
    {
        // Neu tat ca du lieu deu duoc nhap hop le       
        if (Page.IsValid)
        {
            if (FileUpload1.HasFile && CheckFileType(FileUpload1.FileName))
            {
                string fileName = "/Content/img/Avatar/" + DateTime.Now.ToString("ddMMyyyy_") + txtName.Text + Path.GetExtension(FileUpload1.FileName);
                string filePath = MapPath(fileName);
                FileUpload1.SaveAs(filePath);
                Image1.ImageUrl = fileName;
                img = DateTime.Now.ToString("ddMMyyyy_") + txtName.Text + Path.GetExtension(FileUpload1.FileName);
            }
            bool rs = false;
            // Lay du lieu tu form            
            tblAccount data = GetData();
            // ID > 0 ==> Cap nhat va hien thong bao    
            if (data.ID > 0)
            {
                if (txtPassword.Text == "")
                {
                    lblStatus.Text = "Bạn chưa nhập mật khẩu.";
                }
                else
                {
                    if (Common.MaHoapass(txtPassword.Text) != data.Password)
                    {
                        lblStatus.Text = "Mật khẩu không đúng.";
                    }
                    else
                    {
                        rs = tblAccount.Update(data);
                        lblStatus.Text = rs ? "Cập nhật thành công." : "Cập nhật lỗi.";

                    }

                }
            }
            else
            {
                rs = tblAccount.Add(data);
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
        txtName.Text = "";
        img = null;
    }
}
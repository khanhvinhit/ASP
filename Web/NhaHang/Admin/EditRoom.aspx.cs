using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EditRoom : System.Web.UI.Page
{
    private string img;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
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
        foreach (tblRoomType item in tblRoomType.Get_All())
        {
            txtTypeName.Items.Insert(i, new ListItem(item.Name, item.ID.ToString()));
            i++;
        }
        string cid = Request.QueryString["cid"] ?? "";
        // Neu co QueryString cid ==> cap nhat Category         
        if (cid != "")
        {

            // Lay category theo gia tri cid             
            tblRoom data = tblRoom.Single(cid);
            // Khong ton tai category nay trong he thong             
            // chuyen huong ve trang Category.aspx             
            if (data == null)
                Response.Redirect("~/Admin/Category.aspx");

            // Nguoc lai thi dua du lieu vao form de tien hanh cap nhap 

            // Dat ten trang web             
            lblTitle.Text = "Cập nhật thực đơn";

            // Luu lai gia tri ID cua category hien dang cap nhat 
            lblId.Text = data.ID.ToString();

            // Gan cac thong tin con lai vao form             
            txtName.Text = data.Name;
            txtAbout.Text = data.About;
            txtTypeName.SelectedIndex = txtTypeName.Items.IndexOf(txtTypeName.Items.FindByText(data.TypeName));
            Image1.ImageUrl = "/Admin/Images/" + data.Images;
            btnReset.Visible = false;
        }
        else
        {
            // Khong co QueryString cid ==> them moi category  
            // Dat ten trang web             
            lblTitle.Text = "Thêm mới thực đơn";
            txtTypeName.Controls.Clear();
            txtTypeName.DataBind();
            
            // Hien nut reset (xoa trang form de nhap lai)   
            btnReset.Visible = true;
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e); // Them su kien cho nut Save      
        btnSave.Click += new EventHandler(btnSave_Click);
    } // Lay du lieu tu form de them moi/cap nhat     

    private tblRoom GetData()
    {
        tblRoom data = null;
        if (lblId.Text != "")
            // lay thong tin cu tu Database de cap nhat     
            data = tblRoom.Single(lblId.Text);
        else
            data = new tblRoom(); // them moi     
        // lay Name tu textbox Name       
        data.Name = txtName.Text;
        // lay Description tu textbox Description    
        data.Images = img;
        data.CreateDate = DateTime.Now;
        data.AccountID = (int)Session["id"];
        return data;
    }

    private void btnSave_Click(object sender, EventArgs e)
    {
        // Neu tat ca du lieu deu duoc nhap hop le       
        if (Page.IsValid)
        {
            if (FileUpload1.HasFile && CheckFileType(FileUpload1.FileName))
            {
                string fileName = "/Admin/Images/" + DateTime.Now.ToString("ddMMyyyy_") + txtName.Text + Path.GetExtension(FileUpload1.FileName);
                string filePath = MapPath(fileName);
                FileUpload1.SaveAs(filePath);
                Image1.ImageUrl = fileName;
                img = DateTime.Now.ToString("ddMMyyyy_") + txtName.Text + Path.GetExtension(FileUpload1.FileName);
            }
            bool rs = false;
            // Lay du lieu tu form            
            tblRoom data = GetData();
            // ID > 0 ==> Cap nhat va hien thong bao    
            if (data.ID > 0)
            {
                rs = tblRoom.Update(data);
                lblStatus.Text = rs ? "Cập nhật thành công." : "Cập nhật lỗi.";
            }
            else
            {
                rs = tblRoom.Add(data);
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
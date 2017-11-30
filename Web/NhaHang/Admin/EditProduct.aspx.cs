using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.Classes;

public partial class Admin_EditProduct : System.Web.UI.Page
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
        foreach (tblCategory itType in tblCategory.All())
        {
            txtType.Items.Insert(i, new ListItem(itType.Name, itType.ID.ToString()));
            i++;
        }
        string cid = Request.QueryString["cid"] ?? "";       
        if (cid != "")
        {          
            tblProduct data = tblProduct.Single(cid);          
            if (data == null)
                Response.Redirect("~/Admin/Account.aspx");
           
            lblTitle.Text = "Cập nhật món ăn";
            
            lblId.Text = data.ID.ToString();
        
            txtName.Text = data.Name;
            txtPrice.Text = data.Price.ToString();
            txtType.SelectedIndex = txtType.Items.IndexOf(txtType.Items.FindByValue(data.CategoryID.ToString()));
            txtDiscount.Text = data.Discount.ToString();
            txtContents.InnerText = data.Contents;
            txtQuantity.Text = data.QuantityOrder.ToString();
            
            
            Image1.ImageUrl = "/Content/img/MonAn/" + data.Images;
            btnReset.Visible = false;
        }
        else
        {
            // Khong co QueryString cid ==> them moi category  
            // Dat ten trang web             
            lblTitle.Text = "Thêm mới món ăn";
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

    private tblProduct GetData()
    {
        tblProduct data = null;
        if (lblId.Text != "")
            // lay thong tin cu tu Database de cap nhat     
            data = tblProduct.Single(lblId.Text);
        else
            data = new tblProduct();
        data.Name = txtName.Text;
        data.Price = Convert.ToDecimal(txtPrice.Text);
        data.CategoryID = Convert.ToInt32(txtType.SelectedValue);
        data.Discount = Convert.ToInt32(txtDiscount.Text);
        data.Contents = txtContents.InnerText;
        data.QuantityOrder = Convert.ToInt32(txtQuantity.Text);
        data.AccountID = (int)Session["id"]; 
        data.CreateDate = DateTime.Now;
        data.Images = img;
        Image1.ImageUrl = "/Content/img/MonAn/" + data.Images;
        return data;
    }

    private void btnSave_Click(object sender, EventArgs e)
    {
        // Neu tat ca du lieu deu duoc nhap hop le       
        if (Page.IsValid)
        {
            if (FileUpload1.HasFile && CheckFileType(FileUpload1.FileName))
            {
                string fileName = "/Content/img/MonAn/" + DateTime.Now.ToString("ddMMyyyy_") + txtName.Text + Path.GetExtension(FileUpload1.FileName);
                string filePath = MapPath(fileName);
                FileUpload1.SaveAs(filePath);
                Image1.ImageUrl = fileName;
                img = DateTime.Now.ToString("ddMMyyyy_") + txtName.Text + Path.GetExtension(FileUpload1.FileName);
            }
            bool rs = false;
            // Lay du lieu tu form            
            tblProduct data = GetData();
            // ID > 0 ==> Cap nhat va hien thong bao    
            if (data.ID > 0)
            {
                rs = tblProduct.Update(data);
                lblStatus.Text = rs ? "Cập nhật thành công." : "Cập nhật lỗi.";
            }
            else
            {
                rs = tblProduct.Add(data);
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
        lblId.Text ="";

        txtName.Text = "";
        txtPrice.Text = "";
        txtType.SelectedIndex = 1;
        txtDiscount.Text = "";
        txtContents.InnerText = "";
        txtQuantity.Text = "";
        img = null;
    }
}
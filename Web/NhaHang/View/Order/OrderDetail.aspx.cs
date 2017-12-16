using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class View_Order_Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable cart = new DataTable();
            if (Session["cart"] == null)
            {
                cart.Columns.Add("ID");
                cart.Columns.Add("Name");
                cart.Columns.Add("Price");
                cart.Columns.Add("Quantity");
                cart.Columns.Add("TotalPrice");
                Session["cart"] = cart;
            }
            else
            {
                cart = Session["cart"] as DataTable;
            }

            GridView1.DataSource = cart;
            GridView1.DataBind();
        }
        if (Session["idCus"] == null)
        {
            btnOrder.Visible = false;
        }
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string id = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
        TextBox quantity = GridView1.Rows[e.NewSelectedIndex].Cells[2].FindControl("txtQuantity")
            as TextBox;
        DataTable cart = Session["cart"] as DataTable;
        foreach (DataRow dr in cart.Rows)
        {
            if (dr["ID"].ToString() == id)
            {
                if (int.Parse(quantity.Text) > 10)
                {
                    lblStatus.Text = "Chỉ tối đa 10 lần trên một món.";
                }
                else
                {
                    dr["Quantity"] = int.Parse(quantity.Text);
                    dr["TotalPrice"] = (decimal.Parse(dr["Quantity"].ToString()) *
                                        decimal.Parse(dr["Price"].ToString()));
                    break;
                }

            }
        }
        Session["cart"] = cart;
        GridView1.DataSource = cart;
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        DataTable cart = Session["cart"] as DataTable;
        foreach (DataRow dr in cart.Rows)
        {
            if (dr["ID"].ToString() == id)
            {
                dr.Delete();
                break;
            }
        }
        Session["cart"] = cart;
        GridView1.DataSource = cart;
        GridView1.DataBind();
    }

    protected void btnOrder_OnClick(object sender, EventArgs e)
    {
        DataTable cart = Session["cart"] as DataTable;
        if (Session["cart"] != null)
        {
            foreach (DataRow dr in cart.Rows)
            {
                string id = dr["ID"].ToString();
                string quantity = dr["QuanTiTy"].ToString();
                string total = dr["TotalPrice"].ToString();
                Dat_Hang(total, quantity, id);
            }
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void Dat_Hang(string total, string quantity, string id)
    {
        if (Session["idCus"] == null)
        {
            lblStatus.Text = "Hãy đăng nhập để đặt hàng.";
        }
        else
        {
            tblOrder or = new tblOrder()
            {
                TotalPrice = decimal.Parse(total),
                Quantity = int.Parse(quantity),
                AccountID = (int)Session["idCus"],
                AccountName = "",
                CreateDate = DateTime.Now
            };
            int rs = tblOrder.Add(or);
            if (rs > 0)
            {
                tblOrderDeails orderDeails = new tblOrderDeails()
                {
                    OrderID = rs,
                    Price = decimal.Parse(total),
                    Quantity = int.Parse(quantity),
                    ProductID = int.Parse(id)
                };

                bool rp = tblOrderDeails.Add(orderDeails);
                lblStatus.Text = rp ? "Đặt hàng thành công." : "Đặt hàng lỗi.";

                if (rp)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe",
                        "alert('Đặt hàng thành công!');", true);
                    tblProduct s = new tblProduct();
                    s = tblProduct.Single(id);
                    int ss = s.QuantityOrder;
                    tblProduct a = new tblProduct();
                    a.ID = Convert.ToInt32(id);
                    a.QuantityOrder = ss + 1;
                    a.Name = s.Name;
                    a.Price = s.Price;
                    a.Images = s.Images;
                    a.Discount = s.Discount;
                    a.CreateDate = s.CreateDate;
                    a.Contents = s.Contents;
                    a.CategoryID = s.CategoryID;
                    a.AccountID = s.AccountID;
                    tblProduct.Update(a);
                    Session["cart"] = null;

                }
            }
        }
    }
}
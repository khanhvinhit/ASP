using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class View_Room_Room : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            all();
        }

    }
    public void all()
    {
        room.DataSource = tblRoom.Get_All().Take(1);
        var a = tblRoom.Get_All().First(n => n.ID == 1).TypeName;
        room.DataBind();
    }
    
}
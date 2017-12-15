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
        var a = tblRoom.Get_All();
        
        room.DataSource = a;
        room.DataBind();
    }
    
}
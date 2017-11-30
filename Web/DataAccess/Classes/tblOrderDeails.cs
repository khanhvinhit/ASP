namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;

    public partial class tblOrderDeails
    {
        public int ID { get; set; }

        public int? OrderID { get; set; }

        public string ProductName { get; set; }

        public decimal? UnitPrice { get; set; }

        public int? Quantity { get; set; }

        public decimal? Price { get; set; }

        public static List<tblOrderDeails> Get_All_By_OrderID(string oderDetailID)
        {
            return CBO.FillCollection<tblOrderDeails>(DataProvider.Instance.ExecuteReader("SP_Select_tblOrderDeails_By_OrderID", Convert.ToInt32(oderDetailID)));
        }

        public static bool Delete(string oderDetailID)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("SP_Delete_tblOrderDeails", Convert.ToInt32(oderDetailID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }
    }
}

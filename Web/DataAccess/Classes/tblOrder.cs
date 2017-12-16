namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;
    
    public partial class tblOrder
    {
        public int ID { get; set; }

        public decimal? TotalPrice { get; set; }

        public int? Quantity { get; set; }

        public int? AccountID { get; set; }
        public string AccountName { get; set; }

        public DateTime? CreateDate { get; set; }

        public static List<tblOrder> Get_All()
        {
            return CBO.FillCollection<tblOrder>(DataProvider.Instance.ExecuteReader("SP_Select_tblOrder"));
        }

        public static int Add(tblOrder order)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@ID", "[dbo].[SP_Insert_tblOrder]",
                    order.TotalPrice,order.Quantity,order.AccountID,DateTime.Now);
                return Convert.ToInt32(rs);
            }
            catch
            {
                return 0;
            }
        }
        

        public static bool Delete(string orderID)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("[dbo].[SP_Delete_tblOrder]", Convert.ToInt32(orderID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static tblOrder Single(string categoryId)
        {
            try
            {
                return CBO.FillObject<tblOrder>(DataProvider.Instance.ExecuteReader("SP_Order_Single", Convert.ToInt32(categoryId)));
            }
            catch (Exception) { return null; }
        }
    }
}

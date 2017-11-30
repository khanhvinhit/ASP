namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;

    public partial class tblProduct
    {

        public int ID { get; set; }

        public string Name { get; set; }

        public int? CategoryID { get; set; }
        public string CategoryName { get; set; }

        public string Images { get; set; }

        public decimal? Price { get; set; }
        public int QuantityOrder { get; set; }

        public decimal? Discount { get; set; }

        public string Contents { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? AccountID { get; set; }
        public tblProduct()
        {

        }

        public static List<tblProduct> Get_All()
        {
            return CBO.FillCollection<tblProduct>(DataProvider.Instance.ExecuteReader("SP_Select_tblProduct"));
        }
        public static List<tblProduct> NewFood()
        {
            return CBO.FillCollection<tblProduct>(DataProvider.Instance.ExecuteReader("SP_NewCreate_Products"));
        }
        public static List<tblProduct> TopHot()
        {
            return CBO.FillCollection<tblProduct>(DataProvider.Instance.ExecuteReader("SP_TopHot_Product"));
        }
        public static List<tblProduct> Detail(int id)
        {
            return CBO.FillCollection<tblProduct>(DataProvider.Instance.ExecuteReader("SP_ProductByCategoryID_tblProduct", id));
        }

        public static bool Add(tblProduct product)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@ID", "[dbo].[SP_Insert_tblProduct]",
                    product.ID, 
                    product.Name, 
                    product.CategoryID, 
                    product.Images, 
                    product.Price,
                    product.Discount, 
                    product.Contents,
                    product.QuantityOrder,
                    product.CreateDate,
                    product.AccountID
                    );
                return Convert.ToInt32(rs) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Update(tblProduct product)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("[dbo].[SP_Update_tblProduct]",
                    product.ID,
                    product.Name,
                    product.CategoryID,
                    product.Images,
                    product.Price,
                    product.Discount,
                    product.Contents,
                    product.QuantityOrder);
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static bool Delete(string ID)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("SP_Delete_tblProduct", Convert.ToInt32(ID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static tblProduct Single(string Id)
        {
            try
            {
                return CBO.FillObject<tblProduct>(DataProvider.Instance.ExecuteReader("SP_Product_Single", Convert.ToInt32(Id)));
            }
            catch (Exception) { return null; }
        }
    }
}

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
    }
}

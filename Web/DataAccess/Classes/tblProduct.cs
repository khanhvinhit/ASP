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

        public decimal? Discount { get; set; }

        public string Contents { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? AccountID { get; set; }
        public tblProduct()
        {

        }
        public static List<tblProduct> TopHot()
        {
            //IDataReader reader = null;
            //try
            //{
            //    reader = DataProvider.Instance.ExecuteReader("SP_Select_tblProduct");
            //    reader.Read();
            //    reader.NextResult();
            //    List<tblProduct> a = CBO.FillCollection<tblProduct>(reader);
            //    return CBO.FillCollection<tblProduct>(reader);
            //}
            //catch {
            //    if (reader != null && reader.IsClosed == false)
            //        reader.Close();
            //    return new List<tblProduct>();
            //}
            return CBO.FillCollection<tblProduct>(DataProvider.Instance.ExecuteReader("SP_Select_tblProduct"));
        }
    }
}

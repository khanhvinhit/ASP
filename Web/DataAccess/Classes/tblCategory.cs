namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;
    public partial class tblCategory
    {

        public int ID { get; set; }

        public string Name { get; set; }
        public string Image { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? AccountID { get; set; }
        public tblCategory()
        {

        }
        public static List<tblCategory> All()
        {
            return CBO.FillCollection<tblCategory>(DataProvider.Instance.ExecuteReader("SP_Select_tblCategory"));
        }
        public static List<tblCategory> NameCategory(int id)
        {
            return CBO.FillCollection<tblCategory>(DataProvider.Instance.ExecuteReader("Sp_NameByID_tblCategory",id));
        }
    }
}

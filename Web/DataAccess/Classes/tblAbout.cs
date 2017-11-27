namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;

    public partial class tblAbout
    {
        public int ID { get; set; }
        
        public string URLMap { get; set; }

        public string Name { get; set; }

        public string Address { get; set; }

        public string Email { get; set; }

        public string Phone1 { get; set; }

        public string Phone2 { get; set; }

        public string Contents { get; set; }

        public int? AccountID { get; set; }

        public DateTime? CreateDate { get; set; }

        public static List<tblAbout> All()
        {
            return CBO.FillCollection<tblAbout>(DataProvider.Instance.ExecuteReader("SP_Select_tblAbout"));
        }

    }
}

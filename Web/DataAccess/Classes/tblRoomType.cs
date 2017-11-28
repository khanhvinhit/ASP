namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;

    public partial class tblRoomType
    {

        public int ID { get; set; }
        public string Name { get; set; }

        public int? AccountID { get; set; }

        public DateTime? CreateDate { get; set; }

        public static List<tblRoomType> Get_All()
        {
            return CBO.FillCollection<tblRoomType>(DataProvider.Instance.ExecuteReader("SP_Select_tblRoomType"));
        }
    }
}

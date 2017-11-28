namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;

    public partial class tblAccountType
    {

        public int ID { get; set; }

        public string Name { get; set; }


        public static List<tblAccountType> Get_All()
        {
            return CBO.FillCollection<tblAccountType>(DataProvider.Instance.ExecuteReader("SP_Select_tblAccountType"));
        }
    }
}

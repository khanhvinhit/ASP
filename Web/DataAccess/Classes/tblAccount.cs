namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;

    public partial class tblAccount
    {
        public int ID { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }
        

        public int Type { get; set; }

        public string Name { get; set; }

        public string Avatar { get; set; }


        public string Address { get; set; }

        public string Phone { get; set; }

        public bool? Status { get; set; }

        public static List<tblAccount> Get_All_Accounts()
        {
            return CBO.FillCollection<tblAccount>(DataProvider.Instance.ExecuteReader("SP_Select_tblAccount"));
        }

        public static tblAccount Get_Accounts_By_Email(string email)
        {
            return CBO.FillObject<tblAccount>(DataProvider.Instance.ExecuteReader("SP_Select_tblAccount_By_Email", email));
        }

        public static DataSet Check_Login(string email, string pass)
        {

            return DataProvider.Instance.ExecuteDataset("SP_Login", email, pass);
            //DataProvider.Instance.ExecuteReader("SP_Login", email, pass);
        }
    }
}

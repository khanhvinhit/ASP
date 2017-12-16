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


        public string TypeName { get; set; }
        public int TypeID { get; set; }
<<<<<<< HEAD
        
=======

>>>>>>> 9095493f3fa5c68de9aa8cb6bafb72a7beaf3f25
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

        public static bool Add(tblAccount account)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@ID", "[dbo].[SP_Insert_tblAccount]",
                    account.ID,
                    account.Email,
                    account.Password,
                    account.TypeName,
                    account.Name,
                    account.Avatar,
                    account.Address,
                    account.Phone,
                    account.Status
                    );
                return Convert.ToInt32(rs) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Update(tblAccount account)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("SP_Update_tblAccount",
                    account.ID, account.Email, account.Password, Convert.ToInt32(account.TypeName), account.Name, account.Avatar, account.Address, account.Phone, account.Status);
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static bool Delete(string categoryID)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("SP_Delete_tblAccount", Convert.ToInt32(categoryID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static tblAccount Single(string id)
        {
            try
            {
                return CBO.FillObject<tblAccount>(DataProvider.Instance.ExecuteReader("[dbo].[SP_Account_Single]", Convert.ToInt32(id)));
            }
            catch (Exception) { return null; }
        }
    }
}

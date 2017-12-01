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

        public string AccountName { get; set; }

        public DateTime? CreateDate { get; set; }

        public static List<tblAbout> All()
        {
            return CBO.FillCollection<tblAbout>(DataProvider.Instance.ExecuteReader("SP_Select_tblAbout"));
        }


        public static bool Add(tblAbout about)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@ID", "[dbo].[SP_Insert_tblAbout]",
                    about.ID, about.URLMap, about.Name, about.Address, about.Email, about.Phone1, about.Phone2, about.Contents, about.AccountID, about.CreateDate);
                return Convert.ToInt32(rs) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Update(tblAbout about)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("[dbo].[SP_Update_tblAbout]",
                    about.ID, about.URLMap, about.Name, about.Address, about.Email, about.Phone1, about.Phone2, about.Contents);
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static bool Delete(string aboutID)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("SP_Delete_tblAbout", Convert.ToInt32(aboutID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static tblAbout Single(string aboutId)
        {
            try
            {
                return CBO.FillObject<tblAbout>(DataProvider.Instance.ExecuteReader("SP_About_Single", Convert.ToInt32(aboutId)));
            }
            catch (Exception) { return null; }
        }
    }
}

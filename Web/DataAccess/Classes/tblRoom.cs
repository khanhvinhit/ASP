namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;

    public partial class tblRoom
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public string Images { get; set; }

        public string About { get; set; }

        public string TypeName { get; set; }

        public int? AccountID { get; set; }
        public string AccountName { get; set; }

        public DateTime? CreateDate { get; set; }


        public static List<tblRoom> Get_All()
        {
            return CBO.FillCollection<tblRoom>(DataProvider.Instance.ExecuteReader("SP_Select_tblRoom"));
        }

        public static bool Add(tblRoom room)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@ID", "SP_Insert_tblRoom",
                    room.ID,room.Name,room.Images,room.About,Convert.ToInt32(room.TypeName),room.AccountID,room.CreateDate);
                return Convert.ToInt32(rs) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Update(tblRoom room)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("SP_Update_tblRoom", room.ID, room.Name, room.Images, room.About, Convert.ToInt32(room.TypeName));
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
                int rs = DataProvider.Instance.ExecuteNonQuery("SP_Delete_tblRoom", Convert.ToInt32(categoryID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static tblRoom Single(string categoryId)
        {
            try
            {
                return CBO.FillObject<tblRoom>(DataProvider.Instance.ExecuteReader("SP_Room_Single", Convert.ToInt32(categoryId)));
            }
            catch (Exception) { return null; }
        }
    }
}

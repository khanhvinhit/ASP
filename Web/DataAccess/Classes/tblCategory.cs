using System.Collections.Specialized;

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
        public static List<tblCategory> All()
        {
            return CBO.FillCollection<tblCategory>(DataProvider.Instance.ExecuteReader("SP_Select_tblCategory"));
        }
        public static List<tblCategory> NameCategory(int id)
        {
            return CBO.FillCollection<tblCategory>(DataProvider.Instance.ExecuteReader("Sp_NameByID_tblCategory", id));
        }

        public static bool Add(tblCategory category)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@ID", "SP_Insert_tblCategory",
                    category.ID, category.Name, category.Image,category.CreateDate,category.AccountID);
                return Convert.ToInt32(rs) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Update(tblCategory category)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("SP_Update_tblCategory", category.ID, category.Name, category.Image);
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
                int rs = DataProvider.Instance.ExecuteNonQuery("SP_Delete_tblCategory", Convert.ToInt32(categoryID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static tblCategory Single(string categoryId)
        {
            try
            {
                return CBO.FillObject<tblCategory>(DataProvider.Instance.ExecuteReader("SP_Category_Single", Convert.ToInt32(categoryId)));
            } catch (Exception) { return null; }
        }

    }
}

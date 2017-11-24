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

        public DateTime? CreateDate { get; set; }

        public int? AccountID { get; set; }
    }
}

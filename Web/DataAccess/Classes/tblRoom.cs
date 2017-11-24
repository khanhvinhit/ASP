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

        public int? Type { get; set; }

        public int? AccountID { get; set; }

        public DateTime? CreateDate { get; set; }

    }
}

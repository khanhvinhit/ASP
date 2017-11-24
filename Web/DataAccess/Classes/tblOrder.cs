namespace ClassLibrary1.NewFolder1
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;
    
    public partial class tblOrder
    {
        public int ID { get; set; }

        public decimal? TotalPrice { get; set; }

        public int? Quantity { get; set; }

        public int? AccountID { get; set; }

        public DateTime? CreateDate { get; set; }
        

    }
}

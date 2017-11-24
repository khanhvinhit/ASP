namespace ClassLibrary1.NewFolder1
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tblOrderDeails
    {
        public int ID { get; set; }

        public int? OrderID { get; set; }

        public int? ProductID { get; set; }

        public int? Quantity { get; set; }

        public decimal? Price { get; set; }

        public virtual tblOrder tblOrder { get; set; }

        public virtual tblProduct tblProduct { get; set; }
    }
}

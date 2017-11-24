namespace ClassLibrary1.NewFolder1
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblOrder")]
    public partial class tblOrder
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblOrder()
        {
            tblOrderDeails = new HashSet<tblOrderDeails>();
        }

        public int ID { get; set; }

        public decimal? TotalPrice { get; set; }

        public int? Quantity { get; set; }

        public int? AccountID { get; set; }

        public DateTime? CreateDate { get; set; }

        public virtual tblAccount tblAccount { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblOrderDeails> tblOrderDeails { get; set; }
    }
}

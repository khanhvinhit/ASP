namespace ClassLibrary1.NewFolder1
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblProduct")]
    public partial class tblProduct
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblProduct()
        {
            tblOrderDeails = new HashSet<tblOrderDeails>();
        }

        public int ID { get; set; }

        [StringLength(200)]
        public string Name { get; set; }

        public int? CategoryID { get; set; }

        [StringLength(100)]
        public string Images { get; set; }

        public decimal? Price { get; set; }

        public decimal? Discount { get; set; }

        [StringLength(1000)]
        public string Contents { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? AccountID { get; set; }

        public virtual tblAccount tblAccount { get; set; }

        public virtual tblCategory tblCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblOrderDeails> tblOrderDeails { get; set; }
    }
}

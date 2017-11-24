namespace ClassLibrary1.NewFolder1
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblAbout")]
    public partial class tblAbout
    {
        public int ID { get; set; }

        [StringLength(500)]
        public string URLMap { get; set; }

        [StringLength(200)]
        public string Name { get; set; }

        [StringLength(200)]
        public string Address { get; set; }

        [StringLength(200)]
        public string Email { get; set; }

        [StringLength(15)]
        public string Phone1 { get; set; }

        [StringLength(15)]
        public string Phone2 { get; set; }

        [Column(TypeName = "ntext")]
        public string Contents { get; set; }

        public int? AccountID { get; set; }

        public DateTime? CreateDate { get; set; }

        public virtual tblAccount tblAccount { get; set; }
    }
}

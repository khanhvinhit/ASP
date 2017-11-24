namespace ClassLibrary1.NewFolder1
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tblRoom")]
    public partial class tblRoom
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Images { get; set; }

        [StringLength(1000)]
        public string About { get; set; }

        public int? Type { get; set; }

        public int? AccountID { get; set; }

        public DateTime? CreateDate { get; set; }

        public virtual tblAccount tblAccount { get; set; }

        public virtual tblRoomType tblRoomType { get; set; }
    }
}

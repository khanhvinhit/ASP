namespace DataAccess.Classes
{
    using System;
    using Core;
    using System.Data;
    using System.Collections.Generic;

    public partial class tblAccount
    {
        public int ID { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public bool? RemeberPassword { get; set; }

        public int Type { get; set; }

        public string Name { get; set; }

        public string Avatar { get; set; }


        public string Address { get; set; }

        public string Phone { get; set; }

        public bool? Status { get; set; }

        
    }
}

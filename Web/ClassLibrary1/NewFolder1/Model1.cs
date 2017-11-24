namespace ClassLibrary1.NewFolder1
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<tblAbout> tblAbout { get; set; }
        public virtual DbSet<tblAccount> tblAccount { get; set; }
        public virtual DbSet<tblAccountType> tblAccountType { get; set; }
        public virtual DbSet<tblCategory> tblCategory { get; set; }
        public virtual DbSet<tblOrder> tblOrder { get; set; }
        public virtual DbSet<tblOrderDeails> tblOrderDeails { get; set; }
        public virtual DbSet<tblProduct> tblProduct { get; set; }
        public virtual DbSet<tblRoom> tblRoom { get; set; }
        public virtual DbSet<tblRoomType> tblRoomType { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tblAbout>()
                .Property(e => e.Email)
                .IsFixedLength();

            modelBuilder.Entity<tblAbout>()
                .Property(e => e.Phone1)
                .IsFixedLength();

            modelBuilder.Entity<tblAbout>()
                .Property(e => e.Phone2)
                .IsFixedLength();

            modelBuilder.Entity<tblAccount>()
                .Property(e => e.Email)
                .IsFixedLength();

            modelBuilder.Entity<tblAccount>()
                .Property(e => e.Password)
                .IsFixedLength();

            modelBuilder.Entity<tblAccount>()
                .Property(e => e.Phone)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<tblAccount>()
                .HasMany(e => e.tblAbout)
                .WithOptional(e => e.tblAccount)
                .HasForeignKey(e => e.AccountID);

            modelBuilder.Entity<tblAccount>()
                .HasMany(e => e.tblRoom)
                .WithOptional(e => e.tblAccount)
                .HasForeignKey(e => e.AccountID);

            modelBuilder.Entity<tblAccount>()
                .HasMany(e => e.tblCategory)
                .WithOptional(e => e.tblAccount)
                .HasForeignKey(e => e.AccountID);

            modelBuilder.Entity<tblAccount>()
                .HasMany(e => e.tblOrder)
                .WithOptional(e => e.tblAccount)
                .HasForeignKey(e => e.AccountID);

            modelBuilder.Entity<tblAccount>()
                .HasMany(e => e.tblProduct)
                .WithOptional(e => e.tblAccount)
                .HasForeignKey(e => e.AccountID);

            modelBuilder.Entity<tblAccountType>()
                .HasMany(e => e.tblAccount)
                .WithRequired(e => e.tblAccountType)
                .HasForeignKey(e => e.Type)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tblCategory>()
                .HasMany(e => e.tblProduct)
                .WithOptional(e => e.tblCategory)
                .HasForeignKey(e => e.CategoryID);

            modelBuilder.Entity<tblOrder>()
                .Property(e => e.TotalPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblOrder>()
                .HasMany(e => e.tblOrderDeails)
                .WithOptional(e => e.tblOrder)
                .HasForeignKey(e => e.OrderID);

            modelBuilder.Entity<tblOrderDeails>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblProduct>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblProduct>()
                .Property(e => e.Discount)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tblProduct>()
                .HasMany(e => e.tblOrderDeails)
                .WithOptional(e => e.tblProduct)
                .HasForeignKey(e => e.ProductID);

            modelBuilder.Entity<tblRoomType>()
                .HasMany(e => e.tblRoom)
                .WithOptional(e => e.tblRoomType)
                .HasForeignKey(e => e.Type);
        }
    }
}

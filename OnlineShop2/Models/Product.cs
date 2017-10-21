namespace OnlineShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();

        }

        public int ProductID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public int? SupplierID { get; set; }

        public int? CategoryID { get; set; }

        public int? SubcategoryID { get; set; }

        [Required(ErrorMessage = "Price is required")]
        [Range(0.01, 100.00,
            ErrorMessage = "Price must be between 0.01 and 100.00")]
        public decimal UnitPrice { get; set; }

        public decimal? OldPrice { get; set; }

        [StringLength(50)]
        public string UnitWeight { get; set; }

        [StringLength(50)]
        public string Size { get; set; }

        public decimal? Discount { get; set; }

        public int? UnitInStock { get; set; }

        [StringLength(500)]
        public string ImageURL { get; set; }

        [StringLength(300)]
        public string ShortDescription { get; set; }

        [StringLength(2000)]
        public string LongDescription { get; set; }

        [StringLength(500)]
        public string Picture1 { get; set; }

        [StringLength(500)]
        public string Picture2 { get; set; }

        [StringLength(500)]
        public string Picture3 { get; set; }

        [StringLength(500)]
        public string Picture4 { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int? Quantity { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual SubCategory SubCategory { get; set; }

        public virtual Supplier Supplier { get; set; }
        
        //public virtual ICollection<Wishlist> Wishlists { get; set; }

    } 
}

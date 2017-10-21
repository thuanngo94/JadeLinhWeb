namespace OnlineShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrderDetails")]
    public partial class OrderDetail
    {
        [Key]
        public int OrderDetailsID { get; set; }

        public int OrderID { get; set; }

        public int ProductID { get; set; }

        public decimal? UnitPrice { get; set; }

        public int? Quantity { get; set; }

        public decimal? Discount { get; set; }

        public DateTime? OrderDate { get; set; }

        public int CustomerID { get; set; }

        [Column("CustomerName")]
        [Display(Name = "Your Name")]
        [Required(ErrorMessage = "Name required")]
        [StringLength(250)]
        public string CustomerName { get; set; }

        [Column("Address")]
        [Display(Name = "Address")]
        [Required(ErrorMessage = "Address required")]
        [StringLength(250)]
        public string Address { get; set; }

        [Column("Email")]
        [Display(Name = "Address")]
        [Required(ErrorMessage = "Email required")]
        [StringLength(50)]
        public string Email { get; set; }

        [Column("Phone")]
        [Display(Name = "Phone Number")]
        [Required(ErrorMessage = "Phone required")]
        [StringLength(50)]
        public string Phone { get; set; }

        public virtual Order Order { get; set; }

        public virtual Product Product { get; set; }

       // public virtual Customer Customer { get; set; }
    }
}

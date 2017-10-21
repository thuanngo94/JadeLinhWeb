namespace OnlineShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            //OrderDetails = new HashSet<OrderDetail>();
            this.OrderDetails = new HashSet<OrderDetail>();
  
        }

        public int OrderID { get; set; }

        public int? CustomerID { get; set; }

        public int? PayTypeID { get; set; }

        public int? Discount { get; set; }
        
        public decimal Total { get; set; }

        public DateTime? OrderDate { get; set; }

        public DateTime? ShippingDate { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual PaymentType PaymentType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}

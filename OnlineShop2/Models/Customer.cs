using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace OnlineShop.Models
{
    [Table("Customers")]
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            Orders = new HashSet<Order>();
           
        }

        public int CustomerID { get; set; }

        [Column("First Name")]
        [Display(Name = "First Name")]
        [Required]
        [StringLength(50)]
        public string First_Name { get; set; }

        [Column("Last Name")]
        [Display(Name = "Last Name")]
        [Required]
        [StringLength(50)]
        public string Last_Name { get; set; }

        [Required(ErrorMessage = "UserName")]
        [StringLength(50)]
        public string UserName { get; set; }

        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Password required")]
        [Display(Name = "Password")]
        [StringLength(50)]
        public string Password { get; set; }

        public bool Permission { get; set; }

        public int? Age { get; set; }

        [StringLength(50)]
        public string Gender { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateofBirth { get; set; }

        [StringLength(50)]
        public string Organization { get; set; }

        [StringLength(50)]
        public string Country { get; set; }

        [StringLength(50)]
        public string State { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        [StringLength(50)]
        public string PostalCode { get; set; }

        [Required(ErrorMessage = "Email required")]
        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Mobile { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        [StringLength(250)]
        public string Picture { get; set; }

        //public Boolean IsEmailVerified { get; set; }

        //public Guid ActivationCode { get; set; }       

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }

       
    }
   
}

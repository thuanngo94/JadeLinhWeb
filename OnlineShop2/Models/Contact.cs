using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using OnlineShop.Models;
namespace OnlineShop.Models
{
    [Table("Contact")]
    public  class Contact
    {
        [Key]
        public int ID { get; set; }

        [Required(ErrorMessage = "Please enter your name")]
        [Display(Name ="Your Name")]
        public string YourName { get; set; }
        
        [Required(ErrorMessage = "Please enter your email")]
        [Display(Name = "Your Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please enter subject")]
        [Display(Name = "Subject")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "Please enter message")]
        [Display(Name = "Message")]
        public string Message { get; set; }
    }
}
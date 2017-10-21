using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineShop.Models
{
    public class RegisterModel
    {
        [Key]
        public long ID { get; set; }
        [Display(Name="Username")]
        [Required(ErrorMessage ="Please enter username")]
        public string UserName { get; set; }

        [Display(Name = "Password")]
        [Required(ErrorMessage = "Please enter password")]
        public string Password { get; set; }

        [Display(Name ="Confirm password")]
        [Compare("Password",ErrorMessage = "Password confirm invalid")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Please enter first name")]
        public string First_Name { get; set; }

        [Required(ErrorMessage = "Please enter last name")]
        public string Last_Name { get; set; }

        [Required(ErrorMessage = "Please enter address")]
        public string Address { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Please enter email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please enter phone number")]
        public string Phone { get; set; }
    }
}
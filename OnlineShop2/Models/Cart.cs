using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;
using System.Web;
using System.Linq;
namespace OnlineShop.Models
{
    [Table("Cart")]
    //[Bind(Exclude ="RecordID")]
    [Serializable]
    public class Cart
    {
        //[HiddenInput(DisplayValue = false)]
        //[Key]
        //public int RecordID { get; set; }
        //public string CartID { get; set; }
        //public int ProductID { get; set; }
        //public int Count { get; set; }
        //public System.DateTime DateCreated { get; set; }
        //public virtual Product product { get; set; }

        OnlineShopDB db = new OnlineShopDB();

        [Key]
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string Images { get; set; }
        public double UnitPrice { get; set; }
        public int Quantity { get; set; }
        public double Total {
            get { return Quantity * UnitPrice; }
        }

        public Cart(int productID)
        {
            ProductID = productID;
            Product product = db.Products.Single(n=>n.ProductID == productID);
            ProductName = product.Name;
            Images = "/assets/client/images/sp/" + product.ProductID + "/main.jpg";
            UnitPrice = double.Parse(product.UnitPrice.ToString());
            Quantity = 1;
        }
    }
}
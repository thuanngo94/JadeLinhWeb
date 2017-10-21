using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PagedList;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Data.Entity;

namespace OnlineShop.Models
{
    
    public class ProductSearchModel
    {
        public int ? Page { get; set; }
        [Display(Name ="Product")]
        public string ProductName { get; set; }
        public decimal? Price { get; set; }
        public IPagedList<Product> SearchResults { get; set; }
        public string SearchButton { get; set; }
    }

    
    //public async Task<IActionResult> Index(string searchString)
    //{
    //    OnlineShopDB db = new OnlineShopDB();
    //    var prod = from m in db.Products
    //               select m;
    //    if (!String.IsNullOrEmpty(searchString))
    //    {
    //        prod = prod.Where(p => p.Name.Contains(searchString));
    //    }
    //    return View(await prod.ToListAsync());
    //}
}
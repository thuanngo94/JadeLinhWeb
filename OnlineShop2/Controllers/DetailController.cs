using System.Linq;
using System.Web.Mvc;
using OnlineShop.Models;
using System;
using System.Configuration;
using System.Collections.Generic;

namespace OnlineShop.Controllers
{
    public class DetailController : Controller
    {   
        // GET: Details
        public ActionResult Detail(int ? id)
        {
            if(TempData["error"] != null)
            {
                ViewBag.Myscript = TempData["error"].ToString();
            }
            using(OnlineShopDB ctx = new OnlineShopDB())
            {
                Product model = ctx.Products.Include("Category").Include("SubCategory")
                                   .Where(p => p.ProductID == id)
                                   .FirstOrDefault();

                ctx.SaveChanges();
                return View(model);
            }                    
        }
    }
}
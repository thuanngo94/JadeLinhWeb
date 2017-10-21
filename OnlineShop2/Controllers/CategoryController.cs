using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShop.Models;

namespace OnlineShop.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult PartialList()
        {
            using (OnlineShopDB ctx = new OnlineShopDB())
            {
                List<Category> list = ctx.Categories.ToList();
                return PartialView(list);
            }           
        }
    }
}
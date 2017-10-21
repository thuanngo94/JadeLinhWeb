using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class SubCategoryController : Controller
    {
        // GET: SubCategory
        public ActionResult PartialList(int? id = 1)
        {
            using (OnlineShopDB ctx = new OnlineShopDB())
            {
                List<SubCategory> list = ctx.SubCategories.Where(s => s.CategoryID == id).ToList();
                return PartialView(list);
            }
        }
    }
}
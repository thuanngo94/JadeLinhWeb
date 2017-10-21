using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace OnlineShop.Controllers
{
    public class HomeController : Controller
    {
        OnlineShopDB db = new OnlineShopDB();
        const int RecordsPerPage = 5;
        // GET: Home
        public ActionResult Index(int? id, int? subID, int page = 1)
        {
            if (TempData["error"] != null)
            {
                ViewBag.Myscript = TempData["error"].ToString();
            }
            int pageSz = Convert.ToInt32(ConfigurationManager.AppSettings["PageSize"]);
            using (OnlineShopDB ctx = new OnlineShopDB())
            {               
                var query = ctx.Products.Include("category").Include("subcategory");
                int count = query.Count();
                int nPages = count / pageSz + (count % pageSz > 0 ? 1 : 0);
                if (page > nPages) page = nPages;
                ViewBag.PageCount = nPages;
                ViewBag.CatID = id;
                ViewBag.CurPage = page;
                List<Product> list = new List<Product>();
                if (page != 0)
                {
                    list = query.OrderBy(p => p.ProductID)
                                 .Skip((page - 1) * pageSz)
                                 .Take(pageSz).ToList();
                }
                return View(list);
            }
        }

        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public ActionResult TopMenu()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public ActionResult Footer()
        {
            return PartialView();
        }
              
    }
}
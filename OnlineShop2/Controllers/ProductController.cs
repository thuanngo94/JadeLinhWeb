using System.Linq;
using System.Web.Mvc;
using OnlineShop.Models;
using System;
using System.Configuration;
using System.Collections.Generic;
using System.Net;
using PagedList;


namespace OnlineShop.Controllers
{
    public class ProductController : Controller
    {
        OnlineShopDB db = new OnlineShopDB();
        const int RecordsPerPage = 5;
        public ActionResult Index(ProductSearchModel model)
        {                    
            if(!string.IsNullOrEmpty(model.SearchButton)|| model.Page.HasValue)
            {
                // var entities = new OnlineShopDB();
                var results = db.Products
                    .Where(p => p.Name.StartsWith(model.ProductName)
                    || model.ProductName == null||p.Name.Contains(model.ProductName) && (p.UnitPrice > model.Price 
                    || model.Price == null)).OrderBy(p => p.Name);

                var pageIndex = model.Page ?? 1;
                model.SearchResults = results.ToPagedList(pageIndex, RecordsPerPage);
            }
            return View(model);
        }

        #region GET: /Product/    
       
        public ActionResult Women(int? id, int? subID, int page = 1)
        {
            if (TempData["error"] != null)
            {
                ViewBag.Myscript = TempData["error"].ToString();
            }
            int pageSz = Convert.ToInt32(ConfigurationManager.AppSettings["PageSize"]);

            using (OnlineShopDB ctx = new OnlineShopDB())
            {
                var query = ctx.Products.Where(p => p.CategoryID == id && p.SubcategoryID == subID);
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
        #endregion

        #region SearchProducts
        //[HttpPost]
        //public ActionResult Find(string searchString)
        //{
        //    var searPro = from p to in db.Products select

        //    if (!String.IsNullOrEmpty(searchString))
        //    {
        //        searPro = searPro.Where(p => p.Name.ToUpper().Contains(searchString.ToUpper()) ||
        //        p.ProductID == int.TryParse(searchString, out result));
        //    }
        //    return View(searPro);
        //}

        #endregion
    }
}
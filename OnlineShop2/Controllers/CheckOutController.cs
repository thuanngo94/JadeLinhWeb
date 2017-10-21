using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShop;
using OnlineShop.Models;

namespace OnlineShop.Controllers
{
    public class CheckOutController : Controller
    {
        OnlineShopDB db = new OnlineShopDB();
        // GET: CheckOut
        public ActionResult Index()
        {
            ViewBag.PayMethod = new SelectList(db.PaymentTypes, "PayTypeID", "TypeName");
            
            return View();
        }
        //PLACE ORDER--LAST STEP


    }
}
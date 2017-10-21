using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShop.Models;
using OnlineShop.ViewModels;
using OnlineShop.Common;

namespace OnlineShop.Controllers
{
    public class ShoppingCartController : Controller
    {      
        OnlineShopDB db = new OnlineShopDB();
        #region Cart
            //Get Cart
            public List<Cart> GetCart()
            {
                List<Cart> listCart = Session["Cart"] as List<Cart>;
                if(listCart == null)
                {
                    //If cart not exist, create list cart (Cart Session)
                    listCart = new List<Cart>();
                    Session["Cart"] = listCart;
                }
                return listCart;
            }

            //Add To Cart
            public ActionResult AddToCart(int productID, string strUrl)
            {
                Product product = db.Products.SingleOrDefault(n => n.ProductID == productID);
                if (product == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }

                List<Cart> listCart = GetCart();
                //Check exist of product in Cart Session
                Cart cart = listCart.Find(n => n.ProductID == productID);
                if(cart == null)
                {
                    cart = new Cart(productID);
                    //Add product to list
                    listCart.Add(cart);
                    return Redirect(strUrl);
                }
                else
                {
                    cart.Quantity++;
                    return Redirect(strUrl);
                }
            }

            //Update Cart
            public ActionResult UpdateCart(int productID, FormCollection f)
            {
                //Check ProductID 
                Product product = db.Products.SingleOrDefault(n => n.ProductID == productID);

                //If get fail productID, return fail 404.
                if (product == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                //Get Cart from Session
                List<Cart> listCart = GetCart();
                //Check exist of product in Session.
                Cart cart = listCart.SingleOrDefault(n => n.ProductID == productID);
                //If exist, has been update quantity
                if (cart != null)
                {
                    cart.Quantity = int.Parse(f["txtQuantity"].ToString());
                }
                return RedirectToAction("Cart");
            }

            //Delete Cart
            public ActionResult DeleteCart( int productID)
            {
                //Check ProductID 
                Product product = db.Products.SingleOrDefault(n => n.ProductID == productID);

                //If get fail productID, return fail 404.
                if (product == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                //Get Cart from Session
                List<Cart> listCart = GetCart();

                //Check exist of product in Session.
                Cart cart = listCart.SingleOrDefault(n => n.ProductID == productID);
                //If exist, has been update quantity
                if (cart != null)
                {
                    listCart.RemoveAll(n => n.ProductID == cart.ProductID);
              
                }
                if (listCart.Count == 0)
                {
                    return RedirectToAction("Index","Home");
                }
                return RedirectToAction("Cart");
            }

            //Create Cart Page
            public ActionResult Cart()
            {
                if (Session["Cart"] == null)
                {
                    return RedirectToAction("Index", "Home");
                }
                List<Cart> listCart = GetCart();
            
                return View(listCart);
            }

            //Sum Quantity & Price
            private int SumQuantity()
            {
                int SumQuantity = 0;
                List<Cart> listCart = Session["Cart"] as List<Cart>;
                if(listCart != null)
                {
                    SumQuantity = listCart.Sum(n => n.Quantity);

                }
                return SumQuantity;
            }

            //Sum total Price
            private double SumTotal()
            {
                double SumTotal = 0;
                List<Cart> listCart = Session["Cart"] as List<Cart>;
                if (listCart != null)
                {
                    SumTotal = listCart.Sum(n => n.Total);
                }
                return SumTotal;
            }

            // Partial Cart
            public ActionResult CartPartial()
            {
                if (SumQuantity() ==0)
                {
                    return PartialView();
                }
                ViewBag.SumQuantity = SumQuantity();
                ViewBag.SumTotal = SumTotal();
                return PartialView();
            }

            //Create Cart view for User Edit(Update,Delete)
            public ActionResult EditCart()
            {
                if (Session["Cart"] == null)
                {
                    return RedirectToAction("Index", "Home");
                }

                List<Cart> listCart = GetCart();

                return View(listCart);
            }

        #endregion

        #region Order
        //Create Order Funtion 
        [HttpGet]
        public ActionResult Order()
        {
            if (Session["Cart"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<Cart> listCart = GetCart();

            return View(listCart);            
        }

        [HttpPost]
        public ActionResult Order(string customerName,string phone, string address, string email)
        {       
            var session = (UserLogin)Session[OnlineShop.Common.CommonConstants.USER_SESSION];
            //Check login of user
            if (session == null)
            {
                return RedirectToAction("Login", "User");
            }
           
            //Check Cart
            if (Session["Cart"] == null)
            {
                 RedirectToAction("Index", "Home");
            }          
                //Add Orders
                OnlineShop.Models.Order order = new Models.Order();
                Customer cust = (Customer)Session["UserName"];                
                List<Cart> crt = GetCart();
               // order.CustomerID = ;

                order.OrderDate = DateTime.Now;
                db.Orders.Add(order);
                
                db.SaveChanges();
                //Add Order Details

                foreach (var item in crt)
                {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.OrderID = order.OrderID;
                    orderDetail.ProductID = item.ProductID;
                    orderDetail.Quantity = item.Quantity;
                    orderDetail.UnitPrice = (decimal)item.UnitPrice;
                    orderDetail.OrderDate = DateTime.Now;
                    orderDetail.CustomerName = customerName;
                    orderDetail.Phone = phone;
                    orderDetail.Address = address;
                    orderDetail.Email = email;
                    db.OrderDetails.Add(orderDetail);                
                }            
            db.SaveChanges();
            return RedirectToAction("Index","Home");
        }
        #endregion
    }
}
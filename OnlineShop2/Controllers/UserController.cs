using BotDetect.Web.Mvc;
using OnlineShop.Common;
using OnlineShop.Dao;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.Services.Description;

namespace OnlineShop.Controllers
{

    public class UserController : Controller
    {
        OnlineShopDB db = new OnlineShopDB();
        #region Register
        //Register account of user
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [CaptchaValidation("CaptchaCode", "registerCaptcha", "Incorrect CAPTCHA code!")]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (dao.CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Username already exist.");
                }
                else if (dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email already exist.");

                }
                else
                {
                    var user = new Customer();

                    user.First_Name = model.First_Name;
                    user.Last_Name = model.Last_Name;
                    user.UserName = model.UserName;
                    user.Password = Encryptor.MD5Hash(model.Password);
                    user.Phone = model.Phone;
                    user.Email = model.Email;
                    user.Address = model.Address;
                    var result = dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Sign up successfully.";
                        model = new RegisterModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Sign up unsuccessfully.");
                    }
                }
            }
            return View(model);

        }
    #endregion

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        //Login For User
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            string userName = f["txtUserName"].ToString();
            string passWord = f.Get("txtPassword").ToString();
            Customer ctm = db.Customers.SingleOrDefault(n=>n.UserName == userName && n.Password == passWord);

            if(ctm != null)
            {
                ViewBag.Message = "Congratulation! Login successfully.";
                // Session["UserName"] = ctm;
                var userSession = new UserLogin();
                userSession.UserName = ctm.UserName;
                userSession.UserID = ctm.CustomerID;
                Session.Add(CommonConstants.USER_SESSION, userSession);
                return RedirectToAction("Index","Home");
            }           
            ViewBag.Message = "Username or Password was wrong";
            return View();
        }      
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            System.Threading.Thread.Sleep(1000);
            ViewBag.Message = "Logout Successfully";
            return RedirectToAction("Index", "Home");
        }

        //public ActionResult Profile()
        //{

        //}
    }
}
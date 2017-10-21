using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using System.Threading.Tasks;
using OnlineShop.Dao;
using System.Configuration;
using System.Data.SqlClient;

namespace OnlineShop.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact       
        OnlineShopDB db = new OnlineShopDB();
        #region Contact        
        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
                
        public ActionResult Contact(Contact model)
        {
            string constr = ConfigurationManager.ConnectionStrings["OnlineShopDB"].ConnectionString;
            using(SqlConnection con = new SqlConnection(constr))
            {
                string query = " INSERT INTO dbo.Contact (YourName,Email,Subject,Message) VALUES( @YourName, @Email, @Subject, @Message )";
                query += " SELECT SCOPE_IDENTITY()";
                using (SqlCommand cmd = new SqlCommand(query,con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@YourName", model.YourName ??(object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@Email", model.Email ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@Subject", model.Subject ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@Message", model.Message ?? (object)DBNull.Value);                    
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //db.SaveChanges();
                }
                
                if (ModelState.IsValid)
                {
                    ViewBag.Success = "Send Request Successfully";
                    System.Threading.Thread.Sleep(1000);
                }
                else
                {                   
                    ViewBag.Error = "Send Request Not Successfully";
                    return View("Contact");
                }
            }
          
            return View(model);           
        }                
        #endregion
       
    }
}
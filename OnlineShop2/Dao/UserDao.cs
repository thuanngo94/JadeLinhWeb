using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;

namespace OnlineShop.Dao
{
    public class UserDao
    {
        OnlineShopDB db = null;
        public UserDao()
        {
             db = new OnlineShopDB();
        }
        public long Insert(Customer entities)
        {
            try
            {
                db.Customers.Add(entities);
                db.SaveChanges();
                
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
            return entities.CustomerID;
        }

        public Customer GetById(string userName)
        {
            return db.Customers.SingleOrDefault(x=>x.UserName == userName); 
        }

        public bool Login(string userName, string passWord)
        {
            var result = db.Customers.Count(x => x.UserName == userName && x.Password == passWord);
            if (result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        
        public bool CheckUserName(string userName)
        {
            return db.Customers.Count(x => x.UserName == userName) > 0;
        }
        public bool CheckEmail(string email)
        {
            return db.Customers.Count(x => x.Email == email) > 0;
        }
    }
}
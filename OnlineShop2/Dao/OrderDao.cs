using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShop.Dao
{
    public class OrderDao
    {
        OnlineShopDB db = new OnlineShopDB();

        public long Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.OrderID;
        }
    }
}
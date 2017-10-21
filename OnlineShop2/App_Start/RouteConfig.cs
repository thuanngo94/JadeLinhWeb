using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace OnlineShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

             // BotDetect requests must not be routed
            routes.IgnoreRoute("{*botdetect}",
              new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional},
                namespaces: new[] { "OnlineShop.Controllers" }
            );

            routes.MapRoute(
                name: "Register",
                url: "sign-up",
                defaults: new { controller = "User", action = "Register", id = UrlParameter.Optional },
                namespaces: new[] { "OnlineShop.Controllers" }
            );

            routes.MapRoute(
               name: "Add To Cart",
               url: "add-to-cart",
               defaults: new { controller = "ShoppingCart", action = "AddToCart", id = UrlParameter.Optional },
               namespaces: new[] { "OnlineShop.Controllers" }
           );

            routes.MapRoute(
               name: "Login",
               url: "sign-in",
               defaults: new { controller = "User", action = "Login", id = UrlParameter.Optional },
               namespaces: new[] { "OnlineShop.Controllers" }
           );

            routes.MapRoute(
           name: "Contact",
           url: "contact",
           defaults: new { controller = "Contact", action = "Contact", id = UrlParameter.Optional },
           namespaces: new[] { "OnlineShop.Controllers" }
           );

            routes.MapRoute(
               name: "Order",
               url: "order",
               defaults: new { controller = "ShoppingCart", action = "Order", id = UrlParameter.Optional },
               namespaces: new[] { "OnlineShop.Controllers" }
           );
        }      
    }
}

using BotDetect.Drawing;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class ColorController : Controller
    {
        // GET: Color
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult FetchColors()
        {
            var colors = new List<Color>();
            foreach(var color in Enum.GetNames(typeof(KnownColor)))
            {
                var colorValue = ColorTranslator.FromHtml(color);
                var html = string.Format("#{0:X2} {1:X2} {2:X2}",
                                            colorValue.R, colorValue.G, colorValue.B);
                colors.Add(new Color { Html = html });
            }
            return Json(colors.ToArray());
        }
        public class Color
        {
            public string Html { get; set; }
        }
    }
}
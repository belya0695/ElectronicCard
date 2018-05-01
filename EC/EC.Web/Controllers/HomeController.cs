using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EC.Common;

namespace EC.Web.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            Logger logger = new Logger();
            logger.LogInfo("я кажется работаю");
            return View();
        }
    }
}
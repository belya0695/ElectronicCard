using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EC.Common;
using EC.Business;

namespace EC.Web.Controllers
{
    public class HomeController : Controller
    {
        Logger logger = new Logger();

        // GET: Home
        public ActionResult Index()
        {
            try
            {                
                logger.LogInfo("я кажется работаю");
                StacktraseTest.TestMethod();
            }
            catch (ArgumentException ex)
            {
                logger.LogInfo(ex.Message);
                return Redirect("/Content/Exceptions/500.html");
            }
            return View();
        }
    }
}
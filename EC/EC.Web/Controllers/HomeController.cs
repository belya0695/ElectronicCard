using System;
using System.Web.Mvc;
using EC.Common.Log;

namespace EC.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger _logger;

        public HomeController(ILogger logger)
        {
            _logger = logger;
        }

        public ActionResult StartPage()
        {
            try
            {
                return View();
            }
            catch (ArgumentException ex)
            {
                _logger.LogInfo(ex.Message);
                return View("ServerError");
            }
        }

        public ActionResult EditorStartPage()
        {
            return View();
        }
    }
}
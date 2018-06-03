using System;
using System.Web.Mvc;
using EC.Common.Loggers;
using EC.Business;

namespace EC.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger _logger;
        private readonly IStacktraseTest _stacktraseTest;

        public HomeController(ILogger logger, IStacktraseTest stacktraseTest)
        {
            _logger = logger;
            _stacktraseTest = stacktraseTest;
        }

        // GET: Home
        public ActionResult StartPage()
        {
            try
            {
                //_stacktraseTest.TestMethod();
                return View();
            }
            catch (ArgumentException ex)
            {
                _logger.LogInfo(ex.Message);
                return Redirect("/Content/Exceptions/500.html");
            }
        }

        public ActionResult EditorStartPage()
        {
            return View();
        }
    }
}
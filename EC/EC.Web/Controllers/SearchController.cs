using EC.Web.AuthAttributes;
using System.Web.Mvc;

namespace EC.Web.Controllers
{
    public class SearchController : Controller
    {
        [Patient]
        public ActionResult SearchPage()
        {
            return View();
        }
    }
}
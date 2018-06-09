using EC.Web.AuthAttributes;
using System.Web.Mvc;

namespace EC.Web.Controllers
{
    //[Patient]
    public class SearchController : Controller
    {
        public ActionResult SearchPage()
        {
            return View();
        }

        public ActionResult SearchByDate()
        {

            return View();
        }

        public ActionResult SearchByDiagnosis()
        {

            return View();
        }

        public ActionResult SearchByPost()
        {

            return View();
        }
    }
}
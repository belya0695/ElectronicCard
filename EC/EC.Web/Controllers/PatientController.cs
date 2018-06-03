using System.Web.Mvc;

namespace EC.Web.Controllers
{
    public class PatientController : Controller
    {
        public ActionResult GetPatientList()
        {
            return View();
        }
    }
}
using EC.Web.AuthAttributes;
using System.Web.Mvc;

namespace EC.Web.Controllers
{
    public class PatientController : Controller
    {
        [Doctor]
        public ActionResult GetPatientList()
        {
            return View();
        }
    }
}
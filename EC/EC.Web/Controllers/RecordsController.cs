using System.Web.Mvc;
using EC.Business.Interfaces;

namespace EC.Web.Controllers
{
    public class RecordsController : Controller
    {
        private readonly IRecordProvider _recordProvider;

        public RecordsController(IRecordProvider recordProvider)
        {
            _recordProvider = recordProvider;
        }

        public ActionResult GetRecordsList()
        {
            return View(_recordProvider.GetRecordDatesByPatientId(8));//TODO id
        }

        public ActionResult GetRecord(int id)
        {
            return View(_recordProvider.GetRecordById(id));
        }

        public ActionResult SearchPage()
        {
            return View();
        }
    }
}
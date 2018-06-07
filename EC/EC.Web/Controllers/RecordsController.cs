using System;
using System.Web.Mvc;
using EC.Business.Providers;

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

        public ActionResult GetRecordByPatientIdAndDate(int patientId, DateTime date)
        {
            ViewBag.Date = date.ToString("d");
            return View(_recordProvider.GetRecordByPatientIdAndDate(patientId, date)); //TODO id во вьюхе ставится 8
        }

        public ActionResult SearchPage()
        {
            return View();
        }
    }
}
using EC.Business.Providers;
using EC.Common.Log;
using EC.Common.Models;
using EC.Web.AuthAttributes;
using EC.Web.AuthAttributes.Models;
using System;
using System.Web.Mvc;

namespace EC.Web.Controllers
{
    [Patient]
    public class SearchController : Controller
    {
        private readonly ILogger _logger;
        private readonly IRecordProvider _recordProvider;

        public SearchController(ILogger logger, IRecordProvider recordProvider)
        {
            _logger = logger;
            _recordProvider = recordProvider;
        }

        public ActionResult SearchPage()
        {
            return View();
        }

        public ActionResult SearchByDate(DateTime date)
        {
            //try
            //{

            //}
            //catch
            //{

            //}
            Record[] records = _recordProvider.GetRecordByPatientIdAndDate(((UserPrincipal)User).UserId, date);
            return View("RecordsList", records);
        }

        public ActionResult SearchByDiagnosis(string diagnosis)
        {
            Record[] records = _recordProvider.GetRecordByPatientIdAndDiagnosis(((UserPrincipal)User).UserId, diagnosis);
            return View("RecordsList", records);
        }

        public ActionResult SearchByPost(string post)
        {
            Record[] records = _recordProvider.GetRecordByPatientIdAndDoctorsPost(((UserPrincipal)User).UserId, post);
            return View("RecordsList", records);
        }
    }
}
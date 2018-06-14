using System;
using System.Web.Mvc;
using System.Web.UI;
using EC.Business.Providers;
using EC.Common.Log;
using EC.Web.AuthAttributes;
using EC.Web.AuthAttributes.Models;

namespace EC.Web.Controllers
{
    public class RecordsController : Controller
    {
        private readonly IRecordProvider _recordProvider;
        private readonly ILogger _logger;

        public RecordsController(IRecordProvider recordProvider, ILogger logger)
        {
            _recordProvider = recordProvider;
            _logger = logger;
        }

        [Patient]
        [OutputCache(Duration = 300, Location = OutputCacheLocation.Client)]
        public ActionResult GetRecordsList()
        {
            return View(_recordProvider.GetRecordDatesByPatientId(((UserPrincipal)User).UserId));
        }

        [Patient]
        public ActionResult GetRecord(int id)
        {
            return View(_recordProvider.GetRecordById(id));
        }

        [Patient]
        [OutputCache(Duration = 300, Location = OutputCacheLocation.Client)]
        public ActionResult GetRecordByPatientIdAndDate(DateTime date)
        {
            ViewBag.Date = date.ToString("d");
            return View(_recordProvider.GetRecordByPatientIdAndDate(((UserPrincipal)User).UserId, date));
        }
    }
}
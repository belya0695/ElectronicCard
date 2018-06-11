using System;
using System.Web.Mvc;
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
        public ActionResult GetRecordsList()
        {
            return View(_recordProvider.GetRecordDatesByPatientId(((UserPrincipal)User).UserId));//TODO id
        }

        [Patient]
        public ActionResult GetRecord(int id)
        {
            return View(_recordProvider.GetRecordById(id));
        }

        [Patient]
        public ActionResult GetRecordByPatientIdAndDate(DateTime date)
        {
            ViewBag.Date = date.ToString("d");
            return View(_recordProvider.GetRecordByPatientIdAndDate(((UserPrincipal)User).UserId, date)); //TODO id во вьюхе ставится 8
        }
    }
}
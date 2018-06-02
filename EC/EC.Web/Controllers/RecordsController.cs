using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EC.Business.Interfaces;
using EC.Common.Models;

namespace EC.Web.Controllers
{
    public class RecordsController : Controller
    {
        private readonly IRecordProvider _recordProvider;

        public RecordsController(IRecordProvider recordProvider)
        {
            _recordProvider = recordProvider;
        }
        // GET: Records
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
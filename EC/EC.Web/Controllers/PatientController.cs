﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;

namespace EC.Web.Controllers
{
    public class PatientController : Controller
    {

        // GET: Patient
        public ActionResult GetPatientList()
        {
            return View();
        }
    }
}
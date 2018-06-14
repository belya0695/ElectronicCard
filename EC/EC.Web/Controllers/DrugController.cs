using EC.Business.Providers;
using EC.Common.Log;
using System;
using System.ComponentModel;
using System.Web.Mvc;

namespace EC.Web.Controllers
{
    [Editor]
    public class DrugController : Controller
    {
        private readonly ILogger _logger;
        private readonly IDrugProvider _drugProvider;

        public DrugController(ILogger logger, IDrugProvider drugProvider)
        {
            _logger = logger;
            _drugProvider = drugProvider;
        }

        public ActionResult DrugsList()
        {

            return View(_drugProvider.GetDrugs());
        }

        public ActionResult AddDrug()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddDrug(string drugName)
        {

            _drugProvider.AddDrug(drugName);
            return Redirect("~/Drug/DrugsList");
        }

        public ActionResult DeleteDrug(int drugId)
        {
            try
            {
                _drugProvider.DeleteDrug(drugId);
                return Redirect("~/Drug/DrugsList");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return Redirect("/Error/ServerError");
            }
        }

        [HttpPost]
        public ActionResult UpdateDrug(int drugId, string drugName)
        {
            _drugProvider.UpdateDrug(drugId, drugName);
            return Redirect("~/Drug/DrugsList");
        }

        public ActionResult GetDrug(int drugId)
        {
            return View(_drugProvider.GetDrug(drugId));
        }
    }
}
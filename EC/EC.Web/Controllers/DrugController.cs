using EC.Business.Providers;
using EC.Common.Log;
using EC.Common.Models;
using EC.Web.Models;
using System;
using System.ComponentModel;
using System.Data.SqlClient;
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
        public ActionResult AddDrug(DrugViewModel drugViewModel)
        {
            if (ModelState.IsValid)
            {
                _drugProvider.AddDrug(drugViewModel.DrugName);
                return Redirect("~/Drug/DrugsList");
            }
            else
            {
                return View(drugViewModel);
            }
        }

        public ActionResult DeleteDrug(int drugId)
        {
            try
            {
                _drugProvider.DeleteDrug(drugId);
                return Redirect("~/Drug/DrugsList");
            }
            catch (SqlException ex)
            {
                _logger.LogError(ex.Message);
                ViewBag.Message = ex.Message;
                return View("SqlError");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return Redirect("/Error/ServerError");
            }
        }

        [HttpPost]
        public ActionResult UpdateDrug(DrugViewModel drugViewModel)
        {
            if (ModelState.IsValid)
            {
                _drugProvider.UpdateDrug(drugViewModel.DrugId, drugViewModel.DrugName);
                return Redirect("~/Drug/DrugsList");
            }
            else
            {
                return View("GetDrug", drugViewModel);
            }
        }

        public ActionResult GetDrug(int drugId)
        {
            return View(ConvertDrugToDrugViewModel(_drugProvider.GetDrug(drugId)));
        }

        private DrugViewModel ConvertDrugToDrugViewModel(Drug drug)
        {
            DrugViewModel drugViewModel = new DrugViewModel()
            {
                DrugId = drug.DrugId,
                DrugName = drug.DrugName
            };
            return drugViewModel;
        }
    }
}
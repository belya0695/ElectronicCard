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
    public class ProcedureController : Controller
    {
        private readonly ILogger _logger;
        private readonly IProcedureProvider _procedureProvider;

        public ProcedureController(ILogger logger, IProcedureProvider procedureProvider)
        {
            _logger = logger;
            _procedureProvider = procedureProvider;
        }

        public ActionResult ProceduresList()
        {
            return View(_procedureProvider.GetProcedures());
        }

        public ActionResult AddProcedure()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddProcedure(ProcedureViewModel procedureViewModel)
        {
            if (ModelState.IsValid)
            {
                _procedureProvider.AddProcedure(procedureViewModel.ProcedureName);
                return Redirect("~/Procedure/ProceduresList");
            }
            else
            {
                return View(procedureViewModel);
            }
        }

        public ActionResult DeleteProcedure(int procedureId)
        {
            try
            {
                _procedureProvider.DeleteProcedure(procedureId);
                return Redirect("~/Procedure/ProceduresList");
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
        public ActionResult UpdateProcedure(ProcedureViewModel procedureViewModel)
        {
            if (ModelState.IsValid)
            {
                _procedureProvider.UpdateProcedure(procedureViewModel.ProcedureId, procedureViewModel.ProcedureName);
                return Redirect("~/Procedure/ProceduresList");
            }
            else
            {
                return View("GetProcedure", procedureViewModel);
            }
        }

        public ActionResult GetProcedure(int procedureId)
        {
            return View(ConvertProcedureToProcedureViewModel(_procedureProvider.GetProcedure(procedureId)));
        }

        private ProcedureViewModel ConvertProcedureToProcedureViewModel(Procedure procedure)
        {
            ProcedureViewModel procedureViewModel = new ProcedureViewModel()
            {
                ProcedureId = procedure.ProcedureId,
                ProcedureName = procedure.ProcedureName
            };
            return procedureViewModel;
        }
    }
}
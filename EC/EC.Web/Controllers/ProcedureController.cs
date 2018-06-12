using EC.Business.Providers;
using EC.Common.Log;
using System;
using System.ComponentModel;
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
        public ActionResult AddProcedure(string procName)
        {
            _procedureProvider.AddProcedure(procName);
            return Redirect("~/Procedure/ProceduresList");
        }

        public ActionResult DeleteProcedure(int procedureId)
        {
            try
            {
                _procedureProvider.DeleteProcedure(procedureId);
                return Redirect("~/Procedure/ProceduresList");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return Redirect("/Error/ServerError");
            }
        }

        [HttpPost]
        public ActionResult UpdateProcedure(int procedureId, string procName)
        {
            _procedureProvider.UpdateProcedure(procedureId, procName);
            return Redirect("~/Procedure/ProceduresList");
        }

        public ActionResult GetProcedure(int procedureId)
        {
            return View(_procedureProvider.GetProcedure(procedureId));
        }
    }
}
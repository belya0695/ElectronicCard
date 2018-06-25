using EC.Business.Providers;
using EC.Common.Log;
using System;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace EC.Web.Controllers
{
    [Editor]
    public class DiagnosisController : Controller
    {
        private readonly ILogger _logger;
        private readonly IDiagnosisProvider _diagnosisProvider;

        public DiagnosisController(ILogger logger, IDiagnosisProvider diagnosisProvider)
        {
            _logger = logger;
            _diagnosisProvider = diagnosisProvider;
        }

        public ActionResult DiagnosesList()
        {
            return View(_diagnosisProvider.GetDiagnoses());
        }

        public ActionResult AddDiagnosis()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddDiagnosis(string diagnosisName)
        {

            _diagnosisProvider.AddDiagnosis(diagnosisName);
            return Redirect("~/Diagnosis/DiagnosesList");
        }

        public ActionResult DeleteDiagnosis(int diagnosisId)
        {
            try
            {
                _diagnosisProvider.DeleteDiagnosis(diagnosisId);
                return Redirect("~/Diagnosis/DiagnosesList");
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
        public ActionResult UpdateDiagnosis(int diagnosisId, string diagnosisName)
        {
            _diagnosisProvider.UpdateDiagnosis(diagnosisId, diagnosisName);
            return Redirect("~/Diagnosis/DiagnosesList");
        }

        public ActionResult GetDiagnosis(int diagnosisId)
        {
            return View(_diagnosisProvider.GetDiagnosis(diagnosisId));
        }
    }
}
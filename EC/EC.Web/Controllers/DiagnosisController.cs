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
        public ActionResult AddDiagnosis(DiagnosisViewModel diagnosisViewModel)
        {
            if (ModelState.IsValid)
            {
                _diagnosisProvider.AddDiagnosis(diagnosisViewModel.DiagnosisName);
                return Redirect("~/Diagnosis/DiagnosesList");
            }
            else
            {
                return View(diagnosisViewModel);
            }
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
        public ActionResult UpdateDiagnosis(DiagnosisViewModel diagnosisViewModel)
        {
            if (ModelState.IsValid)
            {
                _diagnosisProvider.UpdateDiagnosis(diagnosisViewModel.DiagnosisId, diagnosisViewModel.DiagnosisName);
                return Redirect("~/Diagnosis/DiagnosesList");
            }
            else
            {
                return View("GetDiagnosis", diagnosisViewModel);
            }
        }

        public ActionResult GetDiagnosis(int diagnosisId)
        {
            return View(ConvertDiagnosisToDiagnosisViewModel(_diagnosisProvider.GetDiagnosis(diagnosisId)));
        }

        private DiagnosisViewModel ConvertDiagnosisToDiagnosisViewModel(Diagnosis diagnosis)
        {
            DiagnosisViewModel diagnosisViewModel = new DiagnosisViewModel()
            {
                DiagnosisId = diagnosis.DiagnosisId,
                DiagnosisName = diagnosis.DiagnosisName
            };
            return diagnosisViewModel;
        }
    }
}
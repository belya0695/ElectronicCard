using EC.Common.Models;
using EC.DA.Repositories;

namespace EC.Business.Providers
{
    public class DiagnosisProvider : IDiagnosisProvider
    {
        private readonly IDiagnosisRepository _diagnosisRepository;

        public DiagnosisProvider(IDiagnosisRepository diagnosisRepository)
        {
            _diagnosisRepository = diagnosisRepository;
        }

        public void AddDiagnosis(string diagnosisName)
        {
            _diagnosisRepository.AddDiagnosis(diagnosisName);
        }

        public void DeleteDiagnosis(int diagnosisId)
        {
            _diagnosisRepository.DeleteDiagnosis(diagnosisId);
        }

        public Diagnosis[] GetDiagnoses()
        {
            return _diagnosisRepository.GetDiagnoses();
        }

        public void UpdateDiagnosis(int diagnosisId, string diagnosisName)
        {
            _diagnosisRepository.UpdateDiagnosis(diagnosisId, diagnosisName);
        }
    }
}
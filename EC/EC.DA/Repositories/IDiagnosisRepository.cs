using EC.Common.Models;

namespace EC.DA.Repositories
{
    public interface IDiagnosisRepository
    {
        Diagnosis[] GetDiagnoses();
        void AddDiagnosis(string diagnosisName);
        void DeleteDiagnosis(int diagnosisId);
        void UpdateDiagnosis(int diagnosisId, string diagnosisName);
        Diagnosis GetDiagnosis(int diagnosisId);
    }
}
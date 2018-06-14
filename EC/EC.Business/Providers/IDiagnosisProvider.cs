using EC.Common.Models;

namespace EC.Business.Providers
{
    public interface IDiagnosisProvider
    {
        Diagnosis[] GetDiagnoses();
        void AddDiagnosis(string diagnosisName);
        void DeleteDiagnosis(int diagnosisId);
        void UpdateDiagnosis(int diagnosisId, string diagnosisName);
        Diagnosis GetDiagnosis(int diagnosisId);
    }
}

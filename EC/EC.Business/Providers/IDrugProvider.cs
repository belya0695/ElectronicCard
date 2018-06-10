using EC.Common.Models;

namespace EC.Business.Providers
{
    public interface IDrugProvider
    {
        void AddDrug(string drugName);
        void DeleteDrug(int drugId);
        Drug[] GetDrugs();
        void UpdateDrug(int drugId, string drugName);
    }
}

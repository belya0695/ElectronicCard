using EC.Common.Models;

namespace EC.DA.Repositories
{
    public interface IDrugRepository
    {
        void AddDrug(string drugName);
        void DeleteDrug(int drugId);
        Drug[] GetDrugs();
        void UpdateDrug(int drugId, string drugName);
    }
}
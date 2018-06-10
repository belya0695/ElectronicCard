using EC.Common.Models;

namespace EC.DA.Repositories
{
    public interface IDrugRepository
    {
        void AddDrug(string drugName);
        void DeleteDrug(int drugId);
        Drug[] GetDrugs();
        void UpdateDrug(int drugId, string drugName);

        void AddDrugToDrugList(int recordId, int drugId, string admMode, int duration);
        void DeleteDrugFromDrugList(int recordId, int drugId);
        Drug[] GetDrugList(int recordId);
        void UpdateDrugList(int recordId, int drugId, string admMode, int duration);
    }
}
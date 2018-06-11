using EC.Common.Models;
using EC.DA.Repositories;

namespace EC.Business.Providers
{
    public class DrugProvider : IDrugProvider
    {
        private readonly IDrugRepository _drugRepository;

        public DrugProvider(IDrugRepository drugRepository)
        {
            _drugRepository = drugRepository;
        }

        public void AddDrug(string drugName)
        {
            _drugRepository.AddDrug(drugName);
        }

        public void DeleteDrug(int drugId)
        {
            _drugRepository.DeleteDrug(drugId);
        }

        public Drug[] GetDrugs()
        {
            return _drugRepository.GetDrugs();
        }

        public void UpdateDrug(int drugId, string drugName)
        {
            _drugRepository.UpdateDrug(drugId, drugName);
        }


        public void AddDrugToDrugList(int recordId, int drugId, string admMode, int duration)
        {
            _drugRepository.AddDrugToDrugList(recordId, drugId, admMode, duration);
        }

        public void DeleteDrugFromDrugList(int recordId, int drugId)
        {
            _drugRepository.DeleteDrugFromDrugList(recordId, drugId);
        }

        public Drug[] GetDrugList(int recordId)
        {
            return _drugRepository.GetDrugList(recordId);
        }

        public void UpdateDrugList(int recordId, int drugId, string admMode, int duration)
        {
            _drugRepository.UpdateDrugList(recordId, drugId, admMode, duration);
        }

        public Drug GetDrug(int drugId)
        {
            return _drugRepository.GetDrug(drugId);
        }
    }
}
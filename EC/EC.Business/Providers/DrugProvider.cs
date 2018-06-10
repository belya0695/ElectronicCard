using System;
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
    }
}

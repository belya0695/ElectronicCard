using EC.DA.AvdService;
using EC.DA.Clients;
using EC.DA.Interfaces;
using System;

namespace EC.DA.Repositories
{
    public class AdvertisingRepository : IAdvertisingRepository
    {
        private readonly IAdvClient _advClient;

        public AdvertisingRepository(IAdvClient advClient)
        {
            _advClient = advClient;
        }

        public Advertising[] GetAdvertisings(int count)
        {
            return _advClient.GetAdvertising(count);
        }
    }
}
using System;
using EC.DA.Repositories;
using EC.Common.Models;
using EC.Common.Log;

namespace EC.Business.Providers
{
    public class AdvProvider : IAdvProvider
    {
        private readonly IAdvertisingRepository _advertisingRepository;
        private readonly ILogger _logger;

        public AdvProvider(IAdvertisingRepository advertisingRepository, ILogger logger)
        {
            _advertisingRepository = advertisingRepository;
            _logger = logger;
        }

        public Image[] GetAdvertisings(int count)
        {
            try
            {
                Image[] advImages = _advertisingRepository.GetAdvertisings(count);
                return advImages;
            }
            catch (NullReferenceException)
            {
                _logger.LogError("AdvProvider. Smth wrong with service.");
                return null;
            }
        }
    }
}
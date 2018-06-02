using System;
using EC.Business.Interfaces;
using EC.DA.Interfaces;
using EC.Common.Models;
using EC.Common.Loggers;

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
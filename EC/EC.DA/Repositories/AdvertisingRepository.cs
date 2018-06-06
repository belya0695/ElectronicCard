using EC.Common.Log;
using EC.Common.Models;
using EC.DA.AvdService;
using EC.DA.Clients;
using System.ServiceModel;

namespace EC.DA.Repositories
{
    public class AdvertisingRepository : IAdvertisingRepository
    {
        private readonly IAdvClient _advClient;
        private readonly ILogger _logger;

        public AdvertisingRepository(IAdvClient advClient, ILogger logger)
        {
            _advClient = advClient;
            _logger = logger;
        }

        public Image[] GetAdvertisings(int count)
        {
            try
            {
                Advertising[] adv = _advClient.GetAdvertising(count);
                Image[] advImages = new Image[count];
                for (int i = 0; i < count; i++)
                {
                    advImages[i] = new Image
                    {
                        ImageData = adv[i].ImageData,
                        Extensions = adv[i].Extensions
                    };
                }
                return advImages;
            }
            catch (FaultException ex)
            {
                _logger.LogError(ex.Reason.ToString());
                return null;
            }             
        }
    }
}
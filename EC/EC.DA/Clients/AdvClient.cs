using System;
using EC.DA.AvdService;
using EC.Common.Loggers;

namespace EC.DA.Clients
{
    public class AdvClient : IAdvClient
    {
        private readonly ILogger _logger;

        public AdvClient(ILogger logger)
        {
            _logger = logger;
        }
        public Advertising[] GetAdvertising(int count)
        {
            try
            {
                //TODO: try catch
                Advertising[] adv;
                using (AdvertisingProviderClient client = new AdvertisingProviderClient())
                {
                    client.Open();
                    adv = client.GetAdvertising(count);
                    client.Close();
                }
                return adv;
            }
            catch (Exception e)
            {
                _logger.LogError(e);
                return null;
            }
        }
    }
}
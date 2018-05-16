using System;
using EC.DA.AvdService;

namespace EC.DA.Clients
{
    public class AdvClient : IAdvClient
    {
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
            catch (Exception)
            {
                return null;
            }
        }
    }
}
using EC.Common.Models;
using EC.DA.AvdService;
using EC.DA.Clients;
using EC.DA.Interfaces;

namespace EC.DA.Repositories
{
    public class AdvertisingRepository : IAdvertisingRepository
    {
        private readonly IAdvClient _advClient;

        public AdvertisingRepository(IAdvClient advClient)
        {
            _advClient = advClient;
        }

        public Image[] GetAdvertisings(int count)
        {
            Advertising[] adv = _advClient.GetAdvertising(count);
            if (adv != null)
            {               
                Image[] advImages = new Image[count];
                for (int i = 0; i < count; i++)
                {
                    advImages[i] = new Image();
                    advImages[i].ImageData = adv[i].ImageData;
                    advImages[i].Extensions = adv[i].Extensions;
                }
                return advImages;
            }
            else
            {
                return null;
            }
        }
    }
}
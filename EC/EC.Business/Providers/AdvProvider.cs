using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC.Business.Interfaces;
using EC.DA.AvdService;
using EC.DA.Interfaces;
using EC.Common.Models;

namespace EC.Business.Providers
{
    public class AdvProvider : IAdvProvider
    {
        private readonly IAdvertisingRepository _advertisingRepository;

        public AdvProvider(IAdvertisingRepository advertisingRepository)
        {
            _advertisingRepository = advertisingRepository;
        }

        public Image[] GetAdvertisings(int count)
        {
            try
            {
                Advertising[] adv = _advertisingRepository.GetAdvertisings(count);
                Image[] advImages = new Image[count];

                for (int i = 0; i < count; i++)
                {
                    advImages[i] = new Image();
                    advImages[i].ImageData = adv[i].ImageData;
                    advImages[i].Extensions = adv[i].Extensions;
                }
                return advImages;
            }
            catch (NullReferenceException)
            {
                return null;
            }
        }
    }
}
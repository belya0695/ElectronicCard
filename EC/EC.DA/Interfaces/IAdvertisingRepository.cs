using EC.DA.AvdService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC.DA.Interfaces
{
    public interface IAdvertisingRepository
    {
        Advertising[] GetAdvertisings(int count);
    }
}
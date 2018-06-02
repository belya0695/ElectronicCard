using EC.Common.Models;

namespace EC.DA.Interfaces
{
    public interface IAdvertisingRepository
    {
        Image[] GetAdvertisings(int count);
    }
}
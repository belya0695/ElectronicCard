using EC.Common.Models;

namespace EC.DA.Repositories
{
    public interface IAdvertisingRepository
    {
        Image[] GetAdvertisings(int count);
    }
}
using EC.Common.Models;

namespace EC.Business.Providers
{
    public interface IAdvProvider
    {
        Image[] GetAdvertisings(int count);
    }
}

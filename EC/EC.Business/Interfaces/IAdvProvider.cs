using EC.DA.AvdService;
using EC.Common.Models;

namespace EC.Business.Interfaces
{
    public interface IAdvProvider
    {
        Image[] GetAdvertisings(int count);
    }
}

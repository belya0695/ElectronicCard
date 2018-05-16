using EC.DA.AvdService;

namespace EC.DA.Clients
{
    public interface IAdvClient
    {
        Advertising[] GetAdvertising(int count);
    }
}
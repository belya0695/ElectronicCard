using EC.Common.Models;

namespace EC.Business.Providers
{
    public interface IUserProvider
    {
        User GetUserByLogin(string userLogin);
    }
}

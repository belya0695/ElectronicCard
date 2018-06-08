using EC.Common.Models;

namespace EC.DA.Repositories
{
    public interface IUserRepository
    {
        User GetUserByLogin(string userLogin);
    }
}
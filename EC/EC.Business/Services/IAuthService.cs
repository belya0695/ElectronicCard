using EC.Business.Enums;

namespace EC.Business.Services
{
    public interface IAuthService
    {
        LoginResult Login(string userName, string password);
        void Logout();
    }
}
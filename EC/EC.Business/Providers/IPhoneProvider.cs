using EC.Common.Models;

namespace EC.Business.Providers
{
    public interface IPhoneProvider
    {
        void AddUserPhone(int userId, string phone);
        void DeleteUserPhone(int phoneId);
        Phone[] GetUserPhonesByUserId(int userId);
        void UpdateUserPhone(int phoneId, string phone);
    }
}
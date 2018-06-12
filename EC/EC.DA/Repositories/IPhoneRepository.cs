using EC.Common.Models;

namespace EC.DA.Repositories
{
    public interface IPhoneRepository
    {
        void AddUserPhone(int userId, string phone);
        void DeleteUserPhone(int phoneId);
        Phone[] GetUserPhonesByUserId(int userId);
        void UpdateUserPhone(int phoneId, string phone);
    }
}
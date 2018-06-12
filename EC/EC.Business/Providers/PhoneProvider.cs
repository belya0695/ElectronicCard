using EC.Common.Models;
using EC.DA.Repositories;

namespace EC.Business.Providers
{
    public class PhoneProvider : IPhoneProvider
    {
        private readonly IPhoneRepository _phoneRepository;

        public PhoneProvider(IPhoneRepository phoneRepository)
        {
            _phoneRepository = phoneRepository;
        }

        public void AddUserPhone(int userId, string phone)
        {
            _phoneRepository.AddUserPhone(userId, phone);
        }

        public void DeleteUserPhone(int phoneId)
        {
            _phoneRepository.DeleteUserPhone(phoneId);
        }

        public Phone[] GetUserPhonesByUserId(int userId)
        {
            return _phoneRepository.GetUserPhonesByUserId(userId);
        }

        public void UpdateUserPhone(int phoneId, string phone)
        {
            _phoneRepository.UpdateUserPhone(phoneId, phone);
        }
    }
}
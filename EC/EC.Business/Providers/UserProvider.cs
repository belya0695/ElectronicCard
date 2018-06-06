using System;
using EC.Common.Models;
using EC.DA.Repositories;

namespace EC.Business.Providers
{
    public class UserProvider : IUserProvider
    {
        private readonly IUserRepository _userRepository;

        public UserProvider(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }
        public User GetUserByLogin(string userLogin)
        {
            return _userRepository.GetUserByLogin(userLogin);
        }
    }
}

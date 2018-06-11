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

        public void AddLogin(string login, string pass, int userId, int roleId)
        {
            _userRepository.AddLogin(login, pass, userId, roleId);
        }

        public void AddUserWithLoginAndPhone(string firstName, string middleName, string lastName, int postId, DateTime birthdate, string workplace, string email, string phone, string login, string pass, int roleId)
        {
            _userRepository.AddUserWithLoginAndPhone(firstName, middleName, lastName, postId, birthdate, workplace, email, phone, login, pass, roleId);
        }

        public void DeleteLogin(string login)
        {
            _userRepository.DeleteLogin(login);
        }

        public void DeleteUserAndHisPhone(int userId)
        {
            _userRepository.DeleteUserAndHisPhone(userId);
        }

        public User[] GetAllUsers()
        {
            return _userRepository.GetAllUsers();
        }

        public User GetUserByLogin(string userLogin)
        {
            return _userRepository.GetUserByLogin(userLogin);
        }

        public void UpdateUser(int userId, string firstName, string middleName, string lastName, int postId, DateTime birthdate, string workplace, string email)
        {
            _userRepository.UpdateUser(userId, firstName, middleName, lastName, postId, birthdate, workplace, email);
        }
    }
}

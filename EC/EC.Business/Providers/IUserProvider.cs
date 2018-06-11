using EC.Common.Models;
using System;

namespace EC.Business.Providers
{
    public interface IUserProvider
    {
        User GetUserByLogin(string userLogin);
        void AddUserWithLoginAndPhone(string firstName, string middleName, string lastName, int postId, DateTime birthdate, string workplace, string email, string phone, string login, string pass, int roleId);
        void DeleteUserAndHisPhone(int userId);
        void UpdateUser(int userId, string firstName, string middleName, string lastName, int postId, DateTime birthdate, string workplace, string email);
        User[] GetAllUsers();
        void AddLogin(string login, string pass, int userId, int roleId);
        void DeleteLogin(string login);
    }
}
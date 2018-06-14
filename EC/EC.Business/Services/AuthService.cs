using EC.Business.Enums;
using Newtonsoft.Json;
using System.Web;
using System.Web.Security;
using System;
using EC.Common.Models;
using EC.Business.Providers;

namespace EC.Business.Services
{
    public class AuthService : IAuthService
    {
        private readonly IUserProvider _userProvider;

        public AuthService(IUserProvider userProvider)
        {
            _userProvider = userProvider;
        }

        public LoginResult Login(string userLogin, string password)
        {
            if (string.IsNullOrEmpty(userLogin) || string.IsNullOrEmpty(password))
            {
                return LoginResult.EmptyCredentials;
            }

            User user = _userProvider.GetUserByLogin(userLogin);

            if (user == null)
            {
                return LoginResult.InvalidLogin;
            }
            else
            {
                if (password != user.Password)
                {
                    return LoginResult.InvalidPassword;
                }

                string userData = JsonConvert.SerializeObject(user);
                FormsAuthenticationTicket authenticationTicket = new FormsAuthenticationTicket(2, userLogin, DateTime.Now, DateTime.Now.AddHours(1), false, userData);
                string eTicket = FormsAuthentication.Encrypt(authenticationTicket);
                HttpCookie httpAuthCookie = new HttpCookie(FormsAuthentication.FormsCookieName, eTicket);
                HttpContext.Current.Response.Cookies.Add(httpAuthCookie);
                return LoginResult.NoError;
            }
        }

        public void Logout()
        {
            FormsAuthentication.SignOut();
        }
    }
}
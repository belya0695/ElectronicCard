using System;
using System.Web.Mvc;
using EC.Business.Enums;
using EC.Business.Services;
using EC.Common.Log;

namespace EC.Web.Controllers
{
    public class LoginController : Controller
    {
        private readonly ILogger _logger;
        private readonly IAuthService _authService;

        public LoginController(ILogger logger, IAuthService authService)
        {
            _logger = logger;
            _authService = authService;
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string login, string password)
        {
            LoginResult result;
            try
            {
                result = _authService.Login(login, password);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return Redirect("/Error/ServerError");
            }
            if (result == LoginResult.NoError)
            {
                return RedirectToAction("StartPage", "Home");
            }
            if (result == LoginResult.EmptyCredentials)
            {
                ViewBag.Message = "No entered username or password ";
            }
            if (result == LoginResult.InvalidLogin)
            {
                ViewBag.Message = "The login is not valid";
            }
            if (result == LoginResult.InvalidPassword)
            {
                ViewBag.Message = "The password is not valid";
            }
            return View();
        }

        public ActionResult Logout()
        {
            _authService.Logout();
            return RedirectToAction("Login", "Login");
        }

        public ActionResult Denied(string requiredRole)
        {
            return View((object)requiredRole);
        }
    }
}
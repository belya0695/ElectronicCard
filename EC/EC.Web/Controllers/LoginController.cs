using EC.Business.Enums;
using EC.Common.Loggers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EC.Web.Controllers
{
    public class LoginController : Controller
    {
        private readonly ILogger _logger;

        public LoginController(ILogger logger)
        {
            _logger = logger;
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
                result = loginService.Login(login, password);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return View("Error", (object)"Login error");
            }
            if (result == LoginResult.NoError)
            {
                return RedirectToAction("Index", "Home");
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
            return RedirectToAction("Login","Login");
        }

        public ActionResult Denied(string requiredRole)
        {
            return View((object)requiredRole);
        }
    }
}
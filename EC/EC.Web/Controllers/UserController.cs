using EC.Web.AuthAttributes;
using EC.Business.Providers;
using EC.Common.Log;
using System;
using System.Web.Mvc;
using EC.Web.AuthAttributes.Models;
using EC.Common.Models;

namespace EC.Web.Controllers
{
    public class UserController : Controller
    {
        private readonly ILogger _logger;
        private readonly IUserProvider _userProvider;
        private readonly IPostProvider _postProvider;

        public UserController(ILogger logger, IUserProvider userProvider, IPostProvider postProvider)
        {
            _logger = logger;
            _userProvider = userProvider;
            _postProvider = postProvider;
        }

        [Doctor]
        public ActionResult GetPatientList()
        {
            return View(_userProvider.GetAllPatients(((UserPrincipal)User).UserId));
        }

        [Admin]
        public ActionResult GetAllUsers()
        {
            return View(_userProvider.GetAllUsers());
        }

        [Admin]
        public ActionResult AddUser()
        {
            ViewBag.Roles = ListForRoles();
            ViewBag.Posts = ListForPosts();
            return View();
        }

        [Admin]
        [HttpPost]
        public ActionResult AddUser(string firstName, string middleName, string lastName, int postId, DateTime birthdate, string workplace, string email, string phone, string login, string pass, int roleId)
        {
            try
            {
                _userProvider.AddUserWithLoginAndPhone(firstName, middleName, lastName, postId, birthdate, workplace, email, phone, login, pass, roleId);
                return Redirect("~/User/GetAllUsers");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return Redirect("/Error/ServerError");
            }
        }

        [Admin]
        public ActionResult GetUserByLogin(string login)
        {
            return View(_userProvider.GetUserByLogin(login));
        }

        [Admin]
        public ActionResult UpdateUser(int userId, string firstName, string middleName, string lastName, int postId, DateTime birthdate, string workplace, string email)
        {
            _userProvider.UpdateUser(userId, firstName, middleName, lastName, postId, birthdate, workplace, email);
            return Redirect("~/User/GetAllUsers");
        }

        [Admin]
        public ActionResult DeleteUserAndHisPhone(int userId)
        {
            try
            {
                _userProvider.DeleteUserAndHisPhone(userId);
                return Redirect("~/User/GetAllUsers");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return Redirect("/Error/ServerError");
            }
        }

        private MultiSelectList ListForRoles()
        {
            Role[] roles = _userProvider.GetAllRoles();
            MultiSelectList multiSelectList = new MultiSelectList(roles, "roleId", "RoleName");
            return multiSelectList;
        }

        private MultiSelectList ListForPosts()
        {
            Post[] posts = _postProvider.GetPosts();
            MultiSelectList multiSelectList = new MultiSelectList(posts, "postId", "PostName");
            return multiSelectList;
        }
    }
}
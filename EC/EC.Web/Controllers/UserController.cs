﻿using EC.Web.AuthAttributes;
using EC.Business.Providers;
using EC.Common.Log;
using System;
using System.Web.Mvc;
using EC.Web.AuthAttributes.Models;
using EC.Common.Models;
using EC.Web.Models;
using System.Data.SqlClient;

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
        public ActionResult AddUser(UserAddViewModel userAdd)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _userProvider.AddUserWithLoginAndPhone(userAdd.FirstName, userAdd.MiddleName, userAdd.LastName, userAdd.UserPostId, userAdd.BirthDate, userAdd.Workplace, userAdd.Email, userAdd.Phone, userAdd.Login, userAdd.Password, userAdd.UserRoleId);
                    return Redirect("~/User/GetAllUsers");
                }
                else
                {
                    ViewBag.Roles = ListForRoles();
                    ViewBag.Posts = ListForPosts();
                    return View(userAdd);
                }
            }
            catch (SqlException ex)
            {
                _logger.LogError(ex.Message);
                ViewBag.Message = ex.Message;
                return View("SqlError");
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
            ViewBag.Posts = ListForPosts();
            return View(ConvertUserToUpdateViewModel(_userProvider.GetUserByLogin(login)));
        }

        [Admin]
        public ActionResult UpdateUser(UserUpdateViewModel userUpdate)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _userProvider.UpdateUser(userUpdate.UserId, userUpdate.FirstName, userUpdate.MiddleName, userUpdate.LastName, userUpdate.UserPostId, userUpdate.BirthDate, userUpdate.Workplace, userUpdate.Email);
                    return Redirect("~/User/GetAllUsers");
                }
                else
                {
                    ViewBag.Posts = ListForPosts();
                    return View("GetUserByLogin", userUpdate);
                }
            }
            catch (SqlException ex)
            {
                _logger.LogError(ex.Message);
                ViewBag.Message = ex.Message;
                return View("SqlError");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return Redirect("/Error/ServerError");
            }
        }

        [Admin]
        public ActionResult DeleteUserAndHisPhone(int userId)
        {
            try
            {
                _userProvider.DeleteUserAndHisPhone(userId);
                return Redirect("~/User/GetAllUsers");
            }
            catch (SqlException ex)
            {
                _logger.LogError(ex.Message);
                ViewBag.Message = ex.Message;
                return View("SqlError");
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
            MultiSelectList multiSelectList = new MultiSelectList(roles, "RoleId", "RoleName");
            return multiSelectList;
        }

        private MultiSelectList ListForPosts()
        {
            Post[] posts = _postProvider.GetPosts();
            MultiSelectList multiSelectList = new MultiSelectList(posts, "PostId", "PostName");
            return multiSelectList;
        }

        private UserUpdateViewModel ConvertUserToUpdateViewModel(User user)
        {
            UserUpdateViewModel userViewModel = new UserUpdateViewModel()
            {
                UserId = user.UserId,
                FirstName = user.FirstName,
                MiddleName = user.MiddleName,
                LastName = user.LastName,
                Workplace = user.Workplace,
                Email = user.Email,
                BirthDate = user.BirthDate,
                UserPostId = user.UserPost.PostId,
                UserRoleId = user.Roles[0].RoleId
            };
            return userViewModel;
        }
    }
}
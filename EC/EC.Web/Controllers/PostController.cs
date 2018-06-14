﻿using EC.Business.Providers;
using EC.Common.Log;
using System;
using System.ComponentModel;
using System.Web.Mvc;

namespace EC.Web.Controllers
{
    [Editor]
    public class PostController : Controller
    {
        private readonly ILogger _logger;
        private readonly IPostProvider _postProvider;

        public PostController(ILogger logger, IPostProvider postProvider)
        {
            _logger = logger;
            _postProvider = postProvider;
        }

        public ActionResult PostsList()
        {
            return View(_postProvider.GetPosts());
        }

        public ActionResult AddPost()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddPost(string postName)
        {
            _postProvider.AddPost(postName);
            return Redirect("~/Post/PostsList");
        }

        public ActionResult DeletePost(int postId)
        {
            try
            {
                _postProvider.DeletePost(postId);
                return Redirect("~/Post/PostsList");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return Redirect("/Error/ServerError");
            }
        }

        [HttpPost]
        public ActionResult UpdatePost(int postId, string postName)
        {
            _postProvider.UpdatePost(postId, postName);
            return Redirect("~/Post/PostsList");
        }

        public ActionResult GetPost(int postId)
        {
            return View(_postProvider.GetPost(postId));
        }
    }
}
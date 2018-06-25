using EC.Business.Providers;
using EC.Common.Log;
using EC.Common.Models;
using EC.Web.Models;
using System;
using System.ComponentModel;
using System.Data.SqlClient;
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
        public ActionResult AddPost(PostViewModel postViewModel)
        {
            if (ModelState.IsValid)
            {
                _postProvider.AddPost(postViewModel.PostName);
                return Redirect("~/Post/PostsList");
            }
            else
            {
                return View(postViewModel);
            }
        }

        public ActionResult DeletePost(int postId)
        {
            try
            {
                _postProvider.DeletePost(postId);
                return Redirect("~/Post/PostsList");
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

        [HttpPost]
        public ActionResult UpdatePost(PostViewModel postViewModel)
        {
            if (ModelState.IsValid)
            {
                _postProvider.UpdatePost(postViewModel.PostId, postViewModel.PostName);
                return Redirect("~/Post/PostsList");
            }
            else
            {
                return View("GetPost", postViewModel);
            }
        }

        public ActionResult GetPost(int postId)
        {
            return View(ConvertPostToPostViewModel(_postProvider.GetPost(postId)));
        }

        private PostViewModel ConvertPostToPostViewModel(Post post)
        {
            PostViewModel postViewModel = new PostViewModel()
            {
                PostId = post.PostId,
                PostName = post.PostName
            };
            return postViewModel;
        }
    }
}
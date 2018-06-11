using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC.Common.Models;
using EC.DA.Repositories;

namespace EC.Business.Providers
{
    public class PostProvider : IPostProvider
    {
        private readonly IPostRepository _postRepository;

        public PostProvider(IPostRepository postRepository)
        {
            _postRepository = postRepository;
        }

        public void AddPost(string postName)
        {
            _postRepository.AddPost(postName);
        }

        public void DeletePost(int postId)
        {
            _postRepository.DeletePost(postId);
        }

        public Post GetPost(int postId)
        {
            return _postRepository.GetPost(postId);
        }

        public Post[] GetPosts()
        {
            return _postRepository.GetPosts();
        }

        public void UpdatePost(int postId, string postName)
        {
            _postRepository.UpdatePost(postId, postName);
        }
    }
}
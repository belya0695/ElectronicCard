using EC.Common.Models;

namespace EC.DA.Repositories
{
    public interface IPostRepository
    {
        void AddPost(string postName);
        void DeletePost(int postId);
        Post[] GetPosts();
        void UpdatePost(int postId, string postName);
        Post GetPost(int postId);
    }
}
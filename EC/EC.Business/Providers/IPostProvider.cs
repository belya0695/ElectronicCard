using EC.Common.Models;

namespace EC.Business.Providers
{
    public interface IPostProvider
    {
        void AddPost(string postName);
        void DeletePost(int postId);
        Post[] GetPosts();
        void UpdatePost(int postId, string postName);
        Post GetPost(int postId);
    }
}
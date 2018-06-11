using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using EC.Common.Models;

namespace EC.DA.Repositories
{
    public class PostRepository : IPostRepository
    {
        private readonly string _allPosts = "GetAllPosts";
        private readonly string _addPost = "AddPost";
        private readonly string _delPost = "DeletePost";
        private readonly string _updPost = "UpdatePost";
        private readonly string _getPost = "GetPostById";

        private readonly string connectionString = ConfigurationManager.ConnectionStrings["EcDbConnection"].ConnectionString;

        public void AddPost(string postName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_addPost, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter postNameParam = new SqlParameter
                {
                    ParameterName = "@post_name",
                    Value = postName
                };
                command.Parameters.Add(postNameParam);
                command.ExecuteNonQuery();
            }
        }

        public void DeletePost(int postId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_delPost, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter postIdParam = new SqlParameter
                {
                    ParameterName = "@post_id",
                    Value = postId
                };
                command.Parameters.Add(postIdParam);
                command.ExecuteNonQuery();
            }
        }

        public Post GetPost(int postId)
        {
            Post post = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_getPost, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter postIdParam = new SqlParameter
                {
                    ParameterName = "@post_id",
                    Value = postId
                };
                command.Parameters.Add(postIdParam);
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        post = new Post
                        {
                            PostId = int.Parse(reader["post_id"].ToString()),
                            PostName = reader["post_name"].ToString()
                        };
                    }
                }
                reader.Close();
            }
            return post;
        }

        public Post[] GetPosts()
        {
            List<Post> posts = new List<Post>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_allPosts, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        var post = new Post
                        {
                            PostId = int.Parse(reader["post_id"].ToString()),
                            PostName = reader["post_name"].ToString()
                        };
                        posts.Add(post);
                    }
                }
                reader.Close();
            }
            return posts.ToArray();
        }

        public void UpdatePost(int postId, string postName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_updPost, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter postIdParam = new SqlParameter
                {
                    ParameterName = "@post_id",
                    Value = postId
                };
                command.Parameters.Add(postIdParam);
                SqlParameter postNameParam = new SqlParameter
                {
                    ParameterName = "@post_name",
                    Value = postName
                };
                command.Parameters.Add(postNameParam);
                command.ExecuteNonQuery();
            }
        }
    }
}
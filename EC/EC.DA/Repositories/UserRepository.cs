using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using EC.Common.Models;

namespace EC.DA.Repositories
{
    public class UserRepository : IUserRepository
    {

        private readonly string _addLogin = "AddLogin";
        private readonly string _addUserWithLoginAndPhone = "AddUserWithLoginAndPhone";
        private readonly string _deleteLogin = "DeleteLogin";
        private readonly string _deleteUserAndHisPhone = "DeleteUserAndHisPhone";
        private readonly string _userByLogin = "GetUserByLogin";
        private readonly string _rolesById = "GetRolesById";
        private readonly string _getAllUsers = "GetAllUsers";
        private readonly string _updateUser = "UpdateUser";

        private readonly string connectionString = ConfigurationManager.ConnectionStrings["EcDbConnection"].ConnectionString;

        public void AddLogin(string login, string pass, int userId, int roleId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_addLogin, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter loginParam = new SqlParameter
                {
                    ParameterName = "@login",
                    Value = login
                };
                command.Parameters.Add(loginParam);

                SqlParameter passParam = new SqlParameter
                {
                    ParameterName = "@pass",
                    Value = pass
                };
                command.Parameters.Add(passParam);
                SqlParameter userIdParam = new SqlParameter
                {
                    ParameterName = "@user_id",
                    Value = userId
                };
                command.Parameters.Add(userIdParam);
                SqlParameter roleIdParam = new SqlParameter
                {
                    ParameterName = "@role_id",
                    Value = roleId
                };
                command.Parameters.Add(roleIdParam);
                command.ExecuteNonQuery();
            }
        }

        public void AddUserWithLoginAndPhone(string firstName, string middleName, string lastName, int postId, DateTime birthdate, string workplace, string email, string phone, string login, string pass, int roleId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_addUserWithLoginAndPhone, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter firstNameParam = new SqlParameter
                {
                    ParameterName = "@first_name",
                    Value = firstName
                };
                command.Parameters.Add(firstNameParam);
                SqlParameter middleNameParam = new SqlParameter
                {
                    ParameterName = "@middle_name",
                    Value = middleName
                };
                command.Parameters.Add(middleNameParam);
                SqlParameter lastNameParam = new SqlParameter
                {
                    ParameterName = "@last_name",
                    Value = lastName
                };
                command.Parameters.Add(lastNameParam);
                SqlParameter postIdParam = new SqlParameter
                {
                    ParameterName = "@post_id",
                    Value = postId
                };
                command.Parameters.Add(postIdParam);
                SqlParameter birthdateParam = new SqlParameter
                {
                    ParameterName = "@birthdate",
                    Value = birthdate
                };
                command.Parameters.Add(birthdateParam);
                SqlParameter workplaceParam = new SqlParameter
                {
                    ParameterName = "@workplace",
                    Value = workplace
                };
                command.Parameters.Add(workplaceParam);
                SqlParameter emailParam = new SqlParameter
                {
                    ParameterName = "@email",
                    Value = email
                };
                command.Parameters.Add(emailParam);
                SqlParameter phoneParam = new SqlParameter
                {
                    ParameterName = "@phone",
                    Value = phone
                };
                command.Parameters.Add(phoneParam);
                SqlParameter loginParam = new SqlParameter
                {
                    ParameterName = "@login",
                    Value = login
                };
                command.Parameters.Add(loginParam);
                SqlParameter passParam = new SqlParameter
                {
                    ParameterName = "@pass",
                    Value = pass
                };
                command.Parameters.Add(passParam);
                SqlParameter roleIdParam = new SqlParameter
                {
                    ParameterName = "@role_id",
                    Value = roleId
                };
                command.Parameters.Add(roleIdParam);
                command.ExecuteNonQuery();
            }
        }

        public void DeleteLogin(string login)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_deleteLogin, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter loginParam = new SqlParameter
                {
                    ParameterName = "@login",
                    Value = login
                };
                command.Parameters.Add(loginParam);
                command.ExecuteNonQuery();
            }
        }

        public void DeleteUserAndHisPhone(int userId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_deleteUserAndHisPhone, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter userIdParam = new SqlParameter
                {
                    ParameterName = "@user_id",
                    Value = userId
                };
                command.Parameters.Add(userIdParam);
                command.ExecuteNonQuery();
            }
        }

        public User[] GetAllUsers()
        {
            List<User> users = new List<User>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_getAllUsers, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        var user = new User
                        {
                            UserId = int.Parse(reader["user_id"].ToString()),
                            FirstName = reader["first_name"].ToString(),
                            MiddleName = reader["middle_name"].ToString(),
                            LastName = reader["last_name"].ToString(),
                            UserPost = new Post
                            {
                                PostId = int.Parse(reader["post_id"].ToString()),
                                PostName = reader["post_name"].ToString()
                            },
                            BirthDate = DateTime.Parse(reader["birthdate"].ToString()),
                            Workplace = reader["workplace"].ToString(),
                            Email = reader["email"].ToString()
                        };
                        users.Add(user);
                    }
                }
                reader.Close();
            }
            return users.ToArray();
        }

        public User GetUserByLogin(string userLogin)
        {
            User user = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_userByLogin, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter userLoginParam = new SqlParameter
                {
                    ParameterName = "@user_login",
                    Value = userLogin
                };
                command.Parameters.Add(userLoginParam);

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        user = new User
                        {
                            UserId = int.Parse(reader["user_id"].ToString()),
                            FirstName = reader["first_name"].ToString(),
                            MiddleName = reader["middle_name"].ToString(),
                            LastName = reader["last_name"].ToString(),
                            UserPost = new Post
                            {
                                PostId = int.Parse(reader["post_id"].ToString()),
                                PostName = reader["post_name"].ToString()
                            },
                            BirthDate = DateTime.Parse(reader["birthdate"].ToString()),
                            Workplace = reader["workplace"].ToString(),
                            Email = reader["email"].ToString(),
                            Login = reader["login"].ToString(),
                            Password = reader["pass"].ToString()
                        };
                    }
                }
                reader.Close();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_rolesById, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter userIdParam = new SqlParameter
                {
                    ParameterName = "@user_id",
                    Value = user.UserId
                };
                command.Parameters.Add(userIdParam);

                var reader = command.ExecuteReader();
                user.Roles = new List<Role>();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        user.Roles.Add(new Role()
                        {
                            RoleId = int.Parse(reader["role_id"].ToString()),
                            RoleName = reader["role_name"].ToString()
                        });
                    }
                }
                reader.Close();
            }
            return user;
        }

        public void UpdateUser(int userId, string firstName, string middleName, string lastName, int postId, DateTime birthdate, string workplace, string email)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_updateUser, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter firstNameParam = new SqlParameter
                {
                    ParameterName = "@first_name",
                    Value = firstName
                };
                command.Parameters.Add(firstNameParam);
                SqlParameter middleNameParam = new SqlParameter
                {
                    ParameterName = "@middle_name",
                    Value = middleName
                };
                command.Parameters.Add(middleNameParam);
                SqlParameter lastNameParam = new SqlParameter
                {
                    ParameterName = "@last_name",
                    Value = lastName
                };
                command.Parameters.Add(lastNameParam);
                SqlParameter postIdParam = new SqlParameter
                {
                    ParameterName = "@post_id",
                    Value = postId
                };
                command.Parameters.Add(postIdParam);
                SqlParameter birthdateParam = new SqlParameter
                {
                    ParameterName = "@birthdate",
                    Value = birthdate
                };
                command.Parameters.Add(birthdateParam);
                SqlParameter workplaceParam = new SqlParameter
                {
                    ParameterName = "@workplace",
                    Value = workplace
                };
                command.Parameters.Add(workplaceParam);
                SqlParameter emailParam = new SqlParameter
                {
                    ParameterName = "@email",
                    Value = email
                };
                command.Parameters.Add(emailParam);
                command.ExecuteNonQuery();
            }
        }
    }
}
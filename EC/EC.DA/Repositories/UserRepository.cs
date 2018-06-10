using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using EC.Common.Models;

namespace EC.DA.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly string UserByLogin = "GetUserByLogin";
        private readonly string RolesById = "GetRolesById";

        private readonly string connectionString = ConfigurationManager.ConnectionStrings["EcDbConnection"].ConnectionString;

        public User GetUserByLogin(string userLogin)
        {
            User user = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(UserByLogin, connection)
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
                            LastName = reader["last_name"].ToString(),
                            MiddleName = reader["middle_name"].ToString(),
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
                SqlCommand command = new SqlCommand(RolesById, connection)
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
    }
}
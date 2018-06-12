using EC.Common.Models;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace EC.DA.Repositories
{
    public class PhoneRepository : IPhoneRepository
    {
        private readonly string _addUserPhone = "AddUserPhone";
        private readonly string _deleteUserPhone = "DeleteUserPhone";
        private readonly string _getUserPhonesByUserId = "GetUserPhonesByUserId";
        private readonly string _updateUserPhone = "UpdateUserPhone";

        private readonly string connectionString = ConfigurationManager.ConnectionStrings["EcDbConnection"].ConnectionString;

        public void AddUserPhone(int userId, string phone)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_addUserPhone, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
               
                SqlParameter phoneParam = new SqlParameter
                {
                    ParameterName = "@phone",
                    Value = phone
                };
                command.Parameters.Add(phoneParam);
                SqlParameter userIdParam = new SqlParameter
                {
                    ParameterName = "@user_id",
                    Value = userId
                };
                command.Parameters.Add(userIdParam);
                command.ExecuteNonQuery();
            }
        }

        public void DeleteUserPhone(int phoneId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_deleteUserPhone, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter phoneIdParam = new SqlParameter
                {
                    ParameterName = "@phone_id",
                    Value = phoneId
                };
                command.Parameters.Add(phoneIdParam);
                command.ExecuteNonQuery();
            }
        }

        public Phone[] GetUserPhonesByUserId(int userId)
        {
            List<Phone> phones = new List<Phone>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_getUserPhonesByUserId, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter userIdParam = new SqlParameter
                {
                    ParameterName = "@user_id",
                    Value = userId
                };
                command.Parameters.Add(userIdParam);

                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        phones.Add(new Phone()
                        {
                            PhoneId = int.Parse(reader["phone_id"].ToString()),
                            PhoneNumber = reader["phone_number"].ToString(),
                            UserId = int.Parse(reader["user_id"].ToString())

                        });
                    }
                }
                reader.Close();
            }
            return phones.ToArray();
        }

        public void UpdateUserPhone(int phoneId, string phone)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_updateUserPhone, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter phoneParam = new SqlParameter
                {
                    ParameterName = "@phone",
                    Value = phone
                };
                command.Parameters.Add(phoneParam);
                SqlParameter phoneIdParam = new SqlParameter
                {
                    ParameterName = "@phone_id",
                    Value = phoneId
                };
                command.Parameters.Add(phoneIdParam);
                command.ExecuteNonQuery();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC.DA.Interfaces;

namespace EC.DA.Repositories
{
    public class PatientRepository : IPatientRepository
    {
        public void Delete(string connectionString)
        {
            throw new NotImplementedException();
        }

        public void Insert(string connectionString)
        {
            throw new NotImplementedException();
        }

        public void Select(string connectionString)
        {
            throw new NotImplementedException();
        }

        public void Update(string connectionString)
        {
            throw new NotImplementedException();
        }

        public void GetAllPatients(string connectionString)
        {
            string sqlExpression = "GetAllPatients";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                var reader = command.ExecuteReader();

                //if (reader.HasRows)
                //{
                //    while (reader.Read())
                //    {
                //        int id = reader.GetInt32(0);
                //        string name = reader.GetString(1);
                //        int age = reader.GetInt32(2);
                //        Console.WriteLine("{0} \t{1} \t{2}", id, name, age);
                //    }
                //}
                reader.Close();
            }
        }
    }
}
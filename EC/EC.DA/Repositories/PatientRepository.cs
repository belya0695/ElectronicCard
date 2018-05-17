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
            }
        }
    }
}
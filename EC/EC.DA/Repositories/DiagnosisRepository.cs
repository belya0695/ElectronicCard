using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using EC.Common.Models;

namespace EC.DA.Repositories
{
    class DiagnosisRepository : IDiagnosisRepository
    {
        private readonly string _allDiag = "GetAllDiagnoses";
        private readonly string _addDiag = "AddDiagnosis";
        private readonly string _delDiag = "DeleteDiagnosis";
        private readonly string _updDiag = "UpdateDiagnosis";

        private readonly string connectionString = ConfigurationManager.ConnectionStrings["EcDbConnection"].ConnectionString;

        public void AddDiagnosis(string diagnosisName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_addDiag, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter diagnosisNameParam = new SqlParameter
                {
                    ParameterName = "@diag_name",
                    Value = diagnosisName
                };
                command.Parameters.Add(diagnosisNameParam);
                command.ExecuteNonQuery();
            }
        }

        public void DeleteDiagnosis(int diagnosisId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_delDiag, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter diagnosisIdParam = new SqlParameter
                {
                    ParameterName = "@diag_id",
                    Value = diagnosisId
                };
                command.Parameters.Add(diagnosisIdParam);
                command.ExecuteNonQuery();
            }
        }

        public Diagnosis[] GetDiagnoses()
        {
            List<Diagnosis> diagnoses = new List<Diagnosis>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_allDiag, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        var diagnosis = new Diagnosis
                        {
                            DiagnosisId = int.Parse(reader["diagnosis_id"].ToString()),
                            DiagnosisName = reader["diagnosis_name"].ToString()
                        };
                        diagnoses.Add(diagnosis);
                    }
                }
                reader.Close();
            }
            return diagnoses.ToArray();
        }

        public void UpdateDiagnosis(int diagnosisId, string diagnosisName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_updDiag, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter diagnosisIdParam = new SqlParameter
                {
                    ParameterName = "@diag_id",
                    Value = diagnosisId
                };
                command.Parameters.Add(diagnosisIdParam);
                SqlParameter diagnosisNameParam = new SqlParameter
                {
                    ParameterName = "@diag_name",
                    Value = diagnosisName
                };
                command.Parameters.Add(diagnosisNameParam);
                command.ExecuteNonQuery();
            }
        }
    }
}

using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using EC.Common.Models;

namespace EC.DA.Repositories
{
    public class DrugRepository : IDrugRepository
    {
        private readonly string _allDrugs = "GetAllDrugs";
        private readonly string _addDrug = "AddDrug";
        private readonly string _delDrug = "DeleteDrug";
        private readonly string _updDrug = "UpdateDrug";

        private readonly string _getDrugList = "GetDrugsListsByRecordId";
        private readonly string _addDrugToList = "AddDrugToDrugList";
        private readonly string _delDrugFromList = "DeleteDrugFromDrugList";
        private readonly string _updDrugList = "UpdateDrugList";

        private readonly string connectionString = ConfigurationManager.ConnectionStrings["EcDbConnection"].ConnectionString;

        public void AddDrug(string drugName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_addDrug, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter drugNameParam = new SqlParameter
                {
                    ParameterName = "@drug_name",
                    Value = drugName
                };
                command.Parameters.Add(drugNameParam);
                command.ExecuteNonQuery();
            }
        }

        public void DeleteDrug(int drugId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_delDrug, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter drugIdParam = new SqlParameter
                {
                    ParameterName = "@drug_id",
                    Value = drugId
                };
                command.Parameters.Add(drugIdParam);
                command.ExecuteNonQuery();
            }
        }

        public Drug[] GetDrugs()
        {
            List<Drug> drugs = new List<Drug>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_allDrugs, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        var drug = new Drug
                        {
                            DrugId = int.Parse(reader["drug_id"].ToString()),
                            DrugName = reader["drug_name"].ToString()
                        };
                        drugs.Add(drug);
                    }
                }
                reader.Close();
            }
            return drugs.ToArray();
        }

        public void UpdateDrug(int drugId, string drugName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_updDrug, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter drugIdParam = new SqlParameter
                {
                    ParameterName = "@drug_id",
                    Value = drugId
                };
                command.Parameters.Add(drugIdParam);
                SqlParameter drugNameParam = new SqlParameter
                {
                    ParameterName = "@drug_name",
                    Value = drugName
                };
                command.Parameters.Add(drugNameParam);
                command.ExecuteNonQuery();
            }
        }


        public void AddDrugToDrugList(int recordId, int drugId, string admMode, int duration)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_addDrugToList, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter recordIdParam = new SqlParameter
                {
                    ParameterName = "@record_id",
                    Value = recordId
                };
                command.Parameters.Add(recordIdParam);
                SqlParameter drudIdParam = new SqlParameter
                {
                    ParameterName = "@drug_id",
                    Value = drugId
                };
                command.Parameters.Add(drudIdParam);
                SqlParameter admModeParam = new SqlParameter
                {
                    ParameterName = "@mode",
                    Value = admMode
                };
                command.Parameters.Add(admModeParam);
                SqlParameter durationParam = new SqlParameter
                {
                    ParameterName = "@duration",
                    Value = duration
                };
                command.Parameters.Add(durationParam);
                command.ExecuteNonQuery();
            }
        }

        public void DeleteDrugFromDrugList(int recordId, int drugId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_delDrugFromList, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter recordIdParam = new SqlParameter
                {
                    ParameterName = "@record_id",
                    Value = recordId
                };
                command.Parameters.Add(recordIdParam);
                SqlParameter drudIdParam = new SqlParameter
                {
                    ParameterName = "@drug_id",
                    Value = drugId
                };
                command.Parameters.Add(drudIdParam);
                command.ExecuteNonQuery();
            }
        }

        public Drug[] GetDrugList(int recordId)
        {
            List<Drug> drugs = new List<Drug>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_getDrugList, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter recordIdParam = new SqlParameter
                {
                    ParameterName = "@record_id",
                    Value = recordId
                };
                command.Parameters.Add(recordIdParam);

                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        var drug = new Drug
                        {
                            RecordId = int.Parse(reader["record_id"].ToString()),
                            DrugId = int.Parse(reader["drug_id"].ToString()),
                            DrugName = reader["drug_name"].ToString(),
                            AdministrationMode = reader["administration_mode"].ToString(),
                            TreatmentDuration = int.Parse(reader["treatment_duration"].ToString())
                        };
                        drugs.Add(drug);
                    }
                }
                reader.Close();
            }
            return drugs.ToArray();
        }

        public void UpdateDrugList(int recordId, int drugId, string admMode, int duration)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_updDrugList, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter recordIdParam = new SqlParameter
                {
                    ParameterName = "@record_id",
                    Value = recordId
                };
                command.Parameters.Add(recordIdParam);
                SqlParameter drudIdParam = new SqlParameter
                {
                    ParameterName = "@drug_id",
                    Value = drugId
                };
                command.Parameters.Add(drudIdParam);
                SqlParameter admModeParam = new SqlParameter
                {
                    ParameterName = "@mode",
                    Value = admMode
                };
                command.Parameters.Add(admModeParam);
                SqlParameter durationParam = new SqlParameter
                {
                    ParameterName = "@duration",
                    Value = duration
                };
                command.Parameters.Add(durationParam);
                command.ExecuteNonQuery();
            }
        }
    }
}
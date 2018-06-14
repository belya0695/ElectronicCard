using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using EC.Common.Models;

namespace EC.DA.Repositories
{
    public class ProcedureRepository : IProcedureRepository
    {
        private readonly string _allProcedures = "GetAllProcedures";
        private readonly string _addProcedure = "AddMedProcedure";
        private readonly string _delProcedure = "DeleteMedProcedure";
        private readonly string _updProcedure = "UpdateMedProcedure";
        private readonly string _getProcedure = "GetProcedureById";

        private readonly string _getProcedureList = "GetProceduresListsByRecordId";
        private readonly string _addProcedureToList = "AddProcedureToProcedureList";
        private readonly string _delProcedureFromList = "DeleteProcedureFromProcedureList";
        private readonly string _updProcedureList = "UpdateProcedureList";

        private readonly string connectionString = ConfigurationManager.ConnectionStrings["EcDbConnection"].ConnectionString;

        public void AddProcedure(string procedureName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_addProcedure, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter procedureNameParam = new SqlParameter
                {
                    ParameterName = "@proc_name",
                    Value = procedureName
                };
                command.Parameters.Add(procedureNameParam);
                command.ExecuteNonQuery();
            }
        }

        public void DeleteProcedure(int procedureId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_delProcedure, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter procedureIdParam = new SqlParameter
                {
                    ParameterName = "@proc_id",
                    Value = procedureId
                };
                command.Parameters.Add(procedureIdParam);
                command.ExecuteNonQuery();
            }
        }
        
        public Procedure[] GetProcedures()
        {
            List<Procedure> procedures = new List<Procedure>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_allProcedures, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        var procedure = new Procedure
                        {
                            ProcedureId = int.Parse(reader["procedure_id"].ToString()),
                            ProcedureName = reader["procedure_name"].ToString()
                        };
                        procedures.Add(procedure);
                    }
                }
                reader.Close();
            }
            return procedures.ToArray();
        }

        public void UpdateProcedure(int procedureId, string procedureName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_updProcedure, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter procedureIdParam = new SqlParameter
                {
                    ParameterName = "@proc_id",
                    Value = procedureId
                };
                command.Parameters.Add(procedureIdParam);
                SqlParameter procedureNameParam = new SqlParameter
                {
                    ParameterName = "@proc_name",
                    Value = procedureName
                };
                command.Parameters.Add(procedureNameParam);
                command.ExecuteNonQuery();
            }
        }

        public Procedure GetProcedure(int procedureId)
        {
            Procedure procedure = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_getProcedure, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter procedureIdParam = new SqlParameter
                {
                    ParameterName = "@proc_id",
                    Value = procedureId
                };
                command.Parameters.Add(procedureIdParam);
                var reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        procedure = new Procedure
                        {
                            ProcedureId = int.Parse(reader["procedure_id"].ToString()),
                            ProcedureName = reader["procedure_name"].ToString()
                        };
                    }
                }
                reader.Close();
            }
            return procedure;
        }

        public void AddProcedureToProcedureList(int recordId, int procedureId, string admMode, int duration)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_addProcedureToList, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter recordIdParam = new SqlParameter
                {
                    ParameterName = "@record_id",
                    Value = recordId
                };
                command.Parameters.Add(recordIdParam);
                SqlParameter procedureIdParam = new SqlParameter
                {
                    ParameterName = "@proc_id",
                    Value = procedureId
                };
                command.Parameters.Add(procedureIdParam);
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

        public void DeleteProcedureFromProcedureList(int recordId, int procedureId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_delProcedureFromList, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter recordIdParam = new SqlParameter
                {
                    ParameterName = "@record_id",
                    Value = recordId
                };
                command.Parameters.Add(recordIdParam);
                SqlParameter procedureIdParam = new SqlParameter
                {
                    ParameterName = "@proc_id",
                    Value = procedureId
                };
                command.Parameters.Add(procedureIdParam);
                command.ExecuteNonQuery();
            }
        }

        public Procedure[] GetProcedureList(int recordId)
        {
            List<Procedure> procedures = new List<Procedure>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_getProcedureList, connection)
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
                        var procedure = new Procedure
                        {
                            RecordId = int.Parse(reader["record_id"].ToString()),
                            ProcedureId = int.Parse(reader["drug_id"].ToString()),
                            ProcedureName = reader["drug_name"].ToString(),
                            AdministrationMode = reader["administration_mode"].ToString(),
                            TreatmentDuration = int.Parse(reader["treatment_duration"].ToString())
                        };
                        procedures.Add(procedure);
                    }
                }
                reader.Close();
            }
            return procedures.ToArray();
        }

        public void UpdateProcedureList(int recordId, int procedureId, string admMode, int duration)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_updProcedureList, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                SqlParameter recordIdParam = new SqlParameter
                {
                    ParameterName = "@record_id",
                    Value = recordId
                };
                command.Parameters.Add(recordIdParam);
                SqlParameter procedureIdParam = new SqlParameter
                {
                    ParameterName = "@proc_id",
                    Value = procedureId
                };
                command.Parameters.Add(procedureIdParam);
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
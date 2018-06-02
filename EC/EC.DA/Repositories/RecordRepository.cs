using System;
using System.Collections.Generic;
using EC.DA.Interfaces;
using EC.Common.Models;
using System.Data.SqlClient;
using System.Configuration;

namespace EC.DA.Repositories
{
    public class RecordRepository : IRecordRepository
    {
        private readonly string RecordById = "GetRecordById";
        private readonly string RecordByPatientIdAndDate = "GetRecordByPatientIdAndDate";
        private readonly string RecordDatesByPatientId = "GetRecordDatesByPatientId";

        private readonly string connectionString = ConfigurationManager.ConnectionStrings["EcDbConnection"].ConnectionString;

        public Record GetRecordById(int recordId)
        {
            Record record = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(RecordById, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter patientIdParam = new SqlParameter
                {
                    ParameterName = "@rec_id",
                    Value = recordId
                };
                command.Parameters.Add(patientIdParam);

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        record = new Record
                        {
                            date = DateTime.Parse(reader["record_date"].ToString()),
                            diagnosisName = reader["diagnosis_name"].ToString(),
                            doctorsFirstName = reader["doctors_first_name"].ToString(),
                            doctorsLastName = reader["doctors_last_name"].ToString(),
                            doctorsPost = reader["post_name"].ToString(),
                            IsSickLeaveIssued = bool.Parse(reader["issued"].ToString()),
                            patientFirstName = reader["first_name"].ToString(),
                            patientLastName = reader["last_name"].ToString(),
                            patientMiddleName = reader["middle_name"].ToString(),
                            recordId = int.Parse(reader["record_id"].ToString()),
                            sickLeaveId = int.Parse(reader["sick_leave_id"].ToString()),
                            validFrom = DateTime.Parse(reader["valid_from"].ToString()),
                            validTo = DateTime.Parse(reader["valid_to"].ToString())

                        };
                    }
                }
                reader.Close();
            }
            return record;
        }

        public List<Record> GetRecordByPatientIdAndDate(int patientId, DateTime recordDate)
        {
            List<Record> recordsList = new List<Record>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(RecordByPatientIdAndDate, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter patientIdParam = new SqlParameter
                {
                    ParameterName = "@patient_id",
                    Value = patientId
                };
                command.Parameters.Add(patientIdParam);

                SqlParameter dateParam = new SqlParameter
                {
                    ParameterName = "@date",
                    Value = recordDate
                };
                command.Parameters.Add(dateParam);

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        var record = new Record
                        {
                            date = DateTime.Parse(reader["record_date"].ToString()),
                            diagnosisName = reader["diagnosis_name"].ToString(),
                            doctorsFirstName = reader["doctors_first_name"].ToString(),
                            doctorsLastName = reader["doctors_last_name"].ToString(),
                            doctorsPost = reader["post_name"].ToString(),
                            IsSickLeaveIssued = bool.Parse(reader["issued"].ToString()),
                            patientFirstName = reader["first_name"].ToString(),
                            patientLastName = reader["last_name"].ToString(),
                            patientMiddleName = reader["middle_name"].ToString(),
                            recordId = int.Parse(reader["record_id"].ToString()),
                            sickLeaveId = int.Parse(reader["sick_leave_id"].ToString()),
                            validFrom = DateTime.Parse(reader["valid_from"].ToString()),
                            validTo = DateTime.Parse(reader["valid_to"].ToString()),
                            patientId = int.Parse(reader["patient_id"].ToString())
                        };
                        recordsList.Add(record);
                    }
                }
                reader.Close();
            }
            return recordsList;
        }

        public List<Record> GetRecordDatesByPatientId(int patientId)
        {
            List<Record> recordsList = new List<Record>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(RecordDatesByPatientId, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter patientIdParam = new SqlParameter
                {
                    ParameterName = "@patient_id",
                    Value = patientId
                };
                command.Parameters.Add(patientIdParam);

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        var record = new Record
                        {
                            date = DateTime.Parse(reader["record_date"].ToString()),
                            recordId = int.Parse(reader["record_id"].ToString())
                        };
                        recordsList.Add(record);
                    }
                }
                reader.Close();
            }
            return recordsList;
        }
    }
}
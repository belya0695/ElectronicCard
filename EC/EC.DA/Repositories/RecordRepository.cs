using System;
using System.Collections.Generic;
using EC.Common.Models;
using System.Data.SqlClient;
using System.Configuration;

namespace EC.DA.Repositories
{
    public class RecordRepository : IRecordRepository
    {
        private readonly string _recordById = "GetRecordById";
        private readonly string _recordByPatientIdAndDate = "GetRecordByPatientIdAndDate";
        private readonly string _recordDatesByPatientId = "GetRecordDatesByPatientId";
        private readonly string _recordByPatientIdAndDiagnosis = "GetRecordByPatientIdAndDiagnosis";
        private readonly string _recordByPatientIdAndDoctorsPost = "GetRecordByPatientIdAndDoctorsPost";

        private readonly string connectionString = ConfigurationManager.ConnectionStrings["EcDbConnection"].ConnectionString;

        public Record GetRecordById(int recordId)
        {
            Record record = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_recordById, connection)
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

        public Record[] GetRecordByPatientIdAndDate(int patientId, DateTime recordDate)
        {
            List<Record> recordsList = new List<Record>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_recordByPatientIdAndDate, connection)
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
                            validTo = DateTime.Parse(reader["valid_to"].ToString())
                        };
                        recordsList.Add(record);
                    }
                }
                reader.Close();
            }
            return recordsList.ToArray();
        }

        public Record[] GetRecordByPatientIdAndDiagnosis(int patientId, string diagnosis)
        {
            List<Record> recordsList = new List<Record>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_recordByPatientIdAndDiagnosis, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter patientIdParam = new SqlParameter
                {
                    ParameterName = "@patient_id",
                    Value = patientId
                };
                command.Parameters.Add(patientIdParam);

                SqlParameter diagnosisParam = new SqlParameter
                {
                    ParameterName = "@diagnosis",
                    Value = diagnosis
                };
                command.Parameters.Add(diagnosisParam);

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
                            validTo = DateTime.Parse(reader["valid_to"].ToString())
                        };
                        recordsList.Add(record);
                    }
                }
                reader.Close();
            }
            return recordsList.ToArray();
        }

        public Record[] GetRecordByPatientIdAndDoctorsPost(int patientId, string post)
        {
            List<Record> recordsList = new List<Record>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_recordByPatientIdAndDoctorsPost, connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };

                SqlParameter patientIdParam = new SqlParameter
                {
                    ParameterName = "@patient_id",
                    Value = patientId
                };
                command.Parameters.Add(patientIdParam);

                SqlParameter postParam = new SqlParameter
                {
                    ParameterName = "@post_name",
                    Value = post
                };
                command.Parameters.Add(postParam);

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
                            validTo = DateTime.Parse(reader["valid_to"].ToString())
                        };
                        recordsList.Add(record);
                    }
                }
                reader.Close();
            }
            return recordsList.ToArray();
        }

        public Record[] GetRecordDatesByPatientId(int patientId)
        {
            List<Record> recordsList = new List<Record>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(_recordDatesByPatientId, connection)
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
                            date = DateTime.Parse(reader["record_date"].ToString())
                        };
                        recordsList.Add(record);
                    }
                }
                reader.Close();
            }
            return recordsList.ToArray();
        }
    }
}
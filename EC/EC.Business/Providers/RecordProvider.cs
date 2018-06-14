using System;
using EC.Common.Models;
using EC.DA.Repositories;

namespace EC.Business.Providers
{
    public class RecordProvider : IRecordProvider
    {
        private readonly IRecordRepository _recordRepository;

        public RecordProvider(IRecordRepository recordRepository)
        {
            _recordRepository = recordRepository;
        }

        public void AddRecordAndSickLeave(int patientId, int diagnosisId, int doctorId)
        {
            _recordRepository.AddRecordAndSickLeave(patientId, diagnosisId, doctorId);
        }

        public void DeleteRecordAndSickLeave(int recordId)
        {
            _recordRepository.DeleteRecordAndSickLeave(recordId);
        }

        public Record GetRecordById(int recordId)
        {
            return _recordRepository.GetRecordById(recordId);
        }

        public Record[] GetRecordByPatientIdAndDate(int patientId, DateTime recordDate)
        {
            return _recordRepository.GetRecordByPatientIdAndDate(patientId, recordDate);
        }

        public Record[] GetRecordByPatientIdAndDiagnosis(int patientId, string diagnosis)
        {
            return _recordRepository.GetRecordByPatientIdAndDiagnosis(patientId, diagnosis);
        }

        public Record[] GetRecordByPatientIdAndDoctorsPost(int patientId, string post)
        {
            return _recordRepository.GetRecordByPatientIdAndDoctorsPost(patientId, post);
        }

        public Record[] GetRecordDatesByPatientId(int patientId)
        {
            return _recordRepository.GetRecordDatesByPatientId(patientId);
        }
    }
}

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

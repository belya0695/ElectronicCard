using System;
using System.Collections.Generic;
using EC.Business.Interfaces;
using EC.Common.Models;
using EC.DA.Interfaces;

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

        public List<Record> GetRecordByPatientIdAndDate(int patientId, DateTime recordDate)
        {
            return _recordRepository.GetRecordByPatientIdAndDate(patientId, recordDate);
        }

        public List<Record> GetRecordDatesByPatientId(int patientId)
        {
            return _recordRepository.GetRecordDatesByPatientId(patientId);
        }
    }
}
